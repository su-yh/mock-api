package com.cdap.mock.constants;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

/**
 * @author suyh
 * @since 2024-11-19
 */
@Getter
public enum MockModeEnums {
    NONE(0),
    TIMER_JOB(1),
    DATE_RAGE(2),
    TS_RANGE(3),
    ;

    @JsonValue
    @EnumValue
    private final int code;

    MockModeEnums(int code) {
        this.code = code;
    }
}
