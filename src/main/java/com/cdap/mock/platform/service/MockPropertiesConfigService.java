package com.cdap.mock.platform.service;

import com.base.mp.mybatis.PageParam;
import com.base.mp.mybatis.PageResult;
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

    public PageResult<MockPropertiesEntity> listPage(PageParam pageParam) {
        return mockPropertiesConfigMapper.selectPage(pageParam, null);
    }

    public void create(MockPropertiesEntity createEntity) {
        mockPropertiesConfigMapper.insert(createEntity);
    }

    public void updateById(MockPropertiesEntity updateEntity) {
        mockPropertiesConfigMapper.updateById(updateEntity);
    }

    public void deleteById(Long id) {
        mockPropertiesConfigMapper.deleteById(id);
    }
}
