package com.cdap.mock.system.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.cdap.mock.system.dao.entity.SysUserEntity;
import com.cdap.mock.system.dto.rsp.UserRspDto;
import com.web.sys.service.IUserService;

public interface IBizUserService extends IUserService {
    PageResult<UserRspDto> listPage(PageParam pageParam, String nameLike);

    void updateUser(SysUserEntity entity);

    void deleteUser(Long id);
}
