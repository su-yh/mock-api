package com.cdap.mock.platform.service;

import com.baomidou.dynamic.datasource.annotation.DSTransactional;
import com.base.web.exception.ExceptionUtil;
import com.cdap.mock.constants.DataSourceEnums;
import com.cdap.mock.constants.ErrorCodeEnums;
import com.cdap.mock.constants.StartStopEnums;
import com.cdap.mock.env.unit.MicroEcosystem;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockEnvConfigEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class DataMockTaskService {
    private final ConfigurableApplicationContext context;
    private final MockEnvConfigService mockEnvConfigService;
    private final MockPropertiesConfigService mockPropertiesConfigService;
    private final EnvDatasourcePropertiesService envDatasourcePropertiesService;

    private final ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
    // key: env
    private final ReentrantLock envTaskRunnerMapLock = new ReentrantLock();
    private final Map<String, MicroEcosystem> envMicroEcosystemMap = new ConcurrentHashMap<>();

    @DSTransactional
    public void controlTargetActivity(@NonNull String env, StartStopEnums control) {
        MockEnvConfigEntity envConfigEntity = mockEnvConfigService.selectEntityByEnv(env);
        if (envConfigEntity == null) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_NOT_FOUND, "环境对象", env);
        }
        if (!envConfigEntity.getEnabled()) {
            throw ExceptionUtil.business(ErrorCodeEnums.ITEM_DISABLED, "环境对象", env);
        }

        MockPropertiesEntity propertiesConfigEntity = mockPropertiesConfigService.selectEntityByEnv(env);
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

        envTaskRunnerMapLock.lock();

        try {
            MicroEcosystem microEcosystem = envMicroEcosystemMap.get(env);
            switch (control) {
                case START:
                    if (microEcosystem == null) {
                        microEcosystem = new MicroEcosystem(context, propertiesConfigEntity, cdsDataSource, pgDataSource, scheduledExecutorService);
                        microEcosystem.init();
                        microEcosystem.start();

                        envMicroEcosystemMap.put(env, microEcosystem);
                    }
                    break;
                case STOP:
                    if (microEcosystem != null) {
                        microEcosystem.stop();
                    }
                    break;
                default:
                    break;
            }
        } finally {
            envTaskRunnerMapLock.unlock();
        }
    }

    // 优雅停机
    @EventListener(ContextClosedEvent.class)
    public void onContextClosed(ContextClosedEvent event) {
        log.info("收到停机信号");
        if (envMicroEcosystemMap.isEmpty()) {
            return;
        }

        envMicroEcosystemMap.forEach((env, runner) -> runner.stop());

        log.info("等待所有线程停机");
        AtomicBoolean allStopped = new AtomicBoolean(false);
        // 等30 秒，所有的线程都停止
        for (int i = 0; i < 30_000; i++) {
            envMicroEcosystemMap.forEach((env, runner) -> {
                if (runner.isTaskRunner()) {
                    allStopped.set(false);
                }
            });

            if (allStopped.get()) {
                break;
            }
            try {
                TimeUnit.MILLISECONDS.sleep(1);
            } catch (InterruptedException ignore) {
            }
        }
        log.info("完成");
    }
}
