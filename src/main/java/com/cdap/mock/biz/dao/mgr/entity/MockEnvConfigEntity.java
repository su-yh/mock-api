package com.cdap.mock.biz.dao.mgr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.base.web.validation.groups.ValidationGroups;
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
@TableName(value = "mock_env_config", autoResultMap = true)
public class MockEnvConfigEntity {
    @TableId(type = IdType.AUTO)
    @Null(groups = ValidationGroups.Req.Create.class)
    @NotNull(groups = ValidationGroups.Req.Update.class)
    private Long id;

    @Schema(description = "全表唯一，只允许输入英文和数字")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private String env;

    @Schema(description = "环境描述")
    private String description;

    @Schema(description = "启用/禁用")
    @NotNull(groups = ValidationGroups.Req.Create.class)
    private Boolean enabled;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date created;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date updated;
}
