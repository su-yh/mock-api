package com.cdap.mock.mp;

import com.baomidou.dynamic.datasource.processor.DsHeaderProcessor;
import com.baomidou.dynamic.datasource.processor.DsProcessor;
import com.baomidou.dynamic.datasource.processor.DsSessionProcessor;
import com.baomidou.dynamic.datasource.processor.DsSpelExpressionProcessor;
import com.baomidou.dynamic.datasource.processor.jakarta.DsJakartaHeaderProcessor;
import com.baomidou.dynamic.datasource.processor.jakarta.DsJakartaSessionProcessor;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DynamicDataSourceAutoConfiguration;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.boot.SpringBootVersion;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.expression.BeanFactoryResolver;

/**
 * @author suyh
 * @since 2025-08-05
 */
@Configuration
public class MybatisPlusCustomConfiguration {

    /**
     * 拷贝自：{@link DynamicDataSourceAutoConfiguration#dsProcessor(BeanFactory)} 需要兼容原来的东西，因为mp 没有做这方面的兼容处理。
     */
    @Bean
    public DsProcessor dsProcessor(BeanFactory beanFactory) {
        DsProcessor envDsProcessor = new EnvDsProcessor();
        String version = SpringBootVersion.getVersion();
        DsProcessor headerProcessor;
        DsProcessor sessionProcessor;
        if (version.startsWith("3")) {
            headerProcessor = new DsJakartaHeaderProcessor();
            sessionProcessor = new DsJakartaSessionProcessor();
        } else {
            headerProcessor = new DsHeaderProcessor();
            sessionProcessor = new DsSessionProcessor();
        }
        envDsProcessor.setNextProcessor(headerProcessor);
        DsSpelExpressionProcessor spelExpressionProcessor = new DsSpelExpressionProcessor();
        spelExpressionProcessor.setBeanResolver(new BeanFactoryResolver(beanFactory));
        headerProcessor.setNextProcessor(sessionProcessor);
        sessionProcessor.setNextProcessor(spelExpressionProcessor);
        return envDsProcessor;
    }
}
