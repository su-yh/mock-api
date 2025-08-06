package com.cdap.mock.system.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.cdap.mock.system.dao.entity.SysRoleEntity;
import com.cdap.mock.system.dao.mapper.BizSysRoleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class SysRoleService {
    private final BizSysRoleMapper bizSysRoleMapper;


    public List<SysRoleEntity> selectRoleList(@Nullable Collection<Long> roleIds) {
        return bizSysRoleMapper.selectRoleList(roleIds);
    }


    public PageResult<SysRoleEntity> listPage(PageParam pageParam, String roleNameLike) {
        return bizSysRoleMapper.listPage(pageParam, roleNameLike);
    }

    public List<SysRoleEntity> listAll() {
        return bizSysRoleMapper.selectList();
    }

    public Long create(SysRoleEntity entity) {
        bizSysRoleMapper.insert(entity);

        return entity.getRoleId();
    }

    public void update(SysRoleEntity entity) {
        bizSysRoleMapper.updateById(entity);
    }

    public void delete(@Nullable Long roleId) {
        if (roleId == null) {
            return;
        }

        bizSysRoleMapper.deleteById(roleId);
    }
}
