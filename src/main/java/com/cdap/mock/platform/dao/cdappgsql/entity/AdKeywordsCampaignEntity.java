package com.cdap.mock.platform.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 关键字广告系列表
 * </p>
 */
@Data
@TableName("ad_keywords_campaign")
public class AdKeywordsCampaignEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    private Long id;
    @Schema(description = "权限关键字")
    private String keyword;

    @Schema(description = "广告系列ID")
    private String campaignId;

    @Schema(description = "广告系列名")
    private String campaignName;

    @Schema(description = "渠道")
    private String channel;

    @Schema(description = "创建日期")
    private Date created;

    @Schema(description = "日期")
    private Integer dates;

    @Schema(description = "投放平台")
    private String source;
}
