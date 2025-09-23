package com.cdap.mock.env.unit;

import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.base.dds.datasource.hikari.HikariDataSourcePlus;
import com.base.dds.datasource.properties.DynamicDataSourceProviderProperties;
import com.base.web.constants.enums.BaseWebErrorCodeEnums;
import com.base.web.exception.ExceptionUtil;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.constants.MockModeEnums;
import com.cdap.mock.event.EnvTaskFinishedEvent;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.task.runner.AbstractTaskExecutor;
import com.cdap.mock.platform.task.runner.TimerJobTaskExecutorThread;
import com.cdap.mock.platform.task.runner.TimestampRangeTaskExecutorThread;
import com.cdap.mock.util.IdGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties;
import org.springframework.context.ApplicationListener;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

@RequiredArgsConstructor
@Slf4j
public class MicroEcosystem {
    private final static List<String> LOCATIONS_CDS = Arrays.asList(
            "sqls/mysql/cdap/cds/history", "sqls/mysql/cdap/cds/increment", "sqls/mysql/cdap/cds/increment_plus", "sqls/mysql/cdap/cds/data_mock");
    private final static List<String> LOCATIONS_PG = Arrays.asList(
            "sqls/pgsql/common/history", "sqls/pgsql/common/increment", "sqls/pgsql/common/other");

    private final ConfigurableApplicationContext context;
    private final MockPropertiesEntity mockPropertiesEntity;
    private final EnvDatasourcePropertiesEntity cdsDataSource;
    private final EnvDatasourcePropertiesEntity pgDataSource;

    private final AtomicBoolean initFlag = new AtomicBoolean(false);
    private final IdGenerator idGenerator = new IdGenerator();
    private final ScheduledExecutorService scheduledExecutorService;

    private AbstractTaskExecutor taskExecutor;

    public void init() {
        if (initFlag.getAndSet(true)) {
            return;
        }

        registerListener();

        // 初始化定时任务调度执行器
        scheduledExecutorService.scheduleWithFixedDelay(idGenerator::resetRelativeMs, 11, 11, TimeUnit.SECONDS);

        String env = mockPropertiesEntity.getEnv();

        EnvDsProcessor.ENV.set(env);
        // EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.set(mockPropertiesEntity);
        String envFlinkCds = env + EnvDsProcessor.SEPARATOR + DataSourceNames.FLINK_CDS;
        String envFlinkPg = env + EnvDsProcessor.SEPARATOR + DataSourceNames.FLINK_PG_CDAP;

        DynamicRoutingDataSource dynamicRoutingDataSource = context.getBean(DynamicRoutingDataSource.class);

        try {
            Assert.isTrue(cdsDataSource.getEnv().equals(env),
                    String.format("env not match, env: %s, dataSourceEnv: %s, dataSourceEntity id: %d", env, cdsDataSource.getEnv(), cdsDataSource.getId()));
            Assert.isTrue(pgDataSource.getEnv().equals(env),
                    String.format("env not match, env: %s, dataSourceEnv: %s, dataSourceEntity id: %d", env, pgDataSource.getEnv(), pgDataSource.getId()));

            HikariDataSourcePlus hikariCds = new HikariDataSourcePlus();
            HikariDataSourcePlus hikariPg = new HikariDataSourcePlus();

            initHikariDataSourcePlus(hikariCds, cdsDataSource, LOCATIONS_CDS);
            initHikariDataSourcePlus(hikariPg, pgDataSource, LOCATIONS_PG);

            DynamicDataSourceProviderProperties.doFlyway(hikariCds);
            DynamicDataSourceProviderProperties.doFlyway(hikariPg);

            dynamicRoutingDataSource.addDataSource(envFlinkCds, hikariCds);
            dynamicRoutingDataSource.addDataSource(envFlinkPg, hikariPg);
        } catch (Exception e) {
            log.error("some exception happened.", e);
            throw ExceptionUtil.business(BaseWebErrorCodeEnums.SERVICE_ERROR);
        } finally {
            EnvDsProcessor.ENV.remove();
        }
    }

    private void initHikariDataSourcePlus(
            HikariDataSourcePlus dataSourcePlus, EnvDatasourcePropertiesEntity datasourceProperties, List<String> locations) {
        dataSourcePlus.setJdbcUrl(datasourceProperties.getJdbcUrl());
        dataSourcePlus.setUsername(datasourceProperties.getUsername());
        dataSourcePlus.setPassword(datasourceProperties.getPassword());
        dataSourcePlus.setDriverClassName(datasourceProperties.getDriverClassName());

        FlywayProperties flyway = dataSourcePlus.getFlyway();
        flyway.setEnabled(datasourceProperties.getFlywayEnabled());
        flyway.setLocations(locations);
        flyway.setOutOfOrder(true);
    }

    public synchronized void start() {
        if (taskExecutor != null) {
            log.warn("正在运行中...");
            return;
        }

        String env = mockPropertiesEntity.getEnv();
        MockModeEnums mockMode = mockPropertiesEntity.getMode();

        log.info("env: {}, CURRENT DATA MOCK MODE: {}.", env, mockMode);

        switch (mockMode) {
            case TIMER_JOB:
                taskExecutor = new TimerJobTaskExecutorThread(
                        context, mockPropertiesEntity, idGenerator);
                break;
            case DATE_RAGE:
                taskExecutor = new TimestampRangeTaskExecutorThread(
                        context, mockPropertiesEntity, idGenerator);
                break;
            case NONE:
            default:
                log.info("env: {}, DATA MOCK IS DISABLED.", env);
                throw ExceptionUtil.business(BaseWebErrorCodeEnums.SYSTEM_UNSUPPORTED, "UNKNOWN mode: " + mockMode);
        }

        taskExecutor.start();
        log.info("env: {}, taskExecutor start.", env);
    }

    // 停止通知，并非实际停止标志
    public synchronized void stop() {
        if (taskExecutor == null) {
            return;
        }

        taskExecutor.finished();
    }

    private void registerListener() {
        // 注册监听特定事件（例如自定义事件MyEvent）
        ApplicationListener<EnvTaskFinishedEvent> taskFinishedEvent = this::onTaskFinished;
        context.addApplicationListener(taskFinishedEvent);
    }

    private synchronized void onTaskFinished(EnvTaskFinishedEvent event) {
        String env = event.getEnv();
        if (!StringUtils.hasText(env)) {
            return;
        }

        String curEnv = mockPropertiesEntity.getEnv();
        if (!env.equals(curEnv)) {
            return;
        }

        log.info("task executor finished. env: {}", env);
        // 任务完成，释放线程对象
        taskExecutor = null;
    }

    public boolean isTaskRunner() {
        return taskExecutor != null;
    }
}


