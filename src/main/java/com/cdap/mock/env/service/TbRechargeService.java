package com.cdap.mock.env.service;

import com.cdap.mock.biz.dao.cdapmysql.entity.TbRechargeEntity;
import com.cdap.mock.biz.dao.cdapmysql.entity.TbUserEntity;
import com.cdap.mock.biz.dao.cdapmysql.mapper.TbRechargeMapper;
import com.cdap.mock.biz.task.common.EnvLocalThread;
import com.cdap.mock.component.UuidComponent;
import com.cdap.mock.constants.DataMockConstants;
import com.cdap.mock.util.CdapDateUtils;
import com.cdap.mock.vo.TickRuntime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class TbRechargeService extends AbstractHistoryRepeatService {

    private final TbRechargeMapper tbRechargeMapper;

    private final UuidComponent uuidComponent;

    private final TbUserService tbUserService;
    private final ProjectService projectService;
    private final RateService rateService;

    @NonNull
    public List<TbRechargeEntity> mockTbRechargeList(TickRuntime tickRuntime) {
        Long timestampMillis = tickRuntime.getTimestampMillis();
        Integer dates = tickRuntime.getDates();

        Integer maxRechargeCount = EnvLocalThread.ENV_PROPERTIES_ENTITY_THREAD_LOCAL.get().getRandomMaxRecharge();
        int expectedCount = random.nextInt(maxRechargeCount);
        List<TbUserEntity> tbUserEntities = tbUserService.obtainTbUserList(expectedCount);

        {
            // 1% 几率出现一条未注册的登录记录
            int rnd = random.nextInt(100);
            if (rnd == 0) {
                TbUserEntity tbUser = tbUserService.mockTbUser(tickRuntime);
                tbUserEntities.add(tbUser);
            }
        }

        if (tbUserEntities.isEmpty()) {
            log.debug("mock recharge entity is empty.");
            return new ArrayList<>();
        }

        {
            // 5% 几率出现一条注册用户换设备记录
            int rnd = random.nextInt(100);
            if (rnd < 5) {
                int indexTmp = random.nextInt(tbUserEntities.size());
                TbUserEntity tbUserEntity = tbUserEntities.get(indexTmp);
                String gaid = "gaid_" + uuidComponent.uuidStr();
                tbUserEntity.setGaid(gaid);
            }
        }

        List<TbRechargeEntity> tbRechargeList = new ArrayList<>();
        for (TbUserEntity tbUser : tbUserEntities) {
            // 同一个用户在一个同期值偏移范围(24 小时)内，前一天也需要有发生过充值或者提现的情况
            // 还有在同一个行为日期，前后同期值偏移范围内也要有发生过充值或者提现的情况
            if (tbUser.getDay() != null && !tbUser.getDay().equals(dates)) {
                int rndTmp = random.nextInt(10);
                if (rndTmp == 0) {  // 10% 的几率产生
                    ZoneId zoneId = projectService.obtainEntityByPn(tbUser.getPn()).getZoneOffset();
                    // 用户注册当天0 点的时间戳
                    int tomorrow = CdapDateUtils.plusDays(tbUser.getDay(), 1);
                    long midnightTimestamp = CdapDateUtils.convertMidnightTimestamp(tomorrow, zoneId);
                    // 注册时间戳与到当天24 点之间的剩余时间，单位：秒
                    long offsetSecond = midnightTimestamp / 1000L - tbUser.getCtime();
                    offsetSecond = offsetSecond / 2;

                    if (offsetSecond > 0) {
                        long bdateMidnightTimestamp = CdapDateUtils.timestampMidnightTimestamp(timestampMillis, zoneId);

                        {
                            // 行为日期前一天，同一个同期值范围。
                            int offsetRnd = 1 + random.nextInt((int) offsetSecond);
                            long ts = bdateMidnightTimestamp - offsetRnd * 1000L;

                            TbRechargeEntity entity = mockEntity(tbUser, ts);
                            tbRechargeList.add(entity);
                        }

                        {
                            // 当天的24 点时间戳
                            bdateMidnightTimestamp = bdateMidnightTimestamp + Duration.ofDays(1).toMillis();
                            // 行为日期当天，下一个同期值范围。
                            int offsetRnd = 1 + random.nextInt((int) offsetSecond);
                            long ts = bdateMidnightTimestamp - offsetRnd * 1000L;

                            TbRechargeEntity entity = mockEntity(tbUser, ts);
                            tbRechargeList.add(entity);
                        }
                    }
                }
            }

            TbRechargeEntity tbUserRecharge = mockEntity(tbUser, timestampMillis);
            tbRechargeList.add(tbUserRecharge);
        }

        int rnd = random.nextInt(100);
        if (rnd == 0) {
            // 1% 的几率异常数据，这里只给一条异常记录，并不需要太多。
            if (!tbRechargeList.isEmpty()) {
                int rndIdx = random.nextInt(tbRechargeList.size());
                TbRechargeEntity tbRechargeEntity = tbRechargeList.get(rndIdx);
                resetAbnormal(tbRechargeEntity);
            }
        }

        tbRechargeMapper.insertBatch(tbRechargeList);

        return tbRechargeList;
    }

    private TbRechargeEntity mockEntity(TbUserEntity tbUser, Long timestampMillis) {
        long mtime = timestampMillis / 1000L;
        long ctime = mtime - random.nextInt(180); // 创建订单时间在完成订单时间的半小时内，且不能比创建用户的时间更早
        if (ctime < tbUser.getCtime()) {
            ctime = tbUser.getCtime();
        }

        TbRechargeEntity tbUserRecharge = new TbRechargeEntity();
        tbUserRecharge.setId(null);
        tbUserRecharge.setUid(tbUser.getUid());
        tbUserRecharge.setCtime(ctime);
        tbUserRecharge.setChannel(tbUser.getChannel());
        tbUserRecharge.setChips(null);
        tbUserRecharge.setVungoRechargeId(-1L);
        tbUserRecharge.setGaid(tbUser.getGaid());
        tbUserRecharge.setOriginChannel(tbUser.getOriginChannel());
        String orderUuid = uuidComponent.uuidStr();
        tbUserRecharge.setOrder("order_" + orderUuid);
        tbUserRecharge.setCts(timestampMillis / 1000L);
        tbUserRecharge.setPn(tbUser.getPn());
        tbUserRecharge.setMtime(mtime);
        tbUserRecharge.setLoginChannel(null);
        tbUserRecharge.setRegisterChannel(tbUser.getChannel());

        ZoneId zoneId = projectService.obtainEntityByPn(tbUser.getPn()).getZoneOffset();
        Integer dates = CdapDateUtils.timestampToDate(timestampMillis, zoneId);
        tbUserRecharge.setDay(dates);

        BigDecimal amount = rateService.randomAmount(tbUser.getPn(), BigDecimal.valueOf(10));
        tbUserRecharge.setGoodsAmt(amount);

        String pn = tbUserRecharge.getPn();
        if (StringUtils.hasText(pn)) {
            if (pn.equals(DataMockConstants.PROJECT_HY.getPn())) {
                int rndPn = random.nextInt(10000);
                if (rndPn == 0) {
                    // 一定几率出现 pn 的值为null 的情况
                    // 搞一些pn 值为null 的情况，但是只有当pn 为hy 时才可以。
                    // 因为当pn 的值为null 时，会被处理成hy
                    tbUserRecharge.setPn("");
                }
            }
        }

        return tbUserRecharge;
    }

    private void resetAbnormal(TbRechargeEntity tbRechargeEntity) {
        int rdsEx = random.nextInt(8);
        switch (rdsEx) {
            case 0:
                tbRechargeEntity.setGaid("");
                tbRechargeEntity.setUid("");
                break;
            case 1:
                tbRechargeEntity.setGaid(null);
                tbRechargeEntity.setUid("");
                break;
            case 2:
                tbRechargeEntity.setGaid("0000-0000");
                tbRechargeEntity.setUid("");
                break;
            case 3:
                tbRechargeEntity.setGaid(DataMockConstants.DEFAULT_GAID);
                break;
            case 4:
                tbRechargeEntity.setChannel("");
                break;
            case 5:
                tbRechargeEntity.setGoodsAmt(null);
                break;
            case 6:
                tbRechargeEntity.setGoodsAmt(BigDecimal.ZERO);
                break;
            case 7:
                tbRechargeEntity.setUid("");
                break;
            default:
                break;
        }
    }
}
