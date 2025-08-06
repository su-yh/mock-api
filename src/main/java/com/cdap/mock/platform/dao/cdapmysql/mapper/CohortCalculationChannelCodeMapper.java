package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.CohortCalculationChannelCodeEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2024-12-16
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface CohortCalculationChannelCodeMapper extends BaseMapperX<CohortCalculationChannelCodeEntity> {

    default CohortCalculationChannelCodeEntity selectEntity(Long pnId, Integer channelId, String channelCode) {
        LambdaQueryWrapperX<CohortCalculationChannelCodeEntity> queryWrapperX = build();
        queryWrapperX.eq(CohortCalculationChannelCodeEntity::getPnId, pnId)
                .eq(CohortCalculationChannelCodeEntity::getChannel, channelId)
                .eq(CohortCalculationChannelCodeEntity::getChannelCode, channelCode);

        return selectOne(queryWrapperX);
    }
}
