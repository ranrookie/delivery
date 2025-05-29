package com.sky.task;

import com.sky.entity.Orders;
import com.sky.mapper.OrderMapper;
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
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private RedisTemplate<String,String> myStringRedisTemplate;
    @Autowired
    public OrderTask(OrderMapper orderMapper, RedisTemplate<String,String> myStringRedisTemplate) {
        this.orderMapper = orderMapper;
        this.myStringRedisTemplate = myStringRedisTemplate;
    }
    @Scheduled(cron = "0 * * * * ?")
    @Transactional
    public void processUnpaidOrder() {
        log.info("定时处理超时订单：{}", LocalDateTime.now());
        LocalDateTime time = LocalDateTime.now().minusMinutes(15);
        List<Orders> list = orderMapper.geytByStatusAndTime(Orders.PENDING_PAYMENT,time);
        if(list!=null && !list.isEmpty()) {
            for(Orders order : list) {
                order.setStatus(Orders.CANCELLED);
                order.setCancelTime(LocalDateTime.now());
                order.setCancelReason("支付时间超时");
                orderMapper.update(order);
            }
        }
    }
    @Scheduled(fixedRate = 10 * 60 * 1000)
    public void processUnacceptedOrder() {
        log.info("定时处理未接单订单：{}", LocalDateTime.now());
        long now = System.currentTimeMillis()/1000;
        Set<String> idSet = myStringRedisTemplate.opsForZSet().rangeByScore("order:delay:queue",0,now,0,100);
        if(idSet==null || idSet.isEmpty())
        {
            log.info("无超时订单");
            return;
        }
        Set<Long> longIdSet = idSet.stream().map(Long::valueOf).collect(Collectors.toSet());

        List<Orders> ordersList = orderMapper.queryOrdersByIdSet(longIdSet);

        if(ordersList!=null && !ordersList.isEmpty()) {
            List<String> toRemove = new ArrayList<>();
            for(Orders order : ordersList) {
                if(Orders.TO_BE_CONFIRMED.equals(order.getStatus())) {
                    order.setStatus(Orders.CANCELLED);
                    order.setCancelTime(LocalDateTime.now());
                    order.setCancelReason("商家超过24小时未接单，已自动取消");
                    orderMapper.update(order);
                }
                toRemove.add(String.valueOf(order.getId()));
            }
            //批量删除已处理订单
            myStringRedisTemplate.opsForZSet().remove("order:delay:queue", toRemove.toArray());
            log.info("本次处理订单数量：{}", idSet.size());
        }
    }
    @Scheduled(cron = "0 0 1 * * ?")
    public void processDeliveryOrder() {
        log.info("定时处理派送中订单：{}", LocalDateTime.now());
        LocalDateTime time = LocalDateTime.now().minusHours(1);
        List<Orders> list = orderMapper.geytByStatusAndTime(Orders.DELIVERY_IN_PROGRESS,time);
        if(list!=null && !list.isEmpty()) {
            for(Orders order : list) {
                order.setStatus(Orders.COMPLETED);
                orderMapper.update(order);
            }
        }
    }
}
