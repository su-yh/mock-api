package com.cdap.mock.platform.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.base.web.validation.groups.ValidationGroups;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.util.Date;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Data
@TableName(value = "env_rabbitmq_properties", autoResultMap = true)
public class EnvRabbitmqPropertiesEntity {
    @TableId(type = IdType.AUTO)
    @Null(groups = ValidationGroups.Req.Create.class)
    @NotNull(groups = ValidationGroups.Req.Update.class)
    private Long id;

    @Schema(description = "环境标识")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String env;

    @Schema(description = "启用/禁用")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Boolean enabled;

    @Schema(description = "RabbitMQ主机地址")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String host;

    @Schema(description = "RabbitMQ端口")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Integer port;

    @Schema(description = "RabbitMQ用户名")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String username;

    @Schema(description = "RabbitMQ密码")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String password;

    @Schema(description = "RabbitMQ虚拟主机")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String virtualHost;

    @Schema(description = "交换机名称")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String exchange;

    @Schema(description = "注册路由键")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String routingKeyRegistry;

    @Schema(description = "登录路由键")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String routingKeyLogin;

    @Schema(description = "充值路由键")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String routingKeyRecharge;

    @Schema(description = "提现路由键")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String routingKeyWithdrawal;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
