package com.cdap.mock.biz.controller;

import com.cdap.mock.biz.service.DataMockTaskService;
import com.web.sys.dto.base.SingleStringBody;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public void startTask(@RequestBody @Validated SingleStringBody body) {
        dataMockTaskService.startTask(body.getBody());
    }
}
