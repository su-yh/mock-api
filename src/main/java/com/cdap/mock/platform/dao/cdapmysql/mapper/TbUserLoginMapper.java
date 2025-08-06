package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserLoginEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;

import java.util.List;

@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface TbUserLoginMapper extends BaseMapperX<TbUserLoginEntity> {
    default List<TbUserLoginEntity> selectListByDatesPn(
            @NonNull Integer dates, @Nullable String pn) {
        LambdaQueryWrapperX<TbUserLoginEntity> queryWrapperX = build();
        queryWrapperX.eq(TbUserLoginEntity::getDay, dates)
                .eqIfPresent(TbUserLoginEntity::getPn, pn);

        return selectList(queryWrapperX);
    }

    default List<TbUserLoginEntity> selectEntityListByMaxDay(int maxDay) {
        LambdaQueryWrapperX<TbUserLoginEntity> queryWrapperX = build();
        queryWrapperX.lt(TbUserLoginEntity::getDay, maxDay);

        queryWrapperX.orderByAsc(TbUserLoginEntity::getCtime);

        return selectList(queryWrapperX);
    }

    default List<TbUserLoginEntity> selectEntityListByDay(int day) {
        LambdaQueryWrapperX<TbUserLoginEntity> queryWrapperX = build();
        queryWrapperX.eq(TbUserLoginEntity::getDay, day);

        queryWrapperX.orderByAsc(TbUserLoginEntity::getCtime);

        return selectList(queryWrapperX);
    }
}
