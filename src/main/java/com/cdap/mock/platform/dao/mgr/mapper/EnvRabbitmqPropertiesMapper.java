package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.platform.dao.mgr.entity.EnvRabbitmqPropertiesEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.StringUtils;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface EnvRabbitmqPropertiesMapper extends BaseMapperX<EnvRabbitmqPropertiesEntity> {
    default EnvRabbitmqPropertiesEntity queryEntityByEnv(String env) {
        if (!StringUtils.hasText(env)) {
            return null;
        }

        LambdaQueryWrapperX<EnvRabbitmqPropertiesEntity> queryWrapperX = build();
        queryWrapperX.eq(EnvRabbitmqPropertiesEntity::getEnv, env);

        return selectOne(queryWrapperX);
    }
}
