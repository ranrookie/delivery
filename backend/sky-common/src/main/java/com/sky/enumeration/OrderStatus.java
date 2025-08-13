package com.sky.enumeration;

import lombok.Getter;

@Getter
public enum OrderStatus {
    PENDING_PAYMENT("PENDING_PAYMENT",1),       // 1：待付款
    TO_BE_CONFIRMED("TO_BE_CONFIRMED",2),   // 2：待接单
    CONFIRMED("CONFIRMED",3),       // 3：已接单
    DELIVERY_IN_PROGRESS("DELIVERY_IN_PROGRESS",4),     // 4：派送中
    COMPLETED("COMPLETED",5),      // 5：已完成
    CANCELLED("CANCELLED",6);      // 6：已取消
    private final String name;
    private final Integer code;
    OrderStatus(String name, Integer code) {
        this.name = name;
        this.code = code;
    }

    public static OrderStatus fromCode(Integer code) {
        for (OrderStatus orderStatus : OrderStatus.values()) {
            if (orderStatus.getCode().equals(code)) {
                return orderStatus;
            }
        }
        throw new IllegalArgumentException("Invalid code: " + code);
    }
}
