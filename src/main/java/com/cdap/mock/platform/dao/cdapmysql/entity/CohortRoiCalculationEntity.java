package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author suyh
 * @since 2024-12-16
 */
@TableName("cohort_roi_calculation")
@Data
public class CohortRoiCalculationEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Integer calculationType;
    private String calculationName;
    private Long pnId;
    private Integer status;

    private Date creation_time;
    private Date update_time;
}
