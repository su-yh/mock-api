package com.cdap.mock.biz.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author suyh
 * @since 2024-12-16
 */
@TableName("cohort_calculation_channel_code")
@Data
public class CohortCalculationChannelCodeEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long pnId;
    private Long channel;
    // sub_channel 中的channel_code
    private String channelCode;
    // cohort_roi_calculation 的主键ID
    private Long pid;

    private Date creationTime;
}
