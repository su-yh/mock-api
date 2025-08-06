package com.cdap.mock.biz.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.biz.dao.cdapmysql.entity.TbRechargeEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface TbRechargeMapper extends BaseMapperX<TbRechargeEntity> {
    default List<TbRechargeEntity> selectListByDates(Integer dates) {
        LambdaQueryWrapperX<TbRechargeEntity> queryWrapperX = build();
        queryWrapperX.eq(TbRechargeEntity::getDay, dates);

        return selectList(queryWrapperX);
    }


    default List<TbRechargeEntity> selectEntityListByMaxDay(int maxDay) {
        LambdaQueryWrapperX<TbRechargeEntity> queryWrapperX = build();
        queryWrapperX.lt(TbRechargeEntity::getDay, maxDay);

        queryWrapperX.orderByAsc(TbRechargeEntity::getMtime);

        return selectList(queryWrapperX);
    }

    default List<TbRechargeEntity> selectEntityListByDay(int day) {
        LambdaQueryWrapperX<TbRechargeEntity> queryWrapperX = build();
        queryWrapperX.eq(TbRechargeEntity::getDay, day);

        queryWrapperX.orderByAsc(TbRechargeEntity::getMtime);

        return selectList(queryWrapperX);
    }
}
