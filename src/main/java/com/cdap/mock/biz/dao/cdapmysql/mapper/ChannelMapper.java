package com.cdap.mock.biz.dao.cdapmysql.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.biz.dao.cdapmysql.entity.ChannelEntity;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author suyh
 * @since 2024-05-25
 */
@Mapper
@DS(EnvDsProcessor.DYNAMIC_PREFIX + DataSourceNames.FLINK_CDS)
public interface ChannelMapper extends BaseMapperX<ChannelEntity> {
    // suyh - 没有唯一索引一个project 只有一个channel
    @Deprecated
    default ChannelEntity selectEntityByProjectId(Long projectId) {
        LambdaQueryWrapperX<ChannelEntity> queryWrapperX = build();
        queryWrapperX.eq(ChannelEntity::getProjectId, projectId).last("LIMIT 1");

        return selectOne(queryWrapperX);
    }

    default List<ChannelEntity> selectListByProjectId(Long projectId) {
        LambdaQueryWrapperX<ChannelEntity> queryWrapperX = build();
        queryWrapperX.eq(ChannelEntity::getProjectId, projectId);

        return selectList(queryWrapperX);
    }
}
