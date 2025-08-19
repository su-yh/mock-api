package com.cdap.mock.platform.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.mapper.EnvDatasourcePropertiesMapper;
import com.cdap.mock.constants.DataSourceEnums;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author suyh
 * @since 2025-08-06
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class EnvDatasourcePropertiesService {
    private final EnvDatasourcePropertiesMapper envDatasourcePropertiesMapper;

    public EnvDatasourcePropertiesEntity selectByEnvName(String env, DataSourceEnums name) {
        return envDatasourcePropertiesMapper.selectByEnvName(env, name);
    }

    public PageResult<EnvDatasourcePropertiesEntity> listPage(PageParam pageParam) {
        return envDatasourcePropertiesMapper.selectPage(pageParam, null);
    }

    public void create(EnvDatasourcePropertiesEntity createEntity) {
        envDatasourcePropertiesMapper.insert(createEntity);
    }

    public void updateById(EnvDatasourcePropertiesEntity updateEntity) {
        envDatasourcePropertiesMapper.updateById(updateEntity);
    }

    public void deleteById(Long id) {
        envDatasourcePropertiesMapper.deleteById(id);
    }

    public void switchFlywayEnable(Long id, boolean enabled) {
        if (id == null) {
            return;
        }

        EnvDatasourcePropertiesEntity updateEntity = new EnvDatasourcePropertiesEntity();
        updateEntity.setId(id).setFlywayEnabled(enabled);
        updateEntity.setUpdated(new Date());

        envDatasourcePropertiesMapper.updateById(updateEntity);
    }
}
