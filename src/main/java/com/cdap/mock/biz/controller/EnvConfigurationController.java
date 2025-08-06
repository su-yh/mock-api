package com.cdap.mock.biz.controller;

import com.cdap.mock.biz.service.MockEnvConfigService;
import com.cdap.mock.biz.service.EnvPropertiesConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RestController
@RequestMapping("/env")
@RequiredArgsConstructor
@Validated
@Slf4j
public class EnvConfigurationController {
    private final MockEnvConfigService mockEnvConfigService;
    private final EnvPropertiesConfigService envPropertiesConfigService;
}
