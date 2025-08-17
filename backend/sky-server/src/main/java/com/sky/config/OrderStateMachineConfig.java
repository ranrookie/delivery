package com.sky.config;

import com.sky.enumeration.OrderEvent;
import com.sky.enumeration.OrderStatus;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.statemachine.action.Action;
import org.springframework.statemachine.config.EnableStateMachineFactory;
import org.springframework.statemachine.config.StateMachineConfigurerAdapter;
import org.springframework.statemachine.config.builders.StateMachineStateConfigurer;
import org.springframework.statemachine.config.builders.StateMachineTransitionConfigurer;
import java.util.EnumSet;
@Configuration
@EnableStateMachineFactory
@Slf4j

public class OrderStateMachineConfig extends StateMachineConfigurerAdapter<OrderStatus, OrderEvent> { @Override
    public void configure(StateMachineStateConfigurer<OrderStatus, OrderEvent> states) throws Exception {
        states.withStates().initial(OrderStatus.PENDING_PAYMENT).states(EnumSet.allOf(OrderStatus.class));
    }
    @Override
    public void configure(StateMachineTransitionConfigurer<OrderStatus, OrderEvent> transitions) throws Exception {
        transitions
                // 支付：待付款 -> 待接单
                .withExternal()
                .source(OrderStatus.PENDING_PAYMENT).target(OrderStatus.TO_BE_CONFIRMED).event(OrderEvent.PAY)
                .action(logStateChange())

                .and()
                // 取消：待付款 -> 已取消
                .withExternal()
                .source(OrderStatus.PENDING_PAYMENT).target(OrderStatus.CANCELLED).event(OrderEvent.CANCEL)
                .action(logStateChange())

                .and()
                // 商家接单：待接单 -> 已接单
                .withExternal()
                .source(OrderStatus.TO_BE_CONFIRMED).target(OrderStatus.CONFIRMED).event(OrderEvent.ACCEPT)
                .action(logStateChange())

                .and()
                // 用户取消：待接单 -> 已取消
                .withExternal()
                .source(OrderStatus.TO_BE_CONFIRMED).target(OrderStatus.CANCELLED).event(OrderEvent.CANCEL)
                .action(logStateChange())

                .and()
                // 派送开始：已接单 -> 派送中
                .withExternal()
                .source(OrderStatus.CONFIRMED).target(OrderStatus.DELIVERY_IN_PROGRESS).event(OrderEvent.DELIVER)
                .action(logStateChange())

                .and()
                // 完成订单：派送中 -> 已完成
                .withExternal()
                .source(OrderStatus.DELIVERY_IN_PROGRESS).target(OrderStatus.COMPLETED).event(OrderEvent.COMPLETE)
                .action(logStateChange());
    }
    private Action<OrderStatus, OrderEvent> logStateChange() {
        return context -> {
            String orderNumber = String.valueOf(context.getMessageHeader("orderNumber"));
            OrderStatus source = context.getSource() != null ? context.getSource().getId() : null;
            OrderStatus target = context.getTarget() != null ? context.getTarget().getId() : null;
            OrderEvent event = context.getEvent();
            log.info("【状态机变更】订单Number：{} | 事件：{} | 状态：{} → {}", orderNumber, event, source, target);
        };    }

}
