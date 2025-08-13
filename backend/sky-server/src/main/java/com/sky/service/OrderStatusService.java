package com.sky.service;

import com.sky.entity.Orders;
import com.sky.enumeration.OrderEvent;

public interface OrderStatusService {
    /**
     * 处理状态转换事件
     * @param orders
     * @param event
     */
    void handleEvent(Orders orders, OrderEvent event);

    /**
     * 根据id进行处理
     * @param id
     * @param event
     * @return
     */
    Orders triggerEvent(Long id, OrderEvent event);
}
