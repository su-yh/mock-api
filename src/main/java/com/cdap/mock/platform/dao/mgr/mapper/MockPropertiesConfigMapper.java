package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.constants.DataSourceNames;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.StringUtils;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface MockPropertiesConfigMapper extends BaseMapperX<MockPropertiesEntity> {
    default MockPropertiesEntity selectEntityByEnv(String env) {
        if (!StringUtils.hasText(env)) {
            return null;
        }

        LambdaQueryWrapperX<MockPropertiesEntity> queryWrapperX = build();
        queryWrapperX.eq(MockPropertiesEntity::getEnv, env);

        return selectOne(queryWrapperX);
    }
}
