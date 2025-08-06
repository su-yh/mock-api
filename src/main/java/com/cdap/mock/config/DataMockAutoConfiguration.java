package com.cdap.mock.config;

import com.base.web.response.wrapper.WrapperResponseScanPackages;
import com.cdap.mock.config.properties.DataRabbitMqProperties;
import com.cdap.mock.mvc.DataMockWrapperResponse;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author suyh
 * @since 2024-04-12
 */
@EnableConfigurationProperties({DataRabbitMqProperties.class})
@Configuration
@MapperScan(basePackages = {
        "com.cdap.mock.**.mapper",
})
public class DataMockAutoConfiguration {
    @Bean
    public WrapperResponseScanPackages wrapperResponse() {
        return new DataMockWrapperResponse();
    }
}
