package com.cdap.mock.constants;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Getter;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Getter
public enum DataSourceEnums {
    FLINK_CDS(DataSourceNames.FLINK_CDS),
    FLINK_PG_CDAP(DataSourceNames.FLINK_PG_CDAP),
    ;

    @EnumValue
    private final String code;

    DataSourceEnums(String code) {
        this.code = code;
    }
}
