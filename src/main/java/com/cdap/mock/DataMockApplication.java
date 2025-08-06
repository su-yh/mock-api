package com.cdap.mock;

import com.cdap.mock.bytecodes.MybatisSqlDetailText;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.TimeZone;

/**
 * @author suyh
 * @since 2024-04-12
 */
@EnableTransactionManagement
@SpringBootApplication
public class DataMockApplication {
    public static void main(String[] args) {
        // -Duser.timezone=America/New_York
        // -Duser.timezone=Asia/Shanghai
        // -Duser.timezone=Asia/Kolkata
        // 直接定中国时区
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        MybatisSqlDetailText.rebuildSqlDetail();
        SpringApplication.run(DataMockApplication.class, args);
    }
}
