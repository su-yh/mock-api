package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.Rate;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface RateMapper extends BaseMapperX<Rate> {
    // 取最新的汇率
    default Rate selectEntityLastByCurrency(String currency, @Nullable Integer dates) {
        if (!StringUtils.hasText(currency)) {
            return null;
        }

        LambdaQueryWrapperX<Rate> queryWrapperX = build();
        queryWrapperX.eq(Rate::getBase, "USD")
                .eq(Rate::getSymbols, currency);
        queryWrapperX.leIfPresent(Rate::getDates, dates);

        queryWrapperX.isNotNull(Rate::getDates);

        queryWrapperX.orderByDesc(Rate::getDates);

        queryWrapperX.last("limit 1");
        return selectOne(queryWrapperX);
    }
}
