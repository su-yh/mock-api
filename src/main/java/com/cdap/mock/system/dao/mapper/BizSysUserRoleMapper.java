package com.cdap.mock.system.dao.mapper;

import com.base.mp.mybatis.BaseMapperX;
import com.base.mp.mybatis.LambdaQueryWrapperX;
import com.cdap.mock.system.dao.entity.SysUserRoleEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;

import java.util.List;

@Mapper
public interface BizSysUserRoleMapper extends BaseMapperX<SysUserRoleEntity> {
    default List<SysUserRoleEntity> selectRoleList(@Nullable Long userId) {
        if (userId == null) {
            return null;
        }

        LambdaQueryWrapperX<SysUserRoleEntity> queryWrapperX = build();
        queryWrapperX.eq(SysUserRoleEntity::getUserId, userId);
        return selectList(queryWrapperX);
    }

    default void deleteByUserId(@Nullable Long userId) {
        if (userId == null) {
            return;
        }

        LambdaQueryWrapperX<SysUserRoleEntity> queryWrapperX = build();
        queryWrapperX.eq(SysUserRoleEntity::getUserId, userId);

        delete(queryWrapperX);
    }
}
