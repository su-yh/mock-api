package com.cdap.mock.platform.dao.mgr.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.platform.dao.mgr.entity.EnvRabbitmqPropertiesEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2025-08-06
 */
@Mapper
@DS(DataSourceNames.MASTER)
public interface EnvRabbitmqPropertiesMapper extends BaseMapperX<EnvRabbitmqPropertiesEntity> {
}
