package com.cdap.mock.platform.controller;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.base.web.validation.groups.ValidationGroups;
import com.cdap.mock.platform.dao.mgr.entity.EnvRabbitmqPropertiesEntity;
import com.cdap.mock.platform.service.EnvRabbitmqPropertiesService;
import com.web.sys.dto.base.IdBody;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.groups.Default;

/**
 * @author suyh
 * @since 2025-08-06
 */
@RestController
@RequestMapping("/env/rabbitmq")
@RequiredArgsConstructor
@Validated
@Slf4j
public class EnvRabbitmqPropertiesController {
    private final EnvRabbitmqPropertiesService envRabbitmqPropertiesService;

    @Operation(summary = "查询(分页)")
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public PageResult<EnvRabbitmqPropertiesEntity> listPage(
            PageParam pageParam) {
        return envRabbitmqPropertiesService.listPage(pageParam);
    }

    @Operation(summary = "新建")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public void create(
            @RequestBody @Validated({ValidationGroups.Req.Create.class, Default.class}) EnvRabbitmqPropertiesEntity createEntity) {
        envRabbitmqPropertiesService.create(createEntity);
    }

    @Operation(summary = "编辑")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateById(
            @RequestBody @Validated({ValidationGroups.Req.Update.class, Default.class}) EnvRabbitmqPropertiesEntity updateEntity) {
        envRabbitmqPropertiesService.updateById(updateEntity);
    }

    @Operation(summary = "删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteById(
            @RequestBody @Validated IdBody idBody) {
        envRabbitmqPropertiesService.deleteById(idBody.getId());
    }
}
