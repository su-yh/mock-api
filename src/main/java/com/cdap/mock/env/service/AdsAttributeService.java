package com.cdap.mock.env.service;

import com.cdap.mock.platform.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserCampaignEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdjustAdEntity;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdAdvertiserCampaignMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustAdMapper;
import com.cdap.mock.component.UuidComponent;
import com.cdap.mock.constants.CommonConstants;
import com.cdap.mock.event.AdvertiserCreatedEvent;
import com.cdap.mock.util.CdapStopWatch;
import com.cdap.mock.vo.ProjectPlusEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/**
 * @author suyh
 * @since 2024-12-27
 */
@RequiredArgsConstructor
@Slf4j
public class AdsAttributeService {
    private final Random random = new Random();
    // 投放方相关的组合，所对应的全部广告归因属性列表
    private final Map<Keyed, List<AdjustAdEntity>> keyedCampaignIds = new HashMap<>();

    private final UuidComponent uuidComponent;
    private final AdAdvertiserCampaignMapper adAdvertiserCampaignMapper;
    private final AdjustAdMapper adjustAdMapper;
    private final ProjectService projectService;
    private final ChannelService channelService;

    @EventListener(AdvertiserCreatedEvent.class)
    public void mockAdsAttribute(AdvertiserCreatedEvent event) {
        List<AdAdvertiserEntity> entities = event.getEntities();
        if (entities == null || entities.isEmpty()) {
            log.warn("{}::entities empty.", AdvertiserCreatedEvent.class.getSimpleName());
            return;
        }

        CdapStopWatch stopWatch = new CdapStopWatch("AdsAttribute");
        stopWatch.start("pretreatment");
        List<AdjustAdEntity> adsAttributeEntities = new ArrayList<>();
        List<AdAdvertiserCampaignEntity> adAdvertiserCampaignEntities = new ArrayList<>();

        for (AdAdvertiserEntity entity : entities) {
            Long advertiserId = entity.getId();

            List<Long> projectIds = AdvertiserService.parseAdvertiserProjectIds(entity);

            for (Long projectId : projectIds) {
                ProjectPlusEntity projectPlusEntity = projectService.obtainEntityById(projectId);
                String pn = projectPlusEntity.getPn();

                List<ChannelEntity> channelEntities = channelService.selectListByProjectId(projectId);
                for (ChannelEntity channelEntity : channelEntities) {
                    List<SubChannelEntity> subChannelEntities = channelService.selectByChannelId(channelEntity.getId());

                    for (SubChannelEntity subChannelEntity : subChannelEntities) {
                        String subChannel = subChannelEntity.getChannelCode();
                        if (channelService.isFissileChannel(subChannel)) {  // 裂变渠道没有归因
                            continue;
                        }

                        // 一个投放方，在一个channel下，对应 5 到 10 个广告系列
                        for (int i = 0; i < 100; i++) {
                            // 创建归因属性
                            AdjustAdEntity adsAttribute = buildAdsAttribute(subChannel);
                            adsAttributeEntities.add(adsAttribute);

                            // 广告归因与投放方进行关联
                            {
                                AdAdvertiserCampaignEntity adAdvertiserCampaignEntity = new AdAdvertiserCampaignEntity();
                                adAdvertiserCampaignEntity.setAdvertiserId(advertiserId).setCampaignId(adsAttribute.getCampaignId())
                                        .setChannel(adsAttribute.getChannel()).setPn(pn).setSource(adsAttribute.getSource())
                                        .setEnable(1);

                                adAdvertiserCampaignEntities.add(adAdvertiserCampaignEntity);
                            }
                        }
                    }
                }
            }
        }
        stopWatch.stop();

        log.info("mock adjust attribute, advertiser size: {},  {} size: {}, {} size: {}",
                entities.size(),
                AdjustAdEntity.class.getSimpleName(), adsAttributeEntities.size(),
                AdAdvertiserCampaignEntity.class.getSimpleName(), adAdvertiserCampaignEntities.size());

        stopWatch.start("insertBatchAdsAttribute");
        adjustAdMapper.insertBatch(adsAttributeEntities);
        stopWatch.stop();
        log.info("init {} finished size: {}",
                AdjustAdEntity.class.getSimpleName(), adsAttributeEntities.size());
        stopWatch.start("insertBatchAdCampaign");
        adAdvertiserCampaignMapper.insertBatch(adAdvertiserCampaignEntities);
        stopWatch.stop();
        log.info("init {} finished size: {}",
                AdAdvertiserCampaignEntity.class.getSimpleName(), adAdvertiserCampaignEntities.size());

        log.info("{}", stopWatch.prettyPrint());
    }

    public void init() {
        List<AdjustAdEntity> adjustAdEntities = adjustAdMapper.selectList();
        // 按广告系列进行分组
        Map<String, List<AdjustAdEntity>> campaignMap = adjustAdEntities.stream().collect(Collectors.groupingBy(AdjustAdEntity::getCampaignId));

        List<AdAdvertiserCampaignEntity> adAdvertiserCampaignEntities = adAdvertiserCampaignMapper.selectList();
        for (AdAdvertiserCampaignEntity adAdvertiserCampaignEntity : adAdvertiserCampaignEntities) {
            Keyed keyed = new Keyed();
            keyed.setPn(adAdvertiserCampaignEntity.getPn())
                    .setAdvertiserId(adAdvertiserCampaignEntity.getAdvertiserId())
                    .setChannel(adAdvertiserCampaignEntity.getChannel());
            List<AdjustAdEntity> adsAttrList = keyedCampaignIds.computeIfAbsent(keyed, k -> new ArrayList<>());
            List<AdjustAdEntity> adjustAdEntityList = campaignMap.get(adAdvertiserCampaignEntity.getCampaignId());
            adsAttrList.addAll(adjustAdEntityList);
        }
    }

    private AdjustAdEntity buildAdsAttribute(String channel) {
        // 随机取source
        int sceIdx = random.nextInt(3);
        String source = CommonConstants.GG;
        if (sceIdx == 2) {
            source = CommonConstants.FB;
        }

        String campaignId = uuidComponent.uuidStr();
        String campaignName = uuidComponent.uuidStr();
        String adGroupId = uuidComponent.uuidStr();
        String adId = uuidComponent.uuidStr();
        String keyValue = String.format("%s_KEY_%s_%s_%s_%s", source, channel, campaignId, adGroupId, adId);

        AdjustAdEntity adsAttribute = new AdjustAdEntity();
        adsAttribute.setChannel(channel);
        adsAttribute.setCampaignId(source + "_id_" + campaignId);
        adsAttribute.setCampaignName(source + "_campaignName_" + campaignName);
        adsAttribute.setAdGroupId(source + "_adGroupId_" + adGroupId);
        adsAttribute.setAdId(source + "_adId_" + adId);
        adsAttribute.setSource(source);
        adsAttribute.setKey(keyValue);
        return adsAttribute;
    }

    public synchronized List<AdjustAdEntity> getAdsAttributeList(
            Long advertiserId, String pn, String channel) {
        Keyed keyed = new Keyed();
        keyed.setAdvertiserId(advertiserId).setPn(pn).setChannel(channel);
        return keyedCampaignIds.get(keyed);
    }

    @Data
    public static class Keyed {
        private Long advertiserId;
        private String pn;
        private String channel;
    }
}
