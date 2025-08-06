package com.cdap.mock.platform.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdap.mock.constants.DataSourceEnums;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Data
@TableName(value = "env_datasource_properties", autoResultMap = true)
public class EnvDatasourcePropertiesEntity {
    @TableId(type = IdType.AUTO)
    private Long id;

    @Schema(description = "环境标识")
    private String env;

    @Schema(description = "对应枚举：DataSourceEnums")
    private DataSourceEnums name;

    @Schema(description = "JDBC连接地址")
    private String jdbcUrl;

    @Schema(description = "数据库用户名")
    private String username;

    @Schema(description = "数据库密码")
    private String password;

    @Schema(description = "driver")
    private String driverClassName;

    @Schema(description = "启用/禁用flyway")
    private Boolean flywayEnabled;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
