package com.cdap.mock.env.service;

import com.cdap.mock.platform.dao.cdapmysql.entity.ProjectEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.SubChannelEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.platform.dao.cdapmysql.mapper.TbUserMapper;
import com.cdap.mock.platform.task.common.EnvLocalThread;
import com.cdap.mock.component.UuidComponent;
import com.cdap.mock.constants.DataMockConstants;
import com.cdap.mock.util.CdapDateUtils;
import com.cdap.mock.vo.TickRuntime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class TbUserService {
    private final Random random = new Random();

    private final UuidComponent uuidComponent;

    private final TbUserMapper tbUserMapper;

    @NonNull
    public List<TbUserEntity> mockTbUserList(@NonNull TickRuntime tickRuntime) {
        List<TbUserEntity> tbUserList = new ArrayList<>();

        int randTbUserCnt = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get().getRandomMaxRegistry();
        int userCnt = random.nextInt(randTbUserCnt);
        for (int i = 0; i < userCnt; i++) {
            TbUserEntity tbUser = mockTbUser(tickRuntime);
            tbUserList.add(tbUser);
        }

        if (!tbUserList.isEmpty()) {
            int rnd = random.nextInt(100);
            if (rnd == 0) { // 1% 的几率出现一个异常用户数据
                int rndIdx = random.nextInt(tbUserList.size());
                TbUserEntity tbUserEntity = tbUserList.get(rndIdx);
                resetAbnormal(tbUserEntity);
            }
        }

        // 重复用户
        if (random.nextInt(10) < 3) {
            TbUserEntity tbUser = mockRepetitionTbUser(tickRuntime);
            if (tbUser != null) {
                tbUserList.add(tbUser);
            }
        }

        if (!tbUserList.isEmpty()) {
            tbUserMapper.insertBatch(tbUserList);
        } else {
            log.debug("mock registry entity is empty.");
        }

        return tbUserList;
    }

    private TbUserEntity mockRepetitionTbUser(TickRuntime tickRuntime) {
        ZoneId zoneId = tickRuntime.getTickAttribute().getProjectPlusEntity().getZoneOffset();
        long midnightTimestamp = CdapDateUtils.convertMidnightTimestamp(tickRuntime.getDates(), zoneId);
        TbUserEntity maxIdEntity = tbUserMapper.selectEntityMaxTbUserId(midnightTimestamp);
        if (maxIdEntity == null || maxIdEntity.getId() == null) {
            log.debug("no max id for TbUserEntity.");
            return null;
        }

        int rndId = random.nextInt(maxIdEntity.getId().intValue());

        TbUserEntity historyEntity = tbUserMapper.selectById(rndId);
        if (historyEntity == null) {
            return null;
        }

        TbUserEntity tbUser = mockTbUser(tickRuntime);
        tbUser.setGaid(historyEntity.getGaid());
        return tbUser;
    }

    private void resetAbnormal(TbUserEntity tbUser) {
        int rdsEx = random.nextInt(5);
        switch (rdsEx) {
            case 0:
                tbUser.setGaid("");
                break;
            case 1:
                tbUser.setGaid("0000-0000");
                break;
            case 2:
                tbUser.setDay(null);
                break;
            case 3:
                tbUser.setChannel("");
                break;
            case 4:
                tbUser.setGaid(DataMockConstants.DEFAULT_GAID);
                break;
            default:
                break;
        }
    }

    public TbUserEntity mockTbUser(@NonNull TickRuntime tickRuntime) {
        ProjectEntity projectEntity = tickRuntime.getTickAttribute().getProjectPlusEntity();
        List<SubChannelEntity> subChannelEntities = tickRuntime.getTickAttribute().getSubChannelEntities();

        int chIdx = random.nextInt(subChannelEntities.size());
        SubChannelEntity subChannel = subChannelEntities.get(chIdx);
        String channel = subChannel.getChannelCode();

        // 1.=====注册用户 tab_user  `uid`, `pn`  unique
        String gaid = "gaid_" + uuidComponent.uuidStr();
        String uid = "uid_" + uuidComponent.uuidStr();
        TbUserEntity tbUser = new TbUserEntity();
        tbUser.setId(null);
        tbUser.setUid(uid);
        tbUser.setChannel(channel);
        tbUser.setCtime(tickRuntime.getTimestampMillis() / 1000);
        tbUser.setGaid(gaid);
        tbUser.setOriginChannel(channel);
        tbUser.setVungoUserId(null);
        tbUser.setDay(tickRuntime.getDates());
        tbUser.setCts(tickRuntime.getTimestampMillis() / 1000);

        // 一定几率出现 pn 的值为null 的情况
        // 搞一些pn 值为null 的情况，但是只有当pn 为hy 时才可以。
        // 因为当pn 的值为null 时，会被处理成hy
        String pn = projectEntity.getPn();
        if (pn.equals(DataMockConstants.PROJECT_HY.getPn())) {
            int rndPn = random.nextInt(100000);
            if (rndPn == 0) {
                pn = null;
            }
        }
        tbUser.setPn(pn);

        return tbUser;
    }

    public List<TbUserEntity> obtainTbUserList(Integer expectedCount) {
        TbUserEntity maxIdEntity = tbUserMapper.selectEntityMaxTbUserId(null);
        if (maxIdEntity == null || maxIdEntity.getId() == null) {
            log.warn("no max id for TbUserEntity.");
            return new ArrayList<>();
        }

        long maxId = maxIdEntity.getId();
        Set<Long> ids = new HashSet<>();
        // 将随机数上限放大，是因为随机的结果可能相同，多次相同那么实际上得到的ID 列表将会少于期望的值。
        for (int i = 0; i < expectedCount * 100; i++) {
            int id = random.nextInt(Math.toIntExact(maxId)) + 1;
            if (ids.add((long) id)) {
                if (ids.size() >= expectedCount) {
                    break;
                }
            }
        }

        if (ids.isEmpty()) {
            return new ArrayList<>();
        }

        // 随机出来的注册用户，这些用户将会充值
        List<TbUserEntity> tbUserEntities = tbUserMapper.selectBatchIds(ids);
        if (tbUserEntities == null) {
            return new ArrayList<>();
        }

        return tbUserEntities;
    }

    @Nullable
    public Long obtainMaxCtime() {
        TbUserEntity tbUserEntity = tbUserMapper.selectEntityMaxTbUserId(null);
        if (tbUserEntity == null) {
            return null;
        }

        Long ctime = tbUserEntity.getCtime();
        if (ctime <= 0) {
            return null;
        }
        return ctime;
    }
}
