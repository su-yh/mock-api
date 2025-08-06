package com.cdap.mock.platform.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.platform.dao.cdapmysql.entity.plus.SubChannelPlusEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author suyh
 * @since 2024-04-18
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface SubChannelMapper extends BaseMapperX<SubChannelPlusEntity> {
    default List<SubChannelPlusEntity> selectByChannelId(Integer channelId) {
        if (channelId == null) {
            return null;
        }

        LambdaQueryWrapperX<SubChannelPlusEntity> queryWrapperX = build();
        queryWrapperX.eq(SubChannelPlusEntity::getChannelId, channelId);
        return selectList(queryWrapperX);
    }

    default List<SubChannelPlusEntity> selectByChannelIds(List<Integer> channelIds) {
        if (channelIds == null || channelIds.isEmpty()) {
            return null;
        }

        LambdaQueryWrapperX<SubChannelPlusEntity> queryWrapperX = build();
        queryWrapperX.in(SubChannelPlusEntity::getChannelId, channelIds);
        return selectList(queryWrapperX);
    }
}
