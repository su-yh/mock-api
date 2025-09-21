package com.cdap.mock.env.service;

import com.cdap.mock.constants.DataMockConstants;
import com.cdap.mock.constants.MockModeEnums;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserLoginEntity;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbUserLoginMapper;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.util.CdapDateUtils;
import com.cdap.mock.util.IdGenerator;
import com.cdap.mock.vo.ProjectPlusEntity;
import com.cdap.mock.vo.TickRuntime;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class TbUserLoginService extends AbstractHistoryRepeatService {
    // 缓存每天登录过的用户
    private Cache<String, Boolean> cacheUserLogin;
    // 缓存每天登录过的用户注册ID
    private Cache<String, Boolean> cacheUserRegistryId;

    private final TbUserLoginMapper tbUserLoginMapper;

    private final TbUserService tbUserService;
    private final ProjectService projectService;
    private final IdGenerator idGenerator;

    @NonNull
    public List<TbUserLoginEntity> mockTbUserLoginList(TickRuntime tickRuntime) {
        List<TbUserEntity> tbUserEntities = new ArrayList<>();
        List<TbUserLoginEntity> tickLoginList = new ArrayList<>();
        mockTickLoginList(tbUserEntities, tickLoginList, tickRuntime);

        if (!tickLoginList.isEmpty()) {
            tbUserLoginMapper.insertBatch(tickLoginList);
        }

        return tickLoginList;
    }

    private void mockTickLoginList(
            List<TbUserEntity> tbUserEntities, List<TbUserLoginEntity> tbUserLoginList, TickRuntime tickRuntime) {
        Long timestampMillis = tickRuntime.getTimestampMillis();

        Integer maxLoginCount = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get().getRandomMaxLogin();

        int expectedCount = random.nextInt(maxLoginCount);

        // 放大多倍：因为每个用户在一天时间里，只会记一次登录，如果随机到了同一个注册用户，那么该用户会被过滤掉。
        // 为了保证尽可能数量达到期望值，会多要一些注册用户。
        // 在实际的运行中，发现并不会有多少重复的数据，所以扩大25%即可。但数据较小时重复的几率就会比较大，所以最少取100 条。
        int tmpCount = expectedCount * 5 / 4;
        if (tmpCount < 100) {
            tmpCount = 100;
        }
        List<TbUserEntity> tmpEntities = tbUserService.obtainTbUserList(tmpCount);
        int repetitionRegistryId = 0;
        for (TbUserEntity tbUserEntity : tmpEntities) {
            String keyRegistryId = obtainCacheKeyForCacheUserRegistryId(tickRuntime.getDates(), tbUserEntity.getId());
            Boolean valRegistryId = cacheUserRegistryId.getIfPresent(keyRegistryId);
            // 是否可以用来登录的注册用户
            if (valRegistryId != null) {
                repetitionRegistryId++;
                continue;
            }

            // 未被缓存，则可以被使用。
            cacheUserRegistryId.put(keyRegistryId, Boolean.TRUE);
            tbUserEntities.add(tbUserEntity);
            if (tbUserEntities.size() >= expectedCount) {
                break;
            }
        }

        log.info("mock login, expected count: {}, real count: {}, repetitionRegistryId: {}, lost count: {}, obtain count: {}",
                expectedCount, tbUserEntities.size(), repetitionRegistryId, expectedCount - tbUserEntities.size(), tmpEntities.size());

        {
            // 1% 几率出现一条未注册的登录记录
            int rnd = random.nextInt(100);
            if (rnd == 0) {
                TbUserEntity tbUser = tbUserService.mockTbUser(tickRuntime);
                tbUserEntities.add(tbUser);
            }
        }

        if (tbUserEntities.isEmpty()) {
            log.debug("mock login entity is empty.");
            return;
        }

        {
            // 5% 几率出现一条注册用户换设备记录
            int rnd = random.nextInt(100);
            if (rnd < 5) {
                int indexTmp = random.nextInt(tbUserEntities.size());
                TbUserEntity tbUserEntity = tbUserEntities.get(indexTmp);
                String gaid = rnd == 0 ? DataMockConstants.DEFAULT_GAID : "gaid_" + idGenerator.nextUuid();
                tbUserEntity.setGaid(gaid);
            }
        }

        for (TbUserEntity tbUserEntity : tbUserEntities) {
            TbUserLoginEntity tbUserLoginEntity = new TbUserLoginEntity();
            tbUserLoginEntity.setUid(tbUserEntity.getUid()).setChannel(tbUserEntity.getChannel())
                    .setGaid(tbUserEntity.getGaid()).setOriginChannel(tbUserEntity.getOriginChannel())
                    .setPn(tbUserEntity.getPn());

            ProjectPlusEntity projectPlusEntity = projectService.obtainEntityByPn(tbUserLoginEntity.getPn());
            ZoneId zoneId = projectPlusEntity.getZoneOffset();
            Integer dates = CdapDateUtils.timestampToDate(timestampMillis, zoneId);
            tbUserLoginEntity.setSrc(2).setDay(dates).setCtime(timestampMillis / 1000);

            // 表中的唯一索引：day pn channel, gaid, uid
            String keyLoginUser = obtainCacheKeyForCacheUserLogin(tbUserLoginEntity);
            Boolean valLoginUser = cacheUserLogin.getIfPresent(keyLoginUser);
            if (valLoginUser != null) {
                continue;
            }

            cacheUserLogin.put(keyLoginUser, Boolean.TRUE);

            String pn = tbUserLoginEntity.getPn();
            if (StringUtils.hasText(pn)) {
                if (pn.equals(DataMockConstants.PROJECT_HY.getPn())) {
                    int rndPn = random.nextInt(10000);
                    if (rndPn == 0) {
                        // 一定几率出现 pn 的值为null 的情况
                        // 搞一些pn 值为null 的情况，但是只有当pn 为hy 时才可以。
                        // 因为当pn 的值为null 时，会被处理成hy
                        tbUserLoginEntity.setPn("");
                    }
                }
            }
            tbUserLoginList.add(tbUserLoginEntity);
        }
    }

    public synchronized void init(@Nullable Long timeBeginByDateRange) {
        cacheUserLogin = Caffeine.newBuilder()
                .expireAfterWrite(1, TimeUnit.DAYS).initialCapacity(4096).build();
        cacheUserRegistryId = Caffeine.newBuilder()
                .expireAfterWrite(1, TimeUnit.DAYS).initialCapacity(4096).build();

        long startTimestampMillis = System.currentTimeMillis();
        MockModeEnums mode = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get().getMode();
        if (mode == MockModeEnums.DATE_RAGE) {
            Assert.notNull(timeBeginByDateRange, "current mode is " + mode + ", but timeBegin is null");

            startTimestampMillis = timeBeginByDateRange;
        }

        initUserLoginCache(startTimestampMillis);
    }


    // 对于时间范围的时候，不需要管登录用户的缓存，只有按实时时间处理的时候才需要处理，防止一天多次启动，在前一次生成的登录用户在后面再次出现。
    // 导致表的唯一索引重复问题。
    private synchronized void initUserLoginCache(long startTimestampMillis) {
        List<ProjectPlusEntity> projectEntities = projectService.projectEntityList();
        for (ProjectPlusEntity projectPlusEntity : projectEntities) {
            ZoneId zoneId = projectPlusEntity.getZoneOffset();
            Integer dates = CdapDateUtils.timestampToDate(startTimestampMillis, zoneId);
            List<TbUserLoginEntity> tbUserLoginEntities = tbUserLoginMapper.selectListByDatesPn(dates, projectPlusEntity.getPn());
            if (tbUserLoginEntities != null) {
                for (TbUserLoginEntity tbUserLoginEntity : tbUserLoginEntities) {
                    String key = obtainCacheKeyForCacheUserLogin(tbUserLoginEntity);
                    cacheUserLogin.put(key, Boolean.TRUE);
                }
            }
        }
    }

    @NonNull
    private String obtainCacheKeyForCacheUserLogin(TbUserLoginEntity tbUserLoginEntity) {
        // 表中的唯一索引：day pn channel, gaid, uid
        return String.format("%d&%s&%s&%s&%s",
                tbUserLoginEntity.getDay(), tbUserLoginEntity.getPn(), tbUserLoginEntity.getChannel(),
                tbUserLoginEntity.getGaid(), tbUserLoginEntity.getUid());
    }

    @NonNull
    private String obtainCacheKeyForCacheUserRegistryId(Integer dates, long tbUserEntityId) {
        // 表中的唯一索引：day id
        return String.format("%d&%d", dates, tbUserEntityId);
    }
}
