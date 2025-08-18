package com.cdap.mock.env.service;

import com.baomidou.dynamic.datasource.annotation.DSTransactional;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdKeywordsCampaignEntity;
import com.cdap.mock.platform.dao.cdappgsql.mapper.AdKeywordsCampaignMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author suyh
 * @since 2025-08-08
 */
@RequiredArgsConstructor
@Slf4j
public class AdKeywordsCampaignService {
    private final AdKeywordsCampaignMapper adKeywordsCampaignMapper;

    @DSTransactional
    public void insertBatch(List<AdKeywordsCampaignEntity> entities) {
        List<AdKeywordsCampaignEntity> insertEntities = filterUniqueIndex(entities);

        if (insertEntities == null || insertEntities.isEmpty()) {
            return;
        }

        adKeywordsCampaignMapper.insertBatch(entities);
    }

    private List<AdKeywordsCampaignEntity> filterUniqueIndex(List<AdKeywordsCampaignEntity> entities) {
        if (entities == null || entities.isEmpty()) {
            return null;
        }

        List<AdKeywordsCampaignEntity> adKeywordsCampaignEntities = adKeywordsCampaignMapper.selectList();
        if (adKeywordsCampaignEntities == null || adKeywordsCampaignEntities.isEmpty()) {
            return entities;
        }

        Set<String> uniqueIndexSet = new HashSet<>();
        for (AdKeywordsCampaignEntity adKeywordsCampaignEntity : adKeywordsCampaignEntities) {
            String uniqueIndex = buildUniqueIndex(adKeywordsCampaignEntity);
            uniqueIndexSet.add(uniqueIndex);
        }

        List<AdKeywordsCampaignEntity> resultEntities = new ArrayList<>();
        for (AdKeywordsCampaignEntity entity : entities) {
            String uniqueIndex = buildUniqueIndex(entity);
            if (uniqueIndexSet.add(uniqueIndex)) {
                resultEntities.add(entity);
            }
        }

        return resultEntities;
    }

    private static String buildUniqueIndex(AdKeywordsCampaignEntity entity) {
        String keyword = entity.getKeyword();
        String campaignId = entity.getCampaignId();
        String source = entity.getSource();
        return keyword + campaignId + source;
    }
}
