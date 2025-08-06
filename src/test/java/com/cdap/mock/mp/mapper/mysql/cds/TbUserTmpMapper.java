package com.cdap.mock.mp.mapper.mysql.cds;

import com.base.mp.mybatis.BaseMapperX;
import com.cdap.mock.biz.dao.cdapmysql.entity.TbUserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbUserTmpMapper extends BaseMapperX<TbUserEntity> {
}
