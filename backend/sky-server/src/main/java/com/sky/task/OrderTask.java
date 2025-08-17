package com.sky.task;

import com.sky.entity.Orders;
import com.sky.enumeration.OrderEvent;
import com.sky.mapper.OrderMapper;
import com.sky.service.OrderStatusService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Component
@Slf4j
public class OrderTask {
    private final OrderMapper orderMapper;
    private final RedisTemplate<String,String> myStringRedisTemplate;
    private final OrderStatusService orderStatusService;
    @Autowired
    public OrderTask(OrderStatusService orderStatusService, OrderMapper orderMapper, RedisTemplate<String,String> myStringRedisTemplate) {
        this.orderMapper = orderMapper;
        this.myStringRedisTemplate = myStringRedisTemplate;
        this.orderStatusService = orderStatusService;
    }

    @Scheduled(cron = "0 * * * * ?")
    @Transactional
    public void processUnpaidOrder() {
        LocalDateTime time = LocalDateTime.now().minusMinutes(15);
        List<Orders> list = orderMapper.getByStatusAndTime(Orders.PENDING_PAYMENT,time);
        if(list!=null && !list.isEmpty()) {
            for(Orders order : list) {
                order.setCancelTime(LocalDateTime.now());
                order.setCancelReason("支付时间超时");
                orderStatusService.handleEvent(order, OrderEvent.CANCEL);
            }
            log.info("处理 {} 个超时未支付订单", list.size());
        }
    }

    //商家长时间24小时未接单，自动取消，通过redis实现队列按过期时间排序，先获取redis缓存中最旧的前一百订单过期订单进行取消
    @Scheduled(fixedRate = 10 * 60 * 1000)
    public void processUnacceptedOrder() {
        long now = System.currentTimeMillis()/1000;
        Set<String> idSet = myStringRedisTemplate.opsForZSet().rangeByScore("order:delay:queue",0,now,0,100);
        if(idSet==null || idSet.isEmpty())
        {
            return;
        }
        Set<Long> longIdSet = idSet.stream().map(Long::valueOf).collect(Collectors.toSet());

        List<Orders> ordersList = orderMapper.queryOrdersByIdSetAndStatus(longIdSet, Orders.TO_BE_CONFIRMED);

        if(ordersList!=null && !ordersList.isEmpty()) {
            for(Orders order : ordersList) {
                order.setCancelTime(LocalDateTime.now());
                order.setCancelReason("商家超过24小时未接单，已自动取消");
                orderStatusService.handleEvent(order, OrderEvent.CANCEL);
            }
            //批量删除已处理订单
            myStringRedisTemplate.opsForZSet().remove(
                    "order:delay:queue",
                    ordersList.stream()
                            .map(o -> String.valueOf(o.getId()))
                            .toArray()
            );
            log.info("自动取消 {} 个 24 小时未接单的订单，订单ID: {}",
                    ordersList.size(),
                    ordersList.stream().map(Orders::getId).collect(Collectors.toList())
            );
        }
    }

    //自动完成订单，模拟骑手送到
    @Scheduled(cron = "0 0 1 * * ?")
    public void processDeliveryOrder() {
        LocalDateTime time = LocalDateTime.now().minusHours(1);
        List<Orders> list = orderMapper.getByStatusAndTime(Orders.DELIVERY_IN_PROGRESS,time);
        if(list!=null && !list.isEmpty()) {
            for(Orders order : list) {
                orderStatusService.handleEvent(order, OrderEvent.COMPLETE);
            }
            log.info("{}个订单送达", list.size());
        }
    }
}
