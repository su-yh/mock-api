package com.cdap.mock.datasource;

import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.base.dds.datasource.hikari.HikariDataSourcePlus;
import com.base.dds.datasource.properties.DynamicDataSourceProviderProperties;
import com.base.web.util.JsonUtils;
import com.cdap.mock.DataMockApplication;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbUserMapper;
import com.cdap.mock.constants.DataSourceNames;
import com.cdap.mock.mp.mapper.mysql.cds.TbUserTmpMapper;
import com.cdap.mock.mp.processor.EnvDsProcessor;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author suyh
 * @since 2025-07-28
 */
@ActiveProfiles("suyh")
@ExtendWith(SpringExtension.class)
@SpringBootTest(
        classes = DataMockApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.NONE)
@Slf4j
public class DynamicDataSourceTest {
    private static HikariDataSourcePlus dataSourcePlus;

    @Resource
    private DynamicRoutingDataSource dynamicRoutingDataSource;
    @Resource
    private TbUserTmpMapper tbUserTmpMapper;
    @Resource
    private TbUserMapper tbUserTMapper;

    @BeforeAll
    public static void init() throws Exception {
        dataSourcePlus = new HikariDataSourcePlus();
        dataSourcePlus.setJdbcUrl("jdbc:mysql://192.168.8.143:3306/suyh_cdap_tmp01?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&rewriteBatchedStatements=true");
        dataSourcePlus.setUsername("suyh_cdap_tmp01");
        dataSourcePlus.setPassword("suyh_cdap_tmp01");

        FlywayProperties flywayProperties = dataSourcePlus.getFlyway();
        List<String> locations = new ArrayList<>();
        locations.add("sqls/mysql/cdap/cds/history");
        locations.add("sqls/mysql/cdap/cds/increment");
        locations.add("sqls/mysql/cdap/cds/increment_plus");
        locations.add("sqls/mysql/cdap/cds/data_mock");
        flywayProperties.setLocations(locations);
        flywayProperties.setOutOfOrder(true);

        DynamicDataSourceProviderProperties.doFlyway(dataSourcePlus);

    }

    @Test
    public void run() throws Exception {
        // 手动控制动态数据源时，优先级是最低的，所以需要将mapper 类上面的 @DS("xxx") 注解清除掉才行。
        try {
            // 切换到指定数据源
            String dbKey = DataSourceNames.FLINK_CDS;
            DynamicDataSourceContextHolder.push(dbKey);
            // 执行查询
            TbUserEntity tbUserEntity = tbUserTmpMapper.selectById(1L);
            System.out.println(dbKey + ", " + "tbUserEntity: " + JsonUtils.serializable(tbUserEntity));
        } finally {
            // 清除上下文
            DynamicDataSourceContextHolder.poll();
        }

        try {
            dynamicRoutingDataSource.addDataSource("tmp", dataSourcePlus);
            // 切换到指定数据源
            String dbKey = "tmp";
            DynamicDataSourceContextHolder.push(dbKey);
            // 执行查询
            TbUserEntity tbUserEntity = tbUserTmpMapper.selectById(1L);
            System.out.println(dbKey + ", " + "tbUserEntity: " + JsonUtils.serializable(tbUserEntity));
        } finally {
            // 清除上下文
            DynamicDataSourceContextHolder.poll();
        }

        // 移除数据源，重新添加数据源
        try {
            dynamicRoutingDataSource.removeDataSource("tmp");
            DataSource dataSourceFlinkCds = dynamicRoutingDataSource.getDataSource(DataSourceNames.FLINK_CDS);
            dynamicRoutingDataSource.addDataSource("tmp", dataSourceFlinkCds);

            // 切换到指定数据源
            String dbKey = "tmp";
            DynamicDataSourceContextHolder.push(dbKey);
            // 执行查询
            TbUserEntity tbUserEntity = tbUserTmpMapper.selectById(1L);
            System.out.println(dbKey + ", " + "tbUserEntity: " + JsonUtils.serializable(tbUserEntity));
        } finally {
            // 清除上下文
            DynamicDataSourceContextHolder.poll();
        }

        dynamicRoutingDataSource.removeDataSource("tmp");
    }

    @Test
    public void testEnvDsProcessor() {
        EnvDsProcessor.ENV.set("test");

        String dsName = "test" + EnvDsProcessor.SEPARATOR + DataSourceNames.FLINK_CDS;
        dynamicRoutingDataSource.addDataSource(dsName, dataSourcePlus);

        TbUserEntity tbUserEntity = tbUserTMapper.selectById(1L);
        log.info("tbUserEntity: {}", JsonUtils.serializable(tbUserEntity));

        dynamicRoutingDataSource.removeDataSource(dsName);
    }
}
