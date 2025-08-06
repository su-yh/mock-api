package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@TableName("tb_user_login")
@Data
public class TbUserLoginEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户id
     */
    private String uid;

    /**
     * 1：用户注册；2：用户登录
     */
    private Integer src;

    /**
     * 渠道号
     */
    private String channel;

    /**
     * 创建时间
     */
    private Long ctime;

    /**
     * 谷歌广告ID
     */
    private String gaid;

    /**
     * 原始渠道
     */
    private String originChannel;

    /**
     * 原数据id
     */
    private Long vungoUserLoginId;

    /**
     * 日期
     */
    private Integer day;

    /**
     * 数据入库时间
     */
    private Long cts;

    /**
     * pn
     */
    private String pn;

}
