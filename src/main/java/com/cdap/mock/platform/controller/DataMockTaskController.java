package com.cdap.mock.platform.controller;

import com.cdap.mock.constants.StartStopEnums;
import com.cdap.mock.platform.service.DataMockTaskService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RestController
@RequestMapping("/task")
@RequiredArgsConstructor
@Validated
@Slf4j
public class DataMockTaskController {
    private final DataMockTaskService dataMockTaskService;

    @Operation(summary = "启动某个环境对应的任务")
    @RequestMapping(value = "/start", method = RequestMethod.POST)
    public void startTask(@RequestParam String env) {
        dataMockTaskService.controlTargetActivity(env, StartStopEnums.START);
    }

    @Operation(summary = "停止某个环境对应的任务")
    @RequestMapping(value = "/stop", method = RequestMethod.POST)
    public void stopTask(@RequestParam String env) {
        dataMockTaskService.controlTargetActivity(env, StartStopEnums.STOP);
    }

}
