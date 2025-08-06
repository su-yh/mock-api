package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import com.cdap.mock.vo.ProjectPlusEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author suyh
 * @since 2024-05-28
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface ProjectMapper extends BaseMapperX<ProjectPlusEntity> {
}
