package com.cdap.mock.platform.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.cdap.mock.platform.dao.mgr.entity.EnvRabbitmqPropertiesEntity;
import com.cdap.mock.platform.dao.mgr.mapper.EnvRabbitmqPropertiesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author suyh
 * @since 2025-08-06
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class EnvRabbitmqPropertiesService {
    private final EnvRabbitmqPropertiesMapper envRabbitmqPropertiesMapper;

    public PageResult<EnvRabbitmqPropertiesEntity> listPage(PageParam pageParam) {
        return envRabbitmqPropertiesMapper.selectPage(pageParam, null);
    }

    public void create(EnvRabbitmqPropertiesEntity createEntity) {
        envRabbitmqPropertiesMapper.insert(createEntity);
    }

    public void updateById(EnvRabbitmqPropertiesEntity updateEntity) {
        envRabbitmqPropertiesMapper.updateById(updateEntity);
    }

    public void deleteById(Long id) {
        envRabbitmqPropertiesMapper.deleteById(id);
    }
}
