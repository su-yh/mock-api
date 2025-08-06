package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.mgr.entity.MockEnvConfigEntity;
import com.cdap.mock.constants.DataSourceNames;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.StringUtils;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface MockEnvConfigMapper extends BaseMapperX<MockEnvConfigEntity> {
    default MockEnvConfigEntity selectEntityByEnv(String env) {
        if (!StringUtils.hasText(env)) {
            return null;
        }

        LambdaQueryWrapperX<MockEnvConfigEntity> queryWrapperX = build();
        queryWrapperX.eq(MockEnvConfigEntity::getEnv, env);

        return selectOne(queryWrapperX);
    }
}
