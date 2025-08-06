package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.mgr.entity.EnvPropertiesEntity;
import com.cdap.mock.constants.DataSourceNames;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.StringUtils;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface EnvPropertiesConfigMapper extends BaseMapperX<EnvPropertiesEntity> {
    default EnvPropertiesEntity selectEntityByEnv(String env) {
        if (!StringUtils.hasText(env)) {
            return null;
        }

        LambdaQueryWrapperX<EnvPropertiesEntity> queryWrapperX = build();
        queryWrapperX.eq(EnvPropertiesEntity::getEnv, env);

        return selectOne(queryWrapperX);
    }
}
