package com.cdap.mock.env.service;

import com.cdap.mock.biz.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.CohortCalculationChannelCodeEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.CohortRoiCalculationConfEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.CohortRoiCalculationEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.ProjectEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.biz.dao.cdapmysql.mapper.CohortCalculationChannelCodeMapper;
import com.cdap.mock.biz.dao.cdapmysql.mapper.CohortRoiCalculationConfMapper;
import com.cdap.mock.biz.dao.cdapmysql.mapper.CohortRoiCalculationMapper;
import com.cdap.mock.vo.ProjectPlusEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Random;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class RoiService {
    private final Random random = new Random();

    private final CohortRoiCalculationMapper cohortRoiCalculationMapper;
    private final CohortRoiCalculationConfMapper cohortRoiCalculationConfMapper;
    private final CohortCalculationChannelCodeMapper cohortCalculationChannelCodeMapper;

    private final ProjectService projectService;
    private final ChannelService channelService;

    public void init() {
        List<ProjectPlusEntity> projectEntities = projectService.projectEntityList();
        if (projectEntities == null || projectEntities.isEmpty()) {
            log.error("PROJECT IS EMPTY.");
            return;
        }
        for (ProjectEntity projectEntity : projectEntities) {
            List<ChannelEntity> channelEntities = channelService.selectListByProjectId(projectEntity.getId());
            if (channelEntities == null || channelEntities.isEmpty()) {
                log.warn("channelEntities IS EMPTY.");
                continue;
            }

            for (ChannelEntity channelEntity : channelEntities) {
                List<SubChannelEntity> subChannelEntities = channelService.selectByChannelId(channelEntity.getId());
                if (subChannelEntities == null || subChannelEntities.isEmpty()) {
                    log.warn("subChannelEntities IS EMPTY.");
                    continue;
                }
                for (SubChannelEntity subChannelEntity : subChannelEntities) {

                    initEntities(projectEntity, channelEntity, subChannelEntity);
                }
            }
        }
    }

    private void initEntities(ProjectEntity projectEntity, ChannelEntity channelEntity, SubChannelEntity subChannelEntity) {
        CohortCalculationChannelCodeEntity historyEntity = cohortCalculationChannelCodeMapper.selectEntity(
                projectEntity.getId(), channelEntity.getId(), subChannelEntity.getChannelCode());
        if (historyEntity != null) {
            return;
        }

        CohortRoiCalculationEntity cohortRoiCalculationEntity = new CohortRoiCalculationEntity();
        cohortRoiCalculationEntity.setPnId(projectEntity.getId());
        cohortRoiCalculationEntity.setStatus(1);
        cohortRoiCalculationMapper.insert(cohortRoiCalculationEntity);

        // cohort_calculation_channel_code 需要 cohort_roi_calculation 的主键ID
        CohortCalculationChannelCodeEntity cohortCalculationChannelCodeEntity = new CohortCalculationChannelCodeEntity();
        cohortCalculationChannelCodeEntity.setPnId(projectEntity.getId());
        cohortCalculationChannelCodeEntity.setChannel(channelEntity.getId().longValue());
        cohortCalculationChannelCodeEntity.setChannelCode(subChannelEntity.getChannelCode());
        cohortCalculationChannelCodeEntity.setPid(cohortRoiCalculationEntity.getId());
        cohortCalculationChannelCodeMapper.insert(cohortCalculationChannelCodeEntity);

        // CohortRoiCalculationConfEntity 需要 cohort_calculation_channel_code 的主键ID
        // 1% -> 10%
        BigDecimal rechargeFee = BigDecimal.valueOf(random.nextInt(10) + 1).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        BigDecimal withdrawalFee = BigDecimal.valueOf(random.nextInt(10) + 1).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        BigDecimal departureFee = BigDecimal.valueOf(random.nextInt(10) + 1).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        // 5 -> 30%
        BigDecimal proportion = BigDecimal.valueOf(random.nextInt(25) + 5).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);

        CohortRoiCalculationConfEntity cohortRoiCalculationConfEntity = new CohortRoiCalculationConfEntity();
        cohortRoiCalculationConfEntity.setRechargeFee(rechargeFee);
        cohortRoiCalculationConfEntity.setWithdrawalFee(withdrawalFee);
        cohortRoiCalculationConfEntity.setProportion(proportion);
        cohortRoiCalculationConfEntity.setDepartureFee(departureFee);
        cohortRoiCalculationConfEntity.setPid(cohortCalculationChannelCodeEntity.getId());
        cohortRoiCalculationConfMapper.insert(cohortRoiCalculationConfEntity);
    }
}
