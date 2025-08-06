package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author suyh
 * @since 2024-12-16
 */
@TableName("cohort_roi_calculation_conf")
@Data
public class CohortRoiCalculationConfEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private BigDecimal rechargeFee;
    private BigDecimal withdrawalFee;
    private BigDecimal proportion;
    private BigDecimal departureFee;
    // cohort_calculation_channel_code 表的主键ID
    private Long pid;

    private Date creationTime;
    private Date updateTime;
}
