package com.sky.enumeration;

public enum OrderEvent {
    PAY,        // 支付
    CANCEL,     // 用户取消订单
    ACCEPT,     // 商家接单
    DELIVER,    // 派送开始
    COMPLETE    // 完成订单
}
