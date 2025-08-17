package com.sky.service.impl;

import com.sky.entity.Orders;
import com.sky.enumeration.OrderEvent;
import com.sky.enumeration.OrderStatus;
import com.sky.exception.UpdateOrderException;
import com.sky.mapper.OrderMapper;
import com.sky.service.OrderStatusService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.statemachine.StateMachine;
import org.springframework.statemachine.config.StateMachineFactory;
import org.springframework.statemachine.support.DefaultStateMachineContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Slf4j
@Service
public class OrderStatusServiceImpl implements OrderStatusService {
    private final StateMachineFactory<OrderStatus, OrderEvent> stateMachineFactory;
    private final OrderMapper orderMapper;
    @Autowired
    public OrderStatusServiceImpl(StateMachineFactory<OrderStatus, OrderEvent> stateMachineFactory, OrderMapper orderMapper) {
        this.stateMachineFactory = stateMachineFactory;
        this.orderMapper = orderMapper;
    }

    @Transactional
    public void handleEvent(Orders orders, OrderEvent event) {
        int code = orders.getStatus();
        OrderStatus orderStatus = OrderStatus.fromCode(code);
        StateMachine<OrderStatus, OrderEvent> stateMachine = stateMachineFactory.getStateMachine(String.valueOf(orders.getNumber()));
        // 把当前订单状态注入状态机
        try {

            stateMachine.stop();
            stateMachine.getStateMachineAccessor().doWithAllRegions(access -> {
                access.resetStateMachine(
                        new DefaultStateMachineContext<>(orderStatus, null, null, null)
                );
            });
            stateMachine.start();
            // 发事件
            boolean result = stateMachine.sendEvent(MessageBuilder
                    .withPayload(event)
                    .setHeader("orderNumber", orders.getNumber()) // 关键点：设置消息头
                    .build());
            if (result) {
                OrderStatus newStatus = stateMachine.getState().getId();
                orders.setStatus(newStatus.getCode());
                int row = orderMapper.update(orders);
                if(row!=1) {
                    throw new UpdateOrderException("当前订单已被修改，请稍后重试");
                }
            } else {
                log.warn("状态机处理失败，订单ID: {}, 当前状态: {}, 事件: {}", orders.getId(), orderStatus, event);
                throw new RuntimeException("订单状态转换失败");
            }
        }
        finally {
            stateMachine.stop();
        }
    }

    @Transactional
    public Orders triggerEvent(Long orderId, OrderEvent event) {
        Orders orders = orderMapper.queryOrderById(orderId);
        if (orders == null) throw new IllegalArgumentException("订单不存在: " + orderId);

        // 业务前置校验（可选）：如已完成/取消后不允许再流转
        OrderStatus cur = OrderStatus.fromCode(orders.getStatus());
        if (cur == OrderStatus.COMPLETED || cur == OrderStatus.CANCELLED) {
            return orders; // 幂等返回
        }

        // 复用你写的核心方法
        handleEvent(orders, event);
        return orders;
    }
}