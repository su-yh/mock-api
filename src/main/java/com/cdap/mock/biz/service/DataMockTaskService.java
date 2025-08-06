package com.cdap.mock.biz.service;

import com.baomidou.dynamic.datasource.annotation.DSTransactional;
import com.base.web.exception.ExceptionUtil;
import com.cdap.mock.biz.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.biz.dao.mgr.entity.EnvPropertiesEntity;
import com.cdap.mock.biz.dao.mgr.entity.MockEnvConfigEntity;
import com.cdap.mock.biz.task.runner.EnvTaskRunner;
import com.cdap.mock.constants.DataSourceEnums;
import com.cdap.mock.constants.ErrorCodeEnums;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class DataMockTaskService {
    private final ApplicationContext context;
    private final MockEnvConfigService mockEnvConfigService;
    private final EnvPropertiesConfigService envPropertiesConfigService;
    private final EnvDatasourcePropertiesService envDatasourcePropertiesService;

    private final Map<String, EnvTaskRunner> envTaskRunnerMap = new ConcurrentHashMap<>();

    @DSTransactional
    public void startTask(@NonNull String env) {
        MockEnvConfigEntity envConfigEntity = mockEnvConfigService.selectEntityByEnv(env);
        if (envConfigEntity == null) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_NOT_FOUND, "环境对象", env);
        }
        if (!envConfigEntity.getEnabled()) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_DISABLED, "环境对象", env);
        }

        EnvPropertiesEntity propertiesConfigEntity = envPropertiesConfigService.selectEntityByEnv(env);
        if (propertiesConfigEntity == null) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_NOT_FOUND, "环境属性配置", env);
        }

        EnvDatasourcePropertiesEntity cdsDataSource = envDatasourcePropertiesService.selectByEnvName(env, DataSourceEnums.FLINK_CDS);
        EnvDatasourcePropertiesEntity pgDataSource = envDatasourcePropertiesService.selectByEnvName(env, DataSourceEnums.FLINK_PG_CDAP);
        if (cdsDataSource == null) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_NOT_FOUND, "数据源配置", String.format("env(%s), name(%s)", env, DataSourceEnums.FLINK_CDS.getCode()));
        }
        if (pgDataSource == null) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_NOT_FOUND, "数据源配置", String.format("env(%s), name(%s)", env, DataSourceEnums.FLINK_PG_CDAP.getCode()));
        }

        EnvTaskRunner envTaskRunner = envTaskRunnerMap.computeIfAbsent(env, e -> new EnvTaskRunner(context, propertiesConfigEntity, cdsDataSource, pgDataSource));
        synchronized (envTaskRunner) {
            envTaskRunner.init();
            envTaskRunner.start();
        }
    }
}
