package com.cdap.mock.biz.dao.cdapmysql.entity.plus;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdap.mock.biz.dao.cdapmysql.entity.SubChannelEntity;
import lombok.Data;

/**
 * @author suyh
 * @since 2025-01-16
 */
@TableName("sub_channel")
@Data
public class SubChannelPlusEntity extends SubChannelEntity {
    // pn 不是sub_channel 表中的字段，但是到处都需要用到。
    @TableField(exist = false)
    private String pn;
}
