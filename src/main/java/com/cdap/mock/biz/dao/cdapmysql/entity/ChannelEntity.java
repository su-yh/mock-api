package com.cdap.mock.biz.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author suyh
 * @since 2024-05-25
 */
@TableName("channel")
@Data
public class ChannelEntity implements Serializable {
    private static final long serialVersionUID = -3446265917294920685L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String channelName;
    // 分成比例
    private BigDecimal proportion;
    private Integer startCode;
    private Integer endCode;
    private Long projectId;
}
