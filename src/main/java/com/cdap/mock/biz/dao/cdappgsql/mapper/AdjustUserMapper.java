package com.cdap.mock.biz.dao.cdappgsql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.biz.dao.cdappgsql.entity.AdjustUserEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2024-03-12
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_PG_CDAP)
public interface AdjustUserMapper extends BaseMapperX<AdjustUserEntity> {
}
