package com.cdap.mock.biz.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@TableName("tb_withdrawal")
@Data
public class TbWithdrawalEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户id
     */
    private String uid;

    /**
     * 创建时间
     */
    private Long ctime;

    /**
     * 提现金额
     */
    private BigDecimal amount;

    /**
     * 归因渠道号
     */
    private String channel;

    /**
     * vungo提现数据id
     */
    private Long vungoWithdrawalId;

    /**
     * 原渠道
     */
    private String originChannel;

    /**
     * gaid
     */
    private String gaid;

    /**
     * 日期
     */
    private Integer day;

    @TableField("`order`")
    private String order;

    /**
     * 数据入库时间
     */
    private Long cts;

    /**
     * pn
     */
    private String pn;

    /**
     * 订单修改时间，秒
     */
    private Long mtime;

    /**
     * 登录渠道号
     */
    private String loginChannel;

    /**
     * 注册渠道号
     */
    private String registerChannel;
}
