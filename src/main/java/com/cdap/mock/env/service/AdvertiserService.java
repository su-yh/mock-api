package com.cdap.mock.env.service;

import com.baomidou.dynamic.datasource.annotation.DSTransactional;
import com.cdap.mock.constants.DataMockConstants;
import com.cdap.mock.platform.dao.cdapmysql.entity.ProjectEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdjustAdEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdjustCostRecordEntity;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdAdvertiserMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustCostRecordMapper;
import com.cdap.mock.util.IdGenerator;
import com.cdap.mock.vo.ProjectPlusEntity;
import com.cdap.mock.vo.TickAttribute;
import com.cdap.mock.vo.TickRuntime;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class AdvertiserService {
    private final Random random = new Random();
    private Cache<String, List<AdjustAdEntity>> cacheDatesAds;
    private List<AdAdvertiserEntity> advertiserEntities;

    private final AdAdvertiserMapper adAdvertiserMapper;
    private final AdjustCostRecordMapper adjustCostRecordMapper;

    private final IdGenerator idGenerator;
    private final ProjectService projectService;
    private final ChannelService channelService;
    private final AdsAttributeService adsAttributeService;

    /**
     * 返回方法当前新建的投放方
     */
    @DSTransactional
    public synchronized List<AdAdvertiserEntity> init() {
        cacheDatesAds = Caffeine.newBuilder()
                .expireAfterWrite(1, TimeUnit.DAYS).initialCapacity(4096).build();

        List<AdAdvertiserEntity> list = adAdvertiserMapper.selectList();
        if (list != null && !list.isEmpty()) {
            return null;
        }

        List<ProjectPlusEntity> projectEntities = projectService.projectEntityList();
        if (projectEntities == null || projectEntities.isEmpty()) {
            log.warn("no project init system advertiser failed.");
            return null;
        }

        List<AdAdvertiserEntity> advertiserList = new ArrayList<>();

        // 首先保证每一个项目都有至少一个投放方与之关联
        for (ProjectEntity projectEntity : projectEntities) {
            List<Long> ids = Collections.singletonList(projectEntity.getId());

            AdAdvertiserEntity advertiserEntity = buildAdvertiserEntity(ids);
            advertiserList.add(advertiserEntity);
        }

        // 一个投放方与当前所有的项目相关联，若是后期增加的，将不会走到这里。
        {
            List<Long> ids = new ArrayList<>();

            for (ProjectEntity projectEntity : projectEntities) {
                ids.add(projectEntity.getId());
            }

            AdAdvertiserEntity advertiserEntity = buildAdvertiserEntity(ids);
            advertiserList.add(advertiserEntity);
        }

        if (projectEntities.size() > 3) {
            List<Long> ids = new ArrayList<>();

            // 随机取两个
            for (int i = 0; i < 2; ) {
                int idx = random.nextInt(projectEntities.size());
                ProjectEntity projectEntity = projectEntities.get(idx);
                if (ids.contains(projectEntity.getId())) {
                    continue;
                }

                ids.add(projectEntity.getId());
                i++;
            }

            AdAdvertiserEntity advertiserEntity = buildAdvertiserEntity(ids);
            advertiserList.add(advertiserEntity);
        }

        adAdvertiserMapper.insertBatch(advertiserList);

        log.info("---------初始化 advertiser size: {} ---", advertiserList.size());
        return advertiserList;
    }

    private AdAdvertiserEntity buildAdvertiserEntity(List<Long> projectIds) {
        String advertiser = idGenerator.nextUuid();
        AdAdvertiserEntity advertiserEntity = new AdAdvertiserEntity();
        advertiserEntity.setName("advertiserName_" + advertiser);
        advertiserEntity.setSysUserId(-1L);
        advertiserEntity.setKeywords("");
        advertiserEntity.setCreated(new Date());

        StringBuilder pids = new StringBuilder();
        for (int i = 0; i < projectIds.size(); i++) {
            Long id = projectIds.get(i);
            pids.append(id);
            if (i < projectIds.size() - 1) {
                pids.append(",");
            }
        }

        Integer singlePn = projectIds.size() > 1 ? 1 : 0;
        advertiserEntity.setSinglePn(singlePn);
        advertiserEntity.setProjectIds(pids.toString());

        return advertiserEntity;
    }

    public static List<Long> parseAdvertiserProjectIds(AdAdvertiserEntity entity) {
        List<Long> ids = new ArrayList<>();

        String[] strIds = entity.getProjectIds().split(",");
        for (String strId : strIds) {
            strId = strId.trim();
            if (strId.isEmpty()) {
                continue;
            }
            long id = Long.parseLong(strId);
            if (id <= 0) {
                throw new RuntimeException("project id parse failed, id: " + id);
            }

            ids.add(id);
        }

        return ids;
    }

    public synchronized List<AdAdvertiserEntity> adAdvertiserEntityList() {
        if (advertiserEntities != null) {
            return advertiserEntities;
        }
        List<AdAdvertiserEntity> entities = adAdvertiserMapper.selectList();
        if (entities == null) {
            entities = new ArrayList<>();
        }

        advertiserEntities = entities;

        return advertiserEntities;
    }

    // 一个投放方一个pn 一天只有一次
    public synchronized List<AdjustAdEntity> obtainAdsAttributeList(
            @NonNull TickRuntime tickRuntime) {

        Long advertiserId = tickRuntime.getTickAttribute().getAdvertiserEntity().getId();
        String pn = tickRuntime.getTickAttribute().getProjectPlusEntity().getPn();

        // suyh - 广告系列一天一次。
        String cacheKey = String.format("%d_%d_%s", tickRuntime.getDates(), advertiserId, pn);
        List<AdjustAdEntity> adsAttributeList = cacheDatesAds.getIfPresent(cacheKey);
        if (adsAttributeList != null && !adsAttributeList.isEmpty()) {
            return adsAttributeList;
        }

        adsAttributeList = obtainAdsAttributieList(tickRuntime);

        // 对应的花费
        mockAdjustCostRecord(adsAttributeList, tickRuntime.getDates(), tickRuntime.getTimestampMillis());

        cacheDatesAds.put(cacheKey, adsAttributeList);

        return adsAttributeList;
    }

    @NonNull
    private List<AdjustAdEntity> obtainAdsAttributieList(@NonNull TickRuntime tickRuntime) {
        TickAttribute tickAttribute = tickRuntime.getTickAttribute();
        ProjectEntity projectEntity = tickAttribute.getProjectPlusEntity();
        List<SubChannelEntity> subChannelList = tickAttribute.getSubChannelEntities();
        AdAdvertiserEntity adAdver = tickAttribute.getAdvertiserEntity();
        Long advertiserId = adAdver.getId();

        List<AdjustAdEntity> adsAttributeList = new ArrayList<>();

        for (SubChannelEntity subChannelEntity : subChannelList) {
            String channel = subChannelEntity.getChannelCode();

            List<AdjustAdEntity> channelAdsAttributeList = adsAttributeService.getAdsAttributeList(
                    advertiserId, projectEntity.getPn(), channel);

            // 每个channel 随机取一到两个广告系列作为活跃的广告系列
            // 随机到相同的就只有一个，随机到不同的就两个
            int idxTmp01 = random.nextInt(channelAdsAttributeList.size());
            AdjustAdEntity entity01 = channelAdsAttributeList.get(idxTmp01);
            int idxTmp02 = random.nextInt(channelAdsAttributeList.size());
            AdjustAdEntity entity02 = channelAdsAttributeList.get(idxTmp02);
            adsAttributeList.add(entity01);
            if (!entity02.getId().equals(entity01.getId())) {
                adsAttributeList.add(entity02);
            }
        }

        return adsAttributeList;
    }

    public void mockAdjustCostRecord(
            List<AdjustAdEntity> adsAttributeList, int dates, long timestampMills) {
        if (adsAttributeList == null || adsAttributeList.isEmpty()) {
            return;
        }

        List<AdjustCostRecordEntity> adCostRcdList = new ArrayList<>();
        for (AdjustAdEntity adsAttribute : adsAttributeList) {
            // 裂变渠道没有花费
            String channel = adsAttribute.getChannel();
            if (channelService.isFissileChannel(channel)) {
                continue;
            }

            // adjust_cost_record  消费记录
            AdjustCostRecordEntity entity = new AdjustCostRecordEntity();
            entity.setDates(dates);
            entity.setChannel(channel);
            entity.setPkg("");
            entity.setAppToken("");
            entity.setSource(adsAttribute.getSource());
            entity.setCampaignId(adsAttribute.getCampaignId());
            entity.setAdGroupId(adsAttribute.getAdGroupId());
            entity.setAdId(adsAttribute.getAdId());
            entity.setKey(adsAttribute.getKey());

            // 花费总是印度卢比货币
            BigDecimal usdValue = randomBigDecimal();
            // 这里直接使用基础汇率就可以了，不用那么麻烦，因为本来就是随机值，汇率不需要准确，差不多就可以了。
            BigDecimal usdRate = DataMockConstants.PROJECT_INR.getBaseUsdRate();
            BigDecimal inrValue = usdValue.multiply(usdRate);
            entity.setCost(inrValue);

            entity.setCreated(new Date(timestampMills)).setUpdated(new Date(timestampMills));

            AdjustCostRecordEntity historyEntity = adjustCostRecordMapper.selectByUniqueIndex(
                    entity.getDates(), entity.getChannel(), entity.getKey());
            if (historyEntity == null) {
                // 没有花费才需要添加花费，如果已经产生过花费，则跳过。
                // 这是处理重启的情况。
                adCostRcdList.add(entity);
            }
        }

        int adtc = random.nextInt(100);
        if (adtc == 0) {
            if (!adCostRcdList.isEmpty()) {
                // 重置为异常数据
                int rndIdx = random.nextInt(adCostRcdList.size());
                AdjustCostRecordEntity adjustCostRecordEntity = adCostRcdList.get(rndIdx);
                resetAbnormal(adjustCostRecordEntity);
            }
        }

        // 15. 插入到数据库  pg ---> adjust_cost_record
        adjustCostRecordMapper.insertBatch(adCostRcdList);
    }

    private void resetAbnormal(AdjustCostRecordEntity adjustCostRecordEntity) {
        int rdsEx = random.nextInt(10);
        switch (rdsEx) {
            case 0:
                adjustCostRecordEntity.setCampaignId("");
                break;
            case 1:
                adjustCostRecordEntity.setCampaignId(null);
                break;
            case 2:
                adjustCostRecordEntity.setChannel("");
                break;
            case 3:
                adjustCostRecordEntity.setChannel(null);
                break;
            case 4:
                adjustCostRecordEntity.setKey(null);
                break;
            case 5:
                adjustCostRecordEntity.setKey("");
                break;
            case 6:
                adjustCostRecordEntity.setSource(null);
                break;
            case 7:
                adjustCostRecordEntity.setSource("");
                break;
            case 8:
                adjustCostRecordEntity.setCost(null);
                break;
            case 9:
                adjustCostRecordEntity.setCost(BigDecimal.ZERO);
                break;
            default:
                break;
        }
    }

    private BigDecimal randomBigDecimal() {
        double doubleValue = random.nextDouble() * 50.0 + 50.0d;
        return BigDecimal.valueOf(doubleValue);
    }
}
