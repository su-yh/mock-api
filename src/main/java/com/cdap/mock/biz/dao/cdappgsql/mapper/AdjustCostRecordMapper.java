package com.cdap.mock.biz.dao.cdappgsql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.biz.dao.cdappgsql.entity.AdjustCostRecordEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2024-06-24
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_PG_CDAP)
public interface AdjustCostRecordMapper extends BaseMapperX<AdjustCostRecordEntity> {
    default AdjustCostRecordEntity selectByUniqueIndex(Integer dates, String channel, String key) {
        LambdaQueryWrapperX<AdjustCostRecordEntity> queryWrapperX = build();

        queryWrapperX.eq(AdjustCostRecordEntity::getDates, dates)
                .eq(AdjustCostRecordEntity::getChannel, channel)
                .eq(AdjustCostRecordEntity::getKey, key);

        return selectOne(queryWrapperX);
    }
}
