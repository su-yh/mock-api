package com.cdap.mock.platform.controller;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.platform.dao.mgr.entity.MockEnvConfigEntity;
import com.cdap.mock.platform.dto.StatusSwitchBody;
import com.cdap.mock.platform.service.MockEnvConfigService;
import com.web.sys.dto.base.IdBody;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.groups.Default;
import java.util.List;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RestController
@RequestMapping("/platform/env")
@RequiredArgsConstructor
@Validated
@Slf4j
public class MockEnvConfigController {
    private static final String SWAGGER_TAG_PLATFORM_ENV = "Platform Env";

    private final MockEnvConfigService mockEnvConfigService;

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "查询(分页)")
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public PageResult<MockEnvConfigEntity> listPage(
            PageParam pageParam) {
        return mockEnvConfigService.listPage(pageParam);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "查询(所有)")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    public List<MockEnvConfigEntity> listAll() {
        return mockEnvConfigService.listAll();
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "新建")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public void create(
            @RequestBody @Validated({ValidationGroups.Req.Create.class, Default.class}) MockEnvConfigEntity createEntity) {
        mockEnvConfigService.create(createEntity);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "编辑")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateById(
            @RequestBody @Validated({ValidationGroups.Req.Update.class, Default.class}) MockEnvConfigEntity updateEntity) {
        mockEnvConfigService.updateById(updateEntity);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteById(
            @RequestBody @Validated IdBody idBody) {
        mockEnvConfigService.deleteById(idBody.getId());
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_ENV)
    @Operation(summary = "状态切换")
    @RequestMapping(value = "/statusSwitch", method = RequestMethod.POST)
    public void statusSwitch(@RequestBody @Validated StatusSwitchBody body) {
        mockEnvConfigService.statusSwitch(body.getId(), body.getEnabled());
    }

}
