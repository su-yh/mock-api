package com.cdap.mock.platform.service;

import com.cdap.mock.platform.dao.mgr.entity.EnvPropertiesEntity;
import com.cdap.mock.platform.dao.mgr.mapper.EnvPropertiesConfigMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author suyh
 * @since 2025-08-05
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class EnvPropertiesConfigService {
    private final EnvPropertiesConfigMapper envPropertiesConfigMapper;

    public EnvPropertiesEntity selectEntityByEnv(String env) {
        return envPropertiesConfigMapper.selectEntityByEnv(env);
    }
}
