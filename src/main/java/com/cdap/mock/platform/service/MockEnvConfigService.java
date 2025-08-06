package com.cdap.mock.platform.service;

import com.cdap.mock.platform.dao.mgr.entity.MockEnvConfigEntity;
import com.cdap.mock.platform.dao.mgr.mapper.MockEnvConfigMapper;
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
public class MockEnvConfigService {
    private final MockEnvConfigMapper mockEnvConfigMapper;

    public MockEnvConfigEntity selectEntityByEnv(String env) {
        return mockEnvConfigMapper.selectEntityByEnv(env);
    }
}
