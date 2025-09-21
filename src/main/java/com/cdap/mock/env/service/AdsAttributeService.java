package com.cdap.mock.env.service;

import com.cdap.mock.constants.CommonConstants;
import com.cdap.mock.platform.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserCampaignEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdKeywordsCampaignEntity;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdjustAdEntity;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdAdvertiserCampaignMapper;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdjustAdMapper;
import com.cdap.mock.util.CdapStopWatch;
import com.cdap.mock.util.IdGenerator;
import com.cdap.mock.vo.ProjectPlusEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

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

    private final IdGenerator idGenerator;
    private final AdAdvertiserCampaignMapper adAdvertiserCampaignMapper;
    private final AdjustAdMapper adjustAdMapper;
    private final ProjectService projectService;
    private final ChannelService channelService;
    private final AdKeywordsCampaignService adKeywordsCampaignService;

    public void mockAdsAttribute(List<AdAdvertiserEntity> entities) {
        if (entities == null || entities.isEmpty()) {
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

        syncKeyWord(adsAttributeEntities);

        log.info("{}", stopWatch.prettyPrint());
    }

    private void syncKeyWord(List<AdjustAdEntity> adsAttributeEntities) {
        if (adsAttributeEntities == null || adsAttributeEntities.isEmpty()) {
            return;
        }

        List<AdKeywordsCampaignEntity> insertEntities = new ArrayList<>();

        for (AdjustAdEntity adsAttributeEntity : adsAttributeEntities) {
            String campaignName = adsAttributeEntity.getCampaignName();
            String campaignId = adsAttributeEntity.getCampaignId();
            String source = adsAttributeEntity.getSource();
            String channel = adsAttributeEntity.getChannel();

            String keyWord = extractKeyWord(random, campaignName);
            if (!StringUtils.hasText(keyWord)) {
                continue;
            }
            if (!StringUtils.hasText(campaignId)) {
                continue;
            }
            if (!StringUtils.hasText(source)) {
                continue;
            }
            if (!StringUtils.hasText(channel)) {
                continue;
            }

            AdKeywordsCampaignEntity insertEntity = new AdKeywordsCampaignEntity();
            insertEntity.setCampaignName(campaignName);
            insertEntity.setKeyword(keyWord);
            insertEntity.setCampaignId(campaignId);
            insertEntity.setSource(source);
            insertEntity.setChannel(channel);

            insertEntities.add(insertEntity);
        }

        adKeywordsCampaignService.insertBatch(insertEntities);
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

        String campaignId = idGenerator.nextUuid();
        String campaignName = idGenerator.nextUuid();
        String adGroupId = idGenerator.nextUuid();
        String adId = idGenerator.nextUuid();
        String pkg = idGenerator.nextUuid();
        // "pkg-${pkg}-channelid-${channelid}-source-${source}-campaign-${campaign}-adgroup-${adgroup}"
        // String keyValue = String.format("%s_KEY_%s_%s_%s_%s", source, channel, campaignId, adGroupId, adId);
        String keyValue = String.format("pkg-%s-channelid-%s-source-%s-campaign-%s-adgroup-%s", pkg, channel, source, campaignId, adGroupId);

        AdjustAdEntity adsAttribute = new AdjustAdEntity();
        adsAttribute.setChannel(channel);
        adsAttribute.setCampaignId(source + "_id_" + campaignId);
        adsAttribute.setCampaignName(source + "_campaignName_" + campaignName);
        adsAttribute.setAdGroupId(source + "_adGroupId_" + adGroupId);
        adsAttribute.setAdId(source + "_adId_" + adId);
        adsAttribute.setSource(source);
        adsAttribute.setKey(keyValue);
        adsAttribute.setPkg(pkg);
        return adsAttribute;
    }

    public synchronized List<AdjustAdEntity> getAdsAttributeList(
            Long advertiserId, String pn, String channel) {
        Keyed keyed = new Keyed();
        keyed.setAdvertiserId(advertiserId).setPn(pn).setChannel(channel);
        return keyedCampaignIds.get(keyed);
    }


    /**
     * 从字符串中随机提取连续的3到8个字符
     *
     * @param campaignName 要提取字符的原始字符串
     * @return 提取出的子字符串，如果原始字符串长度不足3则返回null
     */
    public static String extractKeyWord(Random random, String campaignName) {
        // 检查输入字符串是否有效且长度至少为3
        if (campaignName == null || campaignName.length() < 3) {
            return null;
        }

        // 计算最大可能的起始索引，确保至少能提取3个字符
        int maxStartIndex = campaignName.length() - 3;

        // 随机生成起始索引
        int startIndex = random.nextInt(maxStartIndex + 1);

        // 计算剩余可用字符数
        int remainingLength = campaignName.length() - startIndex;

        // 确定最大可能的子串长度（不超过8且不超过剩余字符数）
        int maxPossibleLength = Math.min(8, remainingLength);

        // 随机生成3到maxPossibleLength之间的长度
        int substringLength = 3 + random.nextInt(maxPossibleLength - 3 + 1);

        // 计算结束索引
        int endIndex = startIndex + substringLength;

        // 提取并返回子串
        return campaignName.substring(startIndex, endIndex);
    }

    @Data
    public static class Keyed {
        private Long advertiserId;
        private String pn;
        private String channel;
    }
}
