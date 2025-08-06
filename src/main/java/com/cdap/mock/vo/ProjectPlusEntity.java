package com.cdap.mock.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdap.mock.platform.dao.cdapmysql.entity.ProjectEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.math.BigDecimal;
import java.time.ZoneOffset;

/**
 * @author suyh
 * @since 2024-12-17
 */
@TableName("project")
@Data
public class ProjectPlusEntity extends ProjectEntity {
    @TableField(exist = false)
    // 这里主要用来处理货币对应美元的汇率的一个基础值，在实际的场景下，会在此基础上进行一个10% 的区间上浮
    private BigDecimal baseUsdRate;
    @TableField(exist = false)
    @JsonIgnore
    private ZoneOffset zoneOffset;
}
