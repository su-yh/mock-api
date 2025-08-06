package com.cdap.mock.platform.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("fissile_channel")
public class FissileChannelEntity {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String channel;

    private Integer enable;

    private String pn;
}
