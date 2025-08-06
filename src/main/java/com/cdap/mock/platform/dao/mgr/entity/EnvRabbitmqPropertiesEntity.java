package com.cdap.mock.platform.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Data
@TableName(value = "env_rabbitmq_properties", autoResultMap = true)
public class EnvRabbitmqPropertiesEntity {
    @TableId(type = IdType.AUTO)
    private Long id;

    @Schema(description = "环境标识")
    private String env;

    @Schema(description = "启用/禁用")
    private Boolean enabled;

    @Schema(description = "RabbitMQ主机地址")
    private String host;

    @Schema(description = "RabbitMQ端口")
    private Integer port;

    @Schema(description = "RabbitMQ用户名")
    private String username;

    @Schema(description = "RabbitMQ密码")
    private String password;

    @Schema(description = "RabbitMQ虚拟主机")
    private String virtualHost;

    @Schema(description = "交换机名称")
    private String exchange;

    @Schema(description = "注册路由键")
    private String routingKeyRegistry;

    @Schema(description = "登录路由键")
    private String routingKeyLogin;

    @Schema(description = "充值路由键")
    private String routingKeyRecharge;

    @Schema(description = "提现路由键")
    private String routingKeyWithdrawal;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
