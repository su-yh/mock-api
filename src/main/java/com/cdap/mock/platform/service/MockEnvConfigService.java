package com.cdap.mock.platform.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
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

    public PageResult<MockEnvConfigEntity> listPage(PageParam pageParam) {
        return mockEnvConfigMapper.selectPage(pageParam, null);
    }

    public void create(MockEnvConfigEntity createEntity) {
        mockEnvConfigMapper.insert(createEntity);
    }

    public void updateById(MockEnvConfigEntity updateEntity) {
        mockEnvConfigMapper.updateById(updateEntity);
    }

    public void deleteById(Long id) {
        mockEnvConfigMapper.deleteById(id);
    }

    public void statusSwitch(Long id, Boolean enabled) {
        MockEnvConfigEntity updateEntity = new MockEnvConfigEntity();

        updateEntity.setId(id);
        updateEntity.setEnabled(enabled);

        mockEnvConfigMapper.updateById(updateEntity);
    }
}
