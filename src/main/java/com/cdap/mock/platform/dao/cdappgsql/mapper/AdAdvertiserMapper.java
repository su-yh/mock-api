package com.cdap.mock.platform.dao.cdappgsql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.platform.dao.cdappgsql.entity.AdAdvertiserEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_PG_CDAP)
public interface AdAdvertiserMapper extends BaseMapperX<AdAdvertiserEntity> {
}
