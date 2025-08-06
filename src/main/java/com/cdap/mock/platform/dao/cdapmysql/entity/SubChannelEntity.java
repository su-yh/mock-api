package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
public class SubChannelEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 渠道号
     */
    private String channelCode;

    /**
     * 所属渠道id
     */
    private Integer channelId;

    /**
     * 包名
     */
    private String packageName;

    /**
     * 包下载地址
     */
    private String apk;

    /**
     * 打包配置地址
     */
    private String apkConfigPath;

    /**
     * 别名
     */
    private String alias;
}
