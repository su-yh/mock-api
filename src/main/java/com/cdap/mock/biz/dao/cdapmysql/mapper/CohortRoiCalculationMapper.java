package com.cdap.mock.biz.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.biz.dao.cdapmysql.entity.CohortRoiCalculationEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2024-12-16
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface CohortRoiCalculationMapper extends BaseMapperX<CohortRoiCalculationEntity> {

}
