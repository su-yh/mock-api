package com.cdap.mock.mp.processor;

import com.baomidou.dynamic.datasource.processor.DsProcessor;
import com.base.web.constants.enums.BaseWebErrorCodeEnums;
import com.base.web.exception.ExceptionUtil;
import lombok.extern.slf4j.Slf4j;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StringUtils;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Slf4j
public class EnvDsProcessor extends DsProcessor {
    public static final String DYNAMIC_PREFIX = "#ThreadLocal.";
    public static final String SEPARATOR = ":";

    /**
     * 每个线程都需要自行进行初始化一个字符串的env。
     * 另外数据源的名称需要有固定格式格式：{@link ENV} + {@link #SEPARATOR} + dsName
     * 而在使用注解的时候则为： @DS({@link #DYNAMIC_PREFIX} + dsName)
     * 这两个后缀
     */
    public static final ThreadLocal<String> ENV = new ThreadLocal<>();

    @Override
    public boolean matches(String key) {
        return key.startsWith(DYNAMIC_PREFIX);
    }

    @Override
    public String doDetermineDatasource(MethodInvocation invocation, String key) {
        String dsName = key.substring(DYNAMIC_PREFIX.length());
        if (!StringUtils.hasText(dsName)) {
            log.error("configuration error, key: @DS({})", key);
            throw ExceptionUtil.business(BaseWebErrorCodeEnums.SERVICE_ERROR);
        }

        String env = ENV.get();
        if (!StringUtils.hasText(env)) {
            log.error("cur thread uninitialized env.");
            throw ExceptionUtil.business(BaseWebErrorCodeEnums.SERVICE_ERROR);
        }

        return ENV.get() + SEPARATOR + dsName;
    }
}
