package com.cdap.mock.biz.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@TableName("adjust_ad")
@Data
public class AdjustAdEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String appToken;

    private String tracker;

    private Integer dates;

    private String key;
    private String source;

    private String pkg;

    private String channel;

    /**
     * 广告系列 ID
     */
    private String campaignId;

    /**
     * 广告系列名
     */
    private String campaignName;

    /**
     * 广告组 ID
     */
    private String adGroupId;

    /**
     * 广告组名
     */
    private String adGroupName;

    /**
     * 广告 ID
     */
    private String adId;

    /**
     * 广告名
     */
    private String adName;

    /**
     * 广告素材 ID
     */
    private String creativeId;

    /**
     * 广告素材名
     */
    private String creativeName;
    /**
     * adjust 应用 id
     */
    private String appId;

    /**
     * adjust 应用名
     */
    private String appName;

    /**
     * 点击 referer
     */
    private String clickReferer;

    /**
     * 归因网络
     */
    private String network;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 修改时间
     */
    private Date updated;

}
