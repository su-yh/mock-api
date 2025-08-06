package com.cdap.mock.biz.dao.cdappgsql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.biz.dao.cdappgsql.entity.AdjustAdEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2024-04-24
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_PG_CDAP)
public interface AdjustAdMapper extends BaseMapperX<AdjustAdEntity> {
}
