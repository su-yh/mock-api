package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.constants.DataSourceEnums;
import com.cdap.mock.constants.DataSourceNames;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface EnvDatasourcePropertiesMapper extends BaseMapperX<EnvDatasourcePropertiesEntity> {
    default EnvDatasourcePropertiesEntity selectByEnvName(String env, DataSourceEnums name) {
        LambdaQueryWrapperX<EnvDatasourcePropertiesEntity> queryWrapperX = build();
        queryWrapperX.eq(EnvDatasourcePropertiesEntity::getEnv, env);
        queryWrapperX.eq(EnvDatasourcePropertiesEntity::getName, name);

        return selectOne(queryWrapperX);
    }
}
