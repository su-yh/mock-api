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
    private final Map<String, MicroEcosystem> envMicroEcosystemMap = new ConcurrentHashMap<>();
    private final ReentrantLock envTaskRunnerMapLock = new ReentrantLock();

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
                        envMicroEcosystemMap.put(env, microEcosystem);
                    }
                    microEcosystem.start();
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

        releaseExecutor();

        releaseEnvMicroEcosystemMp();
    }

    private void releaseEnvMicroEcosystemMp() {
        if (envMicroEcosystemMap.isEmpty()) {
            return;
        }

        envMicroEcosystemMap.forEach((env, runner) -> runner.stop());

        log.info("等待所有线程停机");
        // 等30 秒，所有的线程都停止
        for (int i = 0; i < 30_000; i++) {
            AtomicBoolean allStopped = new AtomicBoolean(true);
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

    private void releaseExecutor() {
        // 步骤1：拒绝接收新的任务
        scheduledExecutorService.shutdown();

        // 步骤2：等待任务完成（设置超时时间，避免无限阻塞）
        boolean isTerminated;
        try {
            // 等待30秒：可根据业务调整（若任务执行时间较长，可适当延长）
            isTerminated = scheduledExecutorService.awaitTermination(30, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            // 若等待被中断，主动中断线程池的任务
            Thread.currentThread().interrupt(); // 恢复中断状态，避免影响其他逻辑
            isTerminated = false;
            log.warn("Await termination of executor was interrupted", e);
        }

        // 步骤3：若超时未完成，强制终止所有任务（兜底策略）
        if (!isTerminated) {
            log.warn("Executor did not terminate in 30 seconds, forcing shutdown...");
            scheduledExecutorService.shutdownNow(); // 强制中断正在执行的任务，清空队列
            // 再次等待强制终止完成
            try {
                if (!scheduledExecutorService.awaitTermination(10, TimeUnit.SECONDS)) {
                    log.error("Executor still not terminated after force shutdown");
                }
            } catch (InterruptedException e) {
                log.warn("Executor still not terminated after force shutdown.", e);
            }
        }
    }
}
