package com.sky.utils;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Component;

@Component
public class SnowflakeIdUtil {

    private final Snowflake snowflake = IdUtil.getSnowflake(1, 1);

    /** 生成 long 类型 ID */
    public long nextId() {
        return snowflake.nextId();
    }

    /** 生成 String 类型 ID（Long 转 String） */
    public String nextIdStr() {
        return String.valueOf(nextId());
    }

    /** 带业务前缀的订单号 */
    public String nextOrderId() {
        return "ORD" + nextId();
    }

    /** 统一生成后多种格式返回 */
    public IdBundle nextIdBundle() {
        long id = nextId();
        return new IdBundle(id, String.valueOf(id), "ORD" + id, "PAY" + id);
    }

    /** 封装返回结构 */
    @Data
    @AllArgsConstructor
    public static class IdBundle {
        private long id;
        private String idStr;
        private String orderId;
        private String paymentId;
    }
}
