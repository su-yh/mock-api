package com.cdap.mock.job;

import com.baomidou.dynamic.datasource.annotation.DSTransactional;
import com.cdap.mock.constants.MockModeEnums;
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
import com.cdap.mock.mp.processor.EnvDsProcessor;
import com.cdap.mock.mq.produce.RabbitProduceComponent;
import com.cdap.mock.platform.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbRechargeEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserLoginEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbWithdrawalEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.util.CdapDateUtils;
import com.cdap.mock.util.CdapStopWatch;
import com.cdap.mock.vo.ProjectPlusEntity;
import com.cdap.mock.vo.TickAttribute;
import com.cdap.mock.vo.TickRuntime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RequiredArgsConstructor
@Slf4j
public class MockDataTask {
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    private boolean initialization = false;
    private List<TickAttribute> tickAttributes;
    private Long timeBeginMillisByDateRange;

    private final Random random = new Random();

//    private final DataMockPlusProperties properties;
    private final RabbitProduceComponent rmqProduce;

    private final TbUserService tbUserService;
    private final TbUserLoginService tbUserLoginService;
    private final TbRechargeService tbRechargeService;
    private final TbWithdrawalService tbWithdrawalService;

    private final AdjustService adjustService;
    private final ProjectService projectService;
    private final ChannelService channelService;
    private final RateService rateService;
    private final AdvertiserService advertiserService;
    private final RoiService roiService;
    private final AdsAttributeService adsAttributeService;

    private synchronized void init() {
        if (initialization) {
            return;
        }
        initialization = true;

        projectService.init();
        channelService.init();
        rateService.init();
        List<AdAdvertiserEntity> adAdvertiserEntities = advertiserService.init();
        adsAttributeService.mockAdsAttribute(adAdvertiserEntities); // 新建的投放方，先调用此方法，原来的事件需要spring 容器
        adsAttributeService.init();
        Long timeBegin = obtainDateRangeTimeBegin();
        tbUserLoginService.init(timeBegin);
        roiService.init();

        initTickAttributeList();
    }

    @DSTransactional
    public void doDataMockTick(long timestampMillis) {
        init();

        if (tickAttributes.isEmpty()) {
            log.error("tickAttributes is empty.");
            return;
        }

        CdapStopWatch stopWatch = new CdapStopWatch("tick");

        stopWatch.start("step_1-mockRateDate");
        rateService.mockRateData(timestampMillis);
        stopWatch.stop();

        TickRuntime tickRuntime = randomTickRuntime(timestampMillis);

        stopWatch.start("step_2-mockTbUserList");
        List<TbUserEntity> tbUserEntities = tbUserService.mockTbUserList(tickRuntime);
        stopWatch.stop();

        stopWatch.start("step_3-mockAdjustUserList");
        adjustService.mockAdjustUserList(tickRuntime, tbUserEntities);
        stopWatch.stop();

        stopWatch.start("step_4-mockTbUserLoginList");
        List<TbUserLoginEntity> tbUserLoginEntities = tbUserLoginService.mockTbUserLoginList(tickRuntime);
        stopWatch.stop();

        stopWatch.start("step_5-mockTbRechargeList");
        List<TbRechargeEntity> tbRechargeEntities = tbRechargeService.mockTbRechargeList(tickRuntime);
        stopWatch.stop();

        stopWatch.start("step_6-mockTbWithdrawalList");
        List<TbWithdrawalEntity> tbWithdrawalEntities = tbWithdrawalService.mockTbWithdrawalList(tickRuntime);
        stopWatch.stop();

        stopWatch.start("step_7-rmq");
        MockPropertiesEntity mockPropertiesEntity = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get();
        if (mockPropertiesEntity.getRmqEnabled()) {
            rmqProduce.sendTbUserMessage(tbUserEntities);
            rmqProduce.sendTbUserLoginMessage(tbUserLoginEntities);
            rmqProduce.sendTbUserRechargeMessage(tbRechargeEntities);
            rmqProduce.sendTbUserWithdrawalMessage(tbWithdrawalEntities);
        }
        stopWatch.stop();

        TickAttribute tickAttribute = tickRuntime.getTickAttribute();
        String pn = tickAttribute.getProjectPlusEntity().getPn();
        String zoneIdOffset = tickAttribute.getProjectPlusEntity().getZoneIdOffset();
        LocalDateTime pnDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(timestampMillis), ZoneOffset.of(zoneIdOffset));
        LocalDateTime sysDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(timestampMillis), ZoneId.systemDefault());
        String pnDateTimeFmt = pnDateTime.format(formatter);
        String sysDateTimeFmt = sysDateTime.format(formatter);

        String env = EnvDsProcessor.ENV.get();
        if (true) {
            log.info("注册: {}，登录: {}, 充值: {}, 提现: {}",
                    tbUserEntities.size(), tbUserLoginEntities.size(), tbRechargeEntities.size(), tbWithdrawalEntities.size());
            log.info("\n======= env: {}, systemTime: {}, pnTime: {}, pn: {}\n{}", env, sysDateTimeFmt, pnDateTimeFmt, pn, stopWatch.prettyPrint());
        } else {
            // 执行性能问题的调试日志
            if (mockPropertiesEntity.getMode() == MockModeEnums.TIMER_JOB) {
                log.info("注册: {}，登录: {}, 充值: {}, 提现: {}",
                        tbUserEntities.size(), tbUserLoginEntities.size(), tbRechargeEntities.size(), tbWithdrawalEntities.size());
                log.info("\n======= systemTime: {}, pnTime: {}, pn: {}\n{}", sysDateTimeFmt, pnDateTimeFmt, pn, stopWatch.prettyPrint());
            } else {
                if (stopWatch.getTotalTimeSeconds() < 2) {
                    log.debug("\n======= systemTime: {}, pnTime: {}, pn: {}", sysDateTimeFmt, pnDateTimeFmt, pn);
                } else {
                    log.info("注册: {}，登录: {}, 充值: {}, 提现: {}",
                            tbUserEntities.size(), tbUserLoginEntities.size(), tbRechargeEntities.size(), tbWithdrawalEntities.size());
                    log.warn("\n======= systemTime: {}, pnTime: {}, pn: {}\n{}",
                            sysDateTimeFmt, pnDateTimeFmt, pn, stopWatch.prettyPrint());
                }
            }
        }
    }

    private TickRuntime randomTickRuntime(long timestampMillis) {
        int rndIdx = random.nextInt(tickAttributes.size());
        TickAttribute tickAttribute = tickAttributes.get(rndIdx);

        ProjectPlusEntity projectPlusEntity = tickAttribute.getProjectPlusEntity();
        ZoneId zoneId = projectPlusEntity.getZoneOffset();
        if (zoneId == null) {
            throw new RuntimeException("no zoneId, pn: " + projectPlusEntity.getPn());
        }

        int dates = CdapDateUtils.timestampToDate(timestampMillis, zoneId);

        TickRuntime tickRuntime = new TickRuntime();
        tickRuntime.setTickAttribute(tickAttribute).setTimestampMillis(timestampMillis).setDates(dates);
        return tickRuntime;
    }

    @NonNull
    private void initTickAttributeList() {
        List<AdAdvertiserEntity> adAdvertiserEntities = advertiserService.adAdvertiserEntityList();
        if (adAdvertiserEntities == null || adAdvertiserEntities.isEmpty()) {
            log.error("initTickAttributeList failed, no advertiser");
            return;
        }

        List<ProjectPlusEntity> projectPlusEntities = projectService.projectEntityList();
        if (projectPlusEntities == null || projectPlusEntities.isEmpty()) {
            log.error("initTickAttributeList failed, project is empty.");
            return;
        }

        tickAttributes = new ArrayList<>();

        for (AdAdvertiserEntity adAdvertiserEntity : adAdvertiserEntities) {
            String projectIds = adAdvertiserEntity.getProjectIds();
            String[] pnIds = projectIds.split(",");
            List<Long> idList = new ArrayList<>();
            for (String pnIdStr : pnIds) {
                if (StringUtils.hasText(pnIdStr)) {
                    idList.add(Long.valueOf(pnIdStr));
                }
            }

            for (Long pnId : idList) {
                ProjectPlusEntity projectPlusEntity = projectService.obtainEntityById(pnId);
                if (projectPlusEntity == null) {
                    log.error("no project entity, by id: {}", pnId);
                    continue;
                }

                TickAttribute tickAttribute = new TickAttribute();
                tickAttribute.setAdvertiserEntity(adAdvertiserEntity);
                tickAttribute.setProjectPlusEntity(projectPlusEntity);

                List<ChannelEntity> channelEntities = channelService.selectListByProjectId(projectPlusEntity.getId());
                do {
                    if (channelEntities == null || channelEntities.isEmpty()) {
                        log.warn("no channel by pn: {}", projectPlusEntity.getPn());
                        break;
                    }

                    for (ChannelEntity channelEntity : channelEntities) {
                        List<SubChannelEntity> subChannelEntities = channelService.selectByChannelId(channelEntity.getId());
                        do {
                            if (subChannelEntities == null || channelEntities.isEmpty()) {
                                log.warn("no subChannel by pn: {}, channel: {}", projectPlusEntity.getPn(), channelEntity.getChannelName());
                                break;
                            }
                            tickAttribute.setSubChannelEntities(subChannelEntities);

                            // 都是有效数据才会生成一个 vo
                            tickAttributes.add(tickAttribute);
                        } while (false);
                    }
                } while (false);
            }
        }

        if (tickAttributes.isEmpty()) {
            log.warn("initTickAttributeList is empty.");
        }

        for (TickAttribute tickAttribute : tickAttributes) {
            log.info("pn: {}, {}", tickAttribute.getProjectPlusEntity().getPn(), TickAttribute.class.getSimpleName());
        }
    }

    @Nullable
    public synchronized Long obtainDateRangeTimeBegin() {
        MockPropertiesEntity mockPropertiesEntity = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get();
        MockModeEnums mode = mockPropertiesEntity.getMode();
        if (mode != MockModeEnums.DATE_RAGE) {
            return null;
        }

        if (timeBeginMillisByDateRange == null) {
            timeBeginMillisByDateRange = mockPropertiesEntity.getTsBegin();

            Long registryMaxCtime = tbUserService.obtainMaxCtime();
            if (registryMaxCtime != null) {
                registryMaxCtime += 60; // 不能以数据库中存在的时间作为开始时间，需要往后延迟一段时间才可以。

                timeBeginMillisByDateRange = Math.max(registryMaxCtime * 1000L, timeBeginMillisByDateRange);
            }
        }

        return timeBeginMillisByDateRange;
    }
}
