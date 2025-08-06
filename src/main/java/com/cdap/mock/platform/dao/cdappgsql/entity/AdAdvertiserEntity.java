package com.cdap.mock.platform.dao.cdappgsql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@TableName("ad_advertiser")
@Data
public class AdAdvertiserEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 投放方名称
     */
    private String name;

    /**
     * 创建用户id
     */
    private Long sysUserId;

    /**
     * 渠道号
     */
    private String channel;

    /**
     * 投放平台
     */
    private String source;

    /**
     * 创建时间
     */
    private Date created;

    /**
     * 更新时间
     */
    private Date updated;

    /**
     * 关键字（,号隔开）
     */
    private String keywords;

    /**
     * 【0 多个pn | 1 单个pn】所属于单独一个pn的投放方,用于方便投放日报的查询逻辑
     */
    private Integer singlePn;

    /**
     * 关联的project_ids[]
     */
    private String projectIds;
}
