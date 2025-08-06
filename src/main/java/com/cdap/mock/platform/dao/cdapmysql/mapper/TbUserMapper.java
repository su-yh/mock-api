package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface TbUserMapper extends BaseMapperX<TbUserEntity> {
    default TbUserEntity selectEntityMaxTbUserId(Long endTimestamp) {
        LambdaQueryWrapperX<TbUserEntity> queryWrapperX = build();

        if (endTimestamp != null) {
            long endCtime = endTimestamp / 1000L;
            queryWrapperX.lt(TbUserEntity::getCtime, endCtime);
        }
        queryWrapperX.orderByDesc(TbUserEntity::getCtime);

        queryWrapperX.last("limit 1");
        return selectOne(queryWrapperX);
    }

    default List<TbUserEntity> selectEntityListByMaxDay(int maxDay) {
        LambdaQueryWrapperX<TbUserEntity> queryWrapperX = build();
        queryWrapperX.lt(TbUserEntity::getDay, maxDay);

        queryWrapperX.orderByAsc(TbUserEntity::getCtime);

        return selectList(queryWrapperX);
    }

    default List<TbUserEntity> selectEntityListByDay(int day) {
        LambdaQueryWrapperX<TbUserEntity> queryWrapperX = build();
        queryWrapperX.eq(TbUserEntity::getDay, day);

        queryWrapperX.orderByAsc(TbUserEntity::getCtime);

        return selectList(queryWrapperX);
    }
}
