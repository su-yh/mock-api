package com.cdap.mock.platform.controller;

import com.cdap.mock.platform.service.EnvDatasourcePropertiesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    private final EnvDatasourcePropertiesService envDatasourcePropertiesService;
}
