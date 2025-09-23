package com.cdap.mock.platform.task.runner;

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
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.util.IdGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;

import java.util.concurrent.atomic.AtomicBoolean;

@RequiredArgsConstructor
@Slf4j
public abstract class AbstractTaskExecutor extends Thread {
    protected final static long INTERVAL_MILLIS = 60_000L;

    protected final AtomicBoolean stopFlag = new AtomicBoolean(false);

    protected final ApplicationContext context;
    protected final MockPropertiesEntity mockPropertiesEntity;

    protected final IdGenerator idGenerator;

    // 普通对象
    protected RabbitProduceComponent rmqProduce;  // TODO: suyh - 这个还没有处理。

    protected MockDataTask mockDataTask;

    private void init() {
        // spring bean 对象是可以共
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
    }

    @Override
    public void run() {
        init();

        final String env = mockPropertiesEntity.getEnv();
        log.info("start, env: {}", env);
        EnvDsProcessor.ENV.set(env);
        EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.set(mockPropertiesEntity);

        try {
            doRun();
        } catch (Exception e) {
            log.error("some exception happened.", e);
        } finally {
            EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.remove();
            EnvDsProcessor.ENV.remove();

            context.publishEvent(new EnvTaskFinishedEvent(env));
        }
    }

    protected abstract void doRun();

    public void finished() {
        String env = mockPropertiesEntity.getEnv();
        log.info("finished, env: {}", env);
        stopFlag.set(true);
    }
}
