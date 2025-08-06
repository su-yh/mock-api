package com.cdap.mock.system.dto.rsp;

import com.cdap.mock.system.dao.entity.SysRoleEntity;
import com.cdap.mock.system.dao.entity.SysUserEntity;
import lombok.Data;

import java.util.List;

@Data
public class UserRspDto {
    private SysUserEntity sysUserEntity;
    private List<SysRoleEntity> roleEntities;
}
