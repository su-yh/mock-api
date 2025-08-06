package com.cdap.mock.platform.task.common;

import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;

/**
 * @author suyh
 * @since 2025-08-05
 */
public class EnvLocalThread {
    public static final ThreadLocal<MockPropertiesEntity> ENV_PROPERTIES_ENTITY_THREAD_LOCAL = new ThreadLocal<>();

}
