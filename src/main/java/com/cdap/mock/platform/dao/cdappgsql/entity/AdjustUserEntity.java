package com.cdap.mock.platform.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author baomidou
 * @since 2024-03-12
 */
@TableName("adjust_user")
@Data
public class AdjustUserEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Integer dates;

    private String gaid;

    /**
     * 渠道
     */
    private String channel;

    /**
     * 包名
     */
    private String pkg;

    private String appId;

    private String appName;

    private String appToken;

    private String tracker;

    private String clickReferer;

    private Long installedAt;

    /**
     * 归因网络
     */
    private String network;

    /**
     * 广告平台
     */
    private String source;

    /**
     * 广告系列ID
     */
    private String campaignId;

    /**
     * 广告系列名
     */
    private String campaignName;

    /**
     * 广告组ID
     */
    private String adGroupId;

    /**
     * 广告组名
     */
    private String adGroupName;

    /**
     * 广告名
     */
    private String adName;

    /**
     * 广告素材ID
     */
    private String creativeId;

    /**
     * 素材名
     */
    private String creativeName;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 城市
     */
    private String city;

    /**
     * 运营商
     */
    private String isp;

    /**
     * 语言
     */
    private String language;

    /**
     * 设备名称
     */
    private String deviceName;

    /**
     * 设备系统版本
     */
    private String osVersion;

    /**
     * 时区
     */
    private String timezone;

    /**
     * 深度链接
     */
    private String deeplink;

    /**
     * 网络uuid
     */
    private String webUuid;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 修改时间
     */
    private Date updated;

    /**
     * 广告key
     */
    private String key;

    @TableField("ad_id")
    private String adId; //广告id

    @TableField(value = "adid")
    private String adidAlias;
}
