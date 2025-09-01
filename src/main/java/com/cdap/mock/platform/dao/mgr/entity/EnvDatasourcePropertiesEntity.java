package com.cdap.mock.platform.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.constants.DataSourceEnums;
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
@TableName(value = "env_datasource_properties", autoResultMap = true)
public class EnvDatasourcePropertiesEntity {
    @TableId(type = IdType.AUTO)
    @Null(groups = ValidationGroups.Req.Create.class)
    @NotNull(groups = ValidationGroups.Req.Update.class)
    private Long id;

    @Schema(description = "环境标识")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String env;

    @Schema(description = "对应枚举：DataSourceEnums")
    @TableField("name")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private DataSourceEnums dataSourceName;

    @Schema(description = "JDBC连接地址")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String jdbcUrl;

    @Schema(description = "数据库用户名")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String username;

    @Schema(description = "数据库密码")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String password;

    @Schema(description = "driver")
    @NotBlank(groups = ValidationGroups.Req.Create.class)
    private String driverClassName;

    @Schema(description = "启用/禁用flyway")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Boolean flywayEnabled;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
