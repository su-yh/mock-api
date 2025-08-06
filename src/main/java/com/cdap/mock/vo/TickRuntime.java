package com.cdap.mock.vo;

import lombok.Data;

/**
 * @author suyh
 * @since 2024-12-19
 */
@Data
public class TickRuntime {
    private TickAttribute tickAttribute;
    private Long timestampMillis;   // tick 时间戳
    private Integer dates;  // tick 日期
}
