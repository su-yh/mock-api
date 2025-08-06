package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbWithdrawalEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.NonNull;

import java.util.List;

/**
 * @author suyh
 * @since 2024-04-25
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface TbWithdrawalMapper extends BaseMapperX<TbWithdrawalEntity> {
    default List<TbWithdrawalEntity> selectListByDates(@NonNull Integer dates) {
        LambdaQueryWrapperX<TbWithdrawalEntity> queryWrapperX = build();
        queryWrapperX.eq(TbWithdrawalEntity::getDay, dates);

        return selectList(queryWrapperX);
    }

    default List<TbWithdrawalEntity> selectEntityListByMaxDay(int maxDay) {
        LambdaQueryWrapperX<TbWithdrawalEntity> queryWrapperX = build();
        queryWrapperX.lt(TbWithdrawalEntity::getDay, maxDay);

        queryWrapperX.orderByAsc(TbWithdrawalEntity::getMtime);

        return selectList(queryWrapperX);
    }

    default List<TbWithdrawalEntity> selectEntityListByDay(int day) {
        LambdaQueryWrapperX<TbWithdrawalEntity> queryWrapperX = build();
        queryWrapperX.eq(TbWithdrawalEntity::getDay, day);

        queryWrapperX.orderByAsc(TbWithdrawalEntity::getMtime);

        return selectList(queryWrapperX);
    }
}
