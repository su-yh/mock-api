package com.cdap.mock.biz.dao.cdapmysql.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author suyh
 * @since 2024-05-25
 */
@Data
public class ProjectEntity implements Serializable {
    private static final long serialVersionUID = 4172778519550662755L;

//    @TableId(value = "id", type = IdType.AUTO)
    @TableId(value = "id", type = IdType.INPUT) // suyh - 直接使用常量的ID
    private Long id;
    private String name;
    private String pn;
    private Integer enable;

    // 该表字段已经不使用了
    @Deprecated
    private BigDecimal extraRate;

    private String currency;

    /**
     * 时区偏移量，格式：+05:30
     */
    @TableField("zone_id")
    private String zoneIdOffset;

    private Date createTime;
}
