package com.cdap.mock.biz.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author suyh
 * @since 2024-06-24
 */
@Data
@TableName("adjust_cost_record")
public class AdjustCostRecordEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 日期
     */
    private Integer dates;

    /**
     * 渠道号
     */
    private String channel;

    /**
     * 包名
     */
    private String pkg;

    /**
     * adjust应用token
     */
    private String appToken;

    /**
     * 广告投放平台
     */
    private String source;

    /**
     * 花费
     */
    private BigDecimal cost;

    /**
     * 广告系列ID
     */
    private String campaignId;

    /**
     * 广告组ID
     */
    private String adGroupId;

    /**
     * 广告ID
     */
    private String adId;

    /**
     * 广告key
     */
    private String key;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 修改时间
     */
    private Date updated;



}
