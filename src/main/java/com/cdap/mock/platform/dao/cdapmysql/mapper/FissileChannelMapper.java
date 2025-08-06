package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.FissileChannelEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author suyh
 * @since 2024-11-15
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface FissileChannelMapper extends BaseMapperX<FissileChannelEntity> {
    default List<FissileChannelEntity> selectByPn(String pn) {
        if (pn == null) {
            return null;
        }

        LambdaQueryWrapperX<FissileChannelEntity> queryWrapperX = build();
        queryWrapperX.eq(FissileChannelEntity::getPn, pn);

        return selectList(queryWrapperX);
    }
}
