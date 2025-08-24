package com.cdap.mock.platform.controller;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.base.web.exception.ExceptionUtil;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.constants.DataSourceEnums;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dto.StatusSwitchBody;
import com.cdap.mock.platform.service.EnvDatasourcePropertiesService;
import com.web.sys.constants.enums.SysWebErrorCodeEnums;
import com.web.sys.dto.base.IdBody;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.groups.Default;

/**
 * @author suyh
 * @since 2025-08-06
 */
@RestController
@RequestMapping("/env/datasource")
@RequiredArgsConstructor
@Validated
@Slf4j
public class EnvDatasourcePropertiesController {
    private static final String SWAGGER_TAG_DATASOURCE = "Datasource";

    private final EnvDatasourcePropertiesService envDatasourcePropertiesService;

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "查询(分页)")
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public PageResult<EnvDatasourcePropertiesEntity> listPage(
            PageParam pageParam) {
        return envDatasourcePropertiesService.listPage(pageParam);
    }

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "查询实例")
    @RequestMapping(value = "/queryDataSourceByEnv", method = RequestMethod.GET)
    public EnvDatasourcePropertiesEntity queryDataSourceByEnv(
            @RequestParam String env, @RequestParam String dataSourceName) {
        DataSourceEnums ds = null;
        switch (dataSourceName) {
            case DataSourceNames.FLINK_CDS:
                ds = DataSourceEnums.FLINK_CDS;
                break;
            case DataSourceNames.FLINK_PG_CDAP:
                ds = DataSourceEnums.FLINK_PG_CDAP;
                break;
            default:
                break;
        }
        if (ds == null) {
            throw ExceptionUtil.business(SysWebErrorCodeEnums.PARAMETER_ERROR_PARAM, "dataSourceName: " + dataSourceName);
        }
        return envDatasourcePropertiesService.selectByEnvName(env, ds);
    }

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "新建")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public void create(
            @RequestBody @Validated({ValidationGroups.Req.Create.class, Default.class}) EnvDatasourcePropertiesEntity createEntity) {
        envDatasourcePropertiesService.create(createEntity);
    }

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "编辑")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateById(
            @RequestBody @Validated({ValidationGroups.Req.Update.class, Default.class}) EnvDatasourcePropertiesEntity updateEntity) {
        envDatasourcePropertiesService.updateById(updateEntity);
    }

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteById(
            @RequestBody @Validated IdBody idBody) {
        envDatasourcePropertiesService.deleteById(idBody.getId());
    }

    @Tag(name = SWAGGER_TAG_DATASOURCE)
    @Operation(summary = "启用/禁用flyway")
    @RequestMapping(value = "/switchFlywayEnable", method = RequestMethod.POST)
    public void switchFlywayEnable(
            @RequestBody @Validated StatusSwitchBody body) {
        envDatasourcePropertiesService.switchFlywayEnable(body.getId(), body.getEnabled());
    }
}
