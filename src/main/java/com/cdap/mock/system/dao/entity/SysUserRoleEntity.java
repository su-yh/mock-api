package com.cdap.mock.system.dao.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("sys_user_role")
@Data
public class SysUserRoleEntity {
    /** 用户ID */
    private Long userId;

    /** 角色ID */
    private Long roleId;
}
