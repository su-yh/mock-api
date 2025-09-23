package com.cdap.mock.platform.task.common;

import com.cdap.mock.platform.dao.mgr.entity.MockPropertiesEntity;

/**
 * @author suyh
 * @since 2025-08-05
 */
public class EnvLocalThread {
    // 每个环境的配置属性，比如：mode、子渠道数量、每次最大注册数量、每次最大登录数量等
    public static final ThreadLocal<MockPropertiesEntity> ENV_PROPERTIES_ENTITY_THREAD_LOCAL = new ThreadLocal<>();

}
