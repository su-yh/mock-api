package com.cdap.mock.env.service;

import com.cdap.mock.biz.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.biz.dao.cdappgsql.entity.AdjustAdEntity;
import com.cdap.mock.biz.dao.cdappgsql.entity.AdjustUserEntity;
import com.cdap.mock.biz.dao.cdappgsql.mapper.AdjustUserMapper;
import com.cdap.mock.vo.TickRuntime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class AdjustService {
    private final Random random = new Random();

    private final AdjustUserMapper adjustUserMapper;

    private final AdvertiserService advertiserService;

    public void mockAdjustUserList(
            @NonNull TickRuntime tickRuntime,
            @NonNull List<TbUserEntity> tbUserEntities) {
        List<AdjustAdEntity> adsAttributeList = advertiserService.obtainAdsAttributeList(tickRuntime);

        if (adsAttributeList == null || adsAttributeList.isEmpty()) {
            log.warn("{} list is empty.", AdjustAdEntity.class.getSimpleName());
            return;
        }

        List<AdjustUserEntity> adjustUserList = new ArrayList<>();

        for (TbUserEntity tbUserEntity : tbUserEntities) {
            String gaid = tbUserEntity.getGaid();
            String channel = tbUserEntity.getChannel();
            if (!StringUtils.hasText(gaid)) {
                continue;
            }
            if (!StringUtils.hasText(channel)) {
                continue;
            }

            // 2.广告用户 adjust_user:1% 的可能，tb_user 中有记录，但是adjust_user 中没有对应记录。
            int excAdjstUser = random.nextInt(100);
            if (excAdjstUser == 0) {
                continue;
            }

            AdjustAdEntity adsAttribute = queryAdsAttribute(adsAttributeList, channel);
            if (adsAttribute == null) {
                log.warn("dataMockAdsInfoEntity is null, by channel: {}", tbUserEntity.getChannel());
                continue;
            }

            AdjustUserEntity adjustUser = new AdjustUserEntity();
            adjustUser.setGaid(gaid);
            adjustUser.setChannel(adsAttribute.getChannel());
            adjustUser.setInstalledAt(0L);
            adjustUser.setSource(adsAttribute.getSource());
            adjustUser.setCampaignId(adsAttribute.getCampaignId());
            adjustUser.setCampaignName(adsAttribute.getCampaignName());
            adjustUser.setAdGroupId(adsAttribute.getAdGroupId());
            adjustUser.setAdGroupName("");
            adjustUser.setAdName("");
            adjustUser.setCreativeId("");
            adjustUser.setCreativeName("");
            adjustUser.setKey(adsAttribute.getKey());
            adjustUser.setAdId(adsAttribute.getAdId());
            adjustUser.setAdidAlias("");
            adjustUser.setDates(tickRuntime.getDates());
            adjustUser.setCreated(new Date(tickRuntime.getTimestampMillis()));
            adjustUserList.add(adjustUser);
        }

        int rnd = random.nextInt(100);
        // 1% 的几率出现异常数据
        if (rnd == 0) {
            if (!adjustUserList.isEmpty()) {
                int rndIdx = random.nextInt(adjustUserList.size());
                AdjustUserEntity adjustUserEntity = adjustUserList.get(rndIdx);
                resetAbnormal(adjustUserEntity);
            }
        }

        adjustUserMapper.insertBatch(adjustUserList);

        log.debug("广告用户广告归因属性 adjust user: {}", adjustUserList.size());
    }

    @Nullable
    private AdjustAdEntity queryAdsAttribute(List<AdjustAdEntity> adsAttributeList, String channel) {
        if (!StringUtils.hasText(channel)) {
            return null;
        }

        AdjustAdEntity adsAttribute = null;
        for (AdjustAdEntity element : adsAttributeList) {
            if (element.getChannel() != null && element.getChannel().equals(channel)) {
                adsAttribute = element;
                break;
            }
        }

        return adsAttribute;
    }

    private void resetAbnormal(AdjustUserEntity adjustUser) {
        int rdsEx = random.nextInt(9);
        switch (rdsEx) {
            case 0:
                adjustUser.setGaid("");
                break;
            case 1:
                adjustUser.setGaid(null);
                break;
            case 2:
                adjustUser.setGaid("0000-0000");
                break;
            case 3:
                adjustUser.setChannel("");
                break;
            case 4:
                adjustUser.setChannel(null);
                break;
            case 5:
                adjustUser.setCampaignId(null);
                break;
            case 6:
                adjustUser.setCampaignId("");
                break;
            case 7:
                adjustUser.setSource(null);
                break;
            case 8:
                adjustUser.setSource("");
                break;
            default:
                break;
        }
    }

}
