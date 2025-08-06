package com.cdap.mock.biz.task.common;

import com.cdap.mock.biz.dao.mgr.entity.EnvPropertiesEntity;

/**
 * @author suyh
 * @since 2025-08-05
 */
public class EnvLocalThread {
    public static final ThreadLocal<EnvPropertiesEntity> ENV_PROPERTIES_ENTITY_THREAD_LOCAL = new ThreadLocal<>();

}
