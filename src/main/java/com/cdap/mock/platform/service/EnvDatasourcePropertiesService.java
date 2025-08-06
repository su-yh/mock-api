package com.cdap.mock.platform.service;

import com.cdap.mock.platform.dao.mgr.entity.EnvDatasourcePropertiesEntity;
import com.cdap.mock.platform.dao.mgr.mapper.EnvDatasourcePropertiesMapper;
import com.cdap.mock.constants.DataSourceEnums;
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
public class EnvDatasourcePropertiesService {
    private final EnvDatasourcePropertiesMapper envDatasourcePropertiesMapper;

    public EnvDatasourcePropertiesEntity selectByEnvName(String env, DataSourceEnums name) {
        return envDatasourcePropertiesMapper.selectByEnvName(env, name);
    }
}
