package com.cdap.mock.biz.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 投放方与广告系列关联表
 * </p>
 */
@TableName("ad_advertiser_campaign")
@Data
public class AdAdvertiserCampaignEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 投放方id
     */
    private Long advertiserId;

    /**
     * 广告系列id
     */
    private String campaignId;

    /**
     * 渠道号
     */
    private String channel;

    /**
     * PN
     */
    private String pn;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 更新时间
     */
    private Date updated;

    /**
     * 投放平台
     */
    private String source;

    /**
     * 是否可用[0:不可用,1:可用]
     */
    private Integer enable;

}
