package com.cdap.mock.platform.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.constants.MockModeEnums;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.util.Date;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Data
@TableName(value = "mock_properties", autoResultMap = true)
public class MockPropertiesEntity {
    @TableId(type = IdType.AUTO)
    @Null(groups = ValidationGroups.Req.Create.class)
    @NotNull(groups = ValidationGroups.Req.Update.class)
    private Long id;

    @Schema(description = "环境标识")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private String env;

    @Schema(description = "模式[0-NONE, 1-实时, 2-按日期范围, 3-按时间戳范围]")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private MockModeEnums mode;

    @Schema(description = "开始时间戳（左闭），单位：毫秒")
    private Long tsBegin;

    @Schema(description = "结束时间戳（右开），单位：毫秒")
    private Long tsEnd;

    @Schema(description = "每个channel 的sub channel 数量")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer subChannelCount;

    @Schema(description = "每次随机注册的最大数量")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer randomMaxRegistry;

    @Schema(description = "每次随机登录的最大数量")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer randomMaxLogin;

    @Schema(description = "每次随机充值的最大数量")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer randomMaxRecharge;

    @Schema(description = "每次随机提现的最大数量")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer randomMaxWithdrawal;

    @Schema(description = "是否往mq 中写，在实时模式下有效")
    @TableField(exist = false)
    private Boolean rmqEnabled = false;     // TODO: suyh - 待删除，这个迁移到rmq 的相关配置属性里面去

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
