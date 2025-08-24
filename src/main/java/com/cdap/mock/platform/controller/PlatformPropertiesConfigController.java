package com.cdap.mock.platform.controller;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.service.MockPropertiesConfigService;
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
@RequestMapping("/platform/mock")
@RequiredArgsConstructor
@Validated
@Slf4j
public class PlatformPropertiesConfigController {
    private static final String SWAGGER_TAG_PLATFORM_PROPERTIES = "Platform Properties";

    private final MockPropertiesConfigService mockPropertiesConfigService;

    @Tag(name = SWAGGER_TAG_PLATFORM_PROPERTIES)
    @Operation(summary = "查询(分页)")
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public PageResult<MockPropertiesEntity> listPage(
            PageParam pageParam) {
        return mockPropertiesConfigService.listPage(pageParam);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_PROPERTIES)
    @Operation(summary = "查询(by env)")
    @RequestMapping(value = "/queryPlatformByEnv", method = RequestMethod.GET)
    public MockPropertiesEntity selectEntityByEnv(
            @RequestParam String env) {
        return mockPropertiesConfigService.selectEntityByEnv(env);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_PROPERTIES)
    @Operation(summary = "新建")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public void create(
            @RequestBody @Validated({ValidationGroups.Req.Create.class, Default.class}) MockPropertiesEntity createEntity) {
        mockPropertiesConfigService.create(createEntity);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_PROPERTIES)
    @Operation(summary = "编辑")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateById(
            @RequestBody @Validated({ValidationGroups.Req.Update.class, Default.class}) MockPropertiesEntity updateEntity) {
        mockPropertiesConfigService.updateById(updateEntity);
    }

    @Tag(name = SWAGGER_TAG_PLATFORM_PROPERTIES)
    @Operation(summary = "删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteById(
            @RequestBody @Validated IdBody idBody) {
        mockPropertiesConfigService.deleteById(idBody.getId());
    }
}
