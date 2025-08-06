package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 汇率记录表
 * </p>
 */
@Data
@TableName("rate")
public class Rate implements Serializable {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 目标币种
     */
    @TableField("base")
    private String base;

    /**
     * 转换币种
     */
    @TableField("symbols")
    private String symbols;

    /**
     * 汇率
     */
    @TableField("rate")
    private BigDecimal rate;

    /**
     * 日期
     */
    @TableField("dates")
    private Integer dates;

    /**
     * 创建日期
     */
    @TableField("created")
    private Date created;

    /**
     * 修改日期
     */
    @TableField("updated")
    private Date updated;
}
