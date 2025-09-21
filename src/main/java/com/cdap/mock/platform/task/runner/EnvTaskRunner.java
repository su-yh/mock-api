package com.cdap.mock.platform.task.runner;

import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.base.dds.datasource.hikari.HikariDataSourcePlus;
import com.base.dds.datasource.properties.DynamicDataSourceProviderProperties;
import com.base.web.constants.enums.BaseWebErrorCodeEnums;
import com.base.web.exception.ExceptionUtil;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.constants.MockModeEnums;
import com.cdap.mock.env.service.AdKeywordsCampaignService;
import com.cdap.mock.env.service.AdjustService;
import com.cdap.mock.env.service.AdsAttributeService;
import com.cdap.mock.env.service.AdvertiserService;
import com.cdap.mock.env.service.ChannelService;
import com.cdap.mock.env.service.ProjectService;
import com.cdap.mock.env.service.RateService;
import com.cdap.mock.env.service.RoiService;
import com.cdap.mock.env.service.TbRechargeService;
import com.cdap.mock.env.service.TbUserLoginService;
import com.cdap.mock.env.service.TbUserService;
import com.cdap.mock.env.service.TbWithdrawalService;
import com.cdap.mock.event.EnvTaskFinishedEvent;
import com.cdap.mock.job.MockDataTask;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import com.cdap.mock.mq.produce.RabbitProduceComponent;
import com.cdap.mock.platform.dao.cdapmysql.mapper.ChannelMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.CohortCalculationChannelCodeMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.CohortRoiCalculationConfMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.CohortRoiCalculationMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.ProjectMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.RateMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.SubChannelMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbRechargeMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbUserLoginMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbUserMapper;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbWithdrawalMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdAdvertiserCampaignMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdAdvertiserMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdKeywordsCampaignMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustAdMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustCostRecordMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustUserMapper;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.util.CdapStopWatch;
import com.cdap.mock.util.IdGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RequiredArgsConstructor
@Slf4j
public class EnvTaskRunner extends Thread {
    private final static List<String> LOCATIONS_CDS = Arrays.asList(
            "sqls/mysql/cdap/cds/history", "sqls/mysql/cdap/cds/increment", "sqls/mysql/cdap/cds/increment_plus", "sqls/mysql/cdap/cds/data_mock");
    private final static List<String> LOCATIONS_PG = Arrays.asList(
            "sqls/pgsql/common/history", "sqls/pgsql/common/increment", "sqls/pgsql/common/other");
    private final static long INTERVAL_MILLIS = 60_000L;

    private boolean initFlag = false;

    private final ApplicationContext context;
    private final MockPropertiesEntity mockPropertiesEntity;
    private final EnvDatasourcePropertiesEntity cdsDataSource;
    private final EnvDatasourcePropertiesEntity pgDataSource;

    // 普通对象
    private RabbitProduceComponent rmqProduce;  // TODO: suyh - 这个还没有处理。

    private MockDataTask mockDataTask;

    public synchronized void init() {
        if (initFlag) {
            return;
        }

        IdGenerator idGenerator = new IdGenerator();

        // spring bean 对象
        ProjectMapper projectMapper = context.getBean(ProjectMapper.class);
        RateMapper rateMapper = context.getBean(RateMapper.class);
        AdjustUserMapper adjustUserMapper = context.getBean(AdjustUserMapper.class);
        AdAdvertiserMapper adAdvertiserMapper = context.getBean(AdAdvertiserMapper.class);
        AdjustCostRecordMapper adjustCostRecordMapper = context.getBean(AdjustCostRecordMapper.class);
        ChannelMapper channelMapper = context.getBean(ChannelMapper.class);
        SubChannelMapper subChannelMapper = context.getBean(SubChannelMapper.class);
        AdAdvertiserCampaignMapper adAdvertiserCampaignMapper = context.getBean(AdAdvertiserCampaignMapper.class);
        CohortRoiCalculationMapper cohortRoiCalculationMapper = context.getBean(CohortRoiCalculationMapper.class);
        CohortRoiCalculationConfMapper cohortRoiCalculationConfMapper = context.getBean(CohortRoiCalculationConfMapper.class);
        CohortCalculationChannelCodeMapper cohortCalculationChannelCodeMapper = context.getBean(CohortCalculationChannelCodeMapper.class);
        AdjustAdMapper adjustAdMapper = context.getBean(AdjustAdMapper.class);
        TbUserMapper tbUserMapper = context.getBean(TbUserMapper.class);
        TbUserLoginMapper tbUserLoginMapper = context.getBean(TbUserLoginMapper.class);
        TbRechargeMapper tbRechargeMapper = context.getBean(TbRechargeMapper.class);
        TbWithdrawalMapper tbWithdrawalMapper = context.getBean(TbWithdrawalMapper.class);
        AdKeywordsCampaignMapper adKeywordsCampaignMapper = context.getBean(AdKeywordsCampaignMapper.class);

        // service 普通对象
        ProjectService projectService = new ProjectService(projectMapper);
        RateService rateService = new RateService(rateMapper, projectService);
        TbUserService tbUserService = new TbUserService(idGenerator, tbUserMapper);
        TbUserLoginService tbUserLoginService = new TbUserLoginService(tbUserLoginMapper, tbUserService, projectService, idGenerator);
        TbRechargeService tbRechargeService = new TbRechargeService(tbRechargeMapper, idGenerator, tbUserService, projectService, rateService);
        TbWithdrawalService tbWithdrawalService = new TbWithdrawalService(tbWithdrawalMapper, idGenerator, tbUserService, projectService, rateService);
        AdKeywordsCampaignService adKeywordsCampaignService = new AdKeywordsCampaignService(adKeywordsCampaignMapper);

        ChannelService channelService = new ChannelService(channelMapper, subChannelMapper, projectService);
        RoiService roiService = new RoiService(cohortRoiCalculationMapper, cohortRoiCalculationConfMapper,
                cohortCalculationChannelCodeMapper, projectService, channelService);
        AdsAttributeService adsAttributeService = new AdsAttributeService(idGenerator, adAdvertiserCampaignMapper,
                adjustAdMapper, projectService, channelService, adKeywordsCampaignService);
        AdvertiserService advertiserService = new AdvertiserService(adAdvertiserMapper, adjustCostRecordMapper,
                idGenerator, projectService, channelService, adsAttributeService);
        AdjustService adjustService = new AdjustService(adjustUserMapper, advertiserService);

        mockDataTask = new MockDataTask(rmqProduce, tbUserService, tbUserLoginService, tbRechargeService,
                tbWithdrawalService, adjustService, projectService, channelService, rateService, advertiserService,
                roiService, adsAttributeService);

        String env = mockPropertiesEntity.getEnv();
        super.setName(env);
        initFlag = true;
    }

    @Override
    public void run() {
        DynamicRoutingDataSource dynamicRoutingDataSource = context.getBean(DynamicRoutingDataSource.class);

        final String env = mockPropertiesEntity.getEnv();
        log.info("start, env: {}", env);
        EnvDsProcessor.ENV.set(env);
        EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.set(mockPropertiesEntity);
        String envFlinkCds = env + EnvDsProcessor.SEPARATOR + DataSourceNames.FLINK_CDS;
        String envFlinkPg = env + EnvDsProcessor.SEPARATOR + DataSourceNames.FLINK_PG_CDAP;

        try (HikariDataSourcePlus hikariCds = new HikariDataSourcePlus();
             HikariDataSourcePlus hikariPg = new HikariDataSourcePlus()) {
            Assert.isTrue(cdsDataSource.getEnv().equals(env),
                    String.format("env not match, env: %s, dataSourceEnv: %s, dataSourceEntity id: %d", env, cdsDataSource.getEnv(), cdsDataSource.getId()));
            Assert.isTrue(pgDataSource.getEnv().equals(env),
                    String.format("env not match, env: %s, dataSourceEnv: %s, dataSourceEntity id: %d", env, pgDataSource.getEnv(), pgDataSource.getId()));

            initHikariDataSourcePlus(hikariCds, cdsDataSource, LOCATIONS_CDS);
            initHikariDataSourcePlus(hikariPg, pgDataSource, LOCATIONS_PG);

            DynamicDataSourceProviderProperties.doFlyway(hikariCds);
            DynamicDataSourceProviderProperties.doFlyway(hikariPg);

            dynamicRoutingDataSource.addDataSource(envFlinkCds, hikariCds);
            dynamicRoutingDataSource.addDataSource(envFlinkPg, hikariPg);

            MockModeEnums mockMode = mockPropertiesEntity.getMode();

            log.info("CURRENT DATA MOCK MODE: {}.", mockMode);

            switch (mockMode) {
                case TIMER_JOB:
                    mockByTimeJob();
                    break;
                case DATE_RAGE:
                    mockByDateRage();
                    break;
                case TS_RANGE:
                    log.error("未实现");
                    break;
                case NONE:
                default:
                    log.info("DATA MOCK IS DISABLED.");
                    break;
            }
        } catch (Exception e) {
            log.error("some exception happened.", e);
        } finally {
            dynamicRoutingDataSource.removeDataSource(envFlinkPg);
            dynamicRoutingDataSource.removeDataSource(envFlinkCds);

            EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.remove();

            EnvDsProcessor.ENV.remove();

            context.publishEvent(new EnvTaskFinishedEvent(env));
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

    @Override
    public synchronized void start() {
        if (!initFlag) {
            log.error("Uninitialized, unable to run.");
            throw ExceptionUtil.business(BaseWebErrorCodeEnums.SERVICE_ERROR);
        }
        // TODO: suyh - 发布事件，让当前环境的状态变更为运行中。
        //  同时检查运行状态，这里不能检查状态哟，重启或者异常停止时需要恢复
//        context.publishEvent(null);

        super.start();
    }

    public void dataMockTick() {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            mockDataTask.doDataMockTick(currentTimeMillis);
        } catch (Exception e) {
            log.error("some exception happened.", e);
        }
    }


    private void mockByTimeJob() {
        ScheduledExecutorService scheduledExecutor = Executors.newSingleThreadScheduledExecutor();
        scheduledExecutor.scheduleWithFixedDelay(
                this::dataMockTick, 20_000, INTERVAL_MILLIS, TimeUnit.MILLISECONDS);
    }

    private void mockByDateRage() {
        CdapStopWatch stopWatch = new CdapStopWatch("dateRage");
        try {
            log.info("MOCK RANGE START...");
            stopWatch.start();
            doMockByDateRage(INTERVAL_MILLIS);
        } catch (Exception e) {
            log.error("SOME EXCEPTION HAPPENED.", e);
            throw new RuntimeException(e);
        } finally {
            stopWatch.stop();
            log.info("\n" +
                            "##########################\n" +
                            "# MOCK RANGE FINISHED. \n" +
                            "##########################\n" +
                            "{}",
                    stopWatch.prettyPrint());
        }
    }

    public void doMockByDateRage(long intervalMillis) {
        Long timestampBegin = mockDataTask.obtainDateRangeTimeBegin();
        if (timestampBegin == null) {
            log.error("timeBegin is null}");
            return;
        }

        long timestampEnd = mockPropertiesEntity.getTsEnd();

        for (long timestamp = timestampBegin; timestamp < timestampEnd; timestamp += intervalMillis) {
            mockDataTask.doDataMockTick(timestamp);
        }
    }
}
