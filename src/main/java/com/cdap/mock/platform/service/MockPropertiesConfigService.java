package com.cdap.mock.platform.service;

import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;
import com.cdap.mock.platform.dao.mgr.mapper.MockPropertiesConfigMapper;
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
public class MockPropertiesConfigService {
    private final MockPropertiesConfigMapper mockPropertiesConfigMapper;

    public MockPropertiesEntity selectEntityByEnv(String env) {
        return mockPropertiesConfigMapper.selectEntityByEnv(env);
    }
}
