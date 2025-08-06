package com.cdap.mock.env.service;

import com.cdap.mock.platform.dao.cdapmysql.entity.ProjectEntity;
import com.cdap.mock.platform.dao.cdapmysql.entity.Rate;
import com.cdap.mock.platform.dao.cdapmysql.mapper.RateMapper;
import com.cdap.mock.util.CdapDateUtils;
import com.cdap.mock.vo.ProjectPlusEntity;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author suyh
 * @since 2024-12-16
 */
@RequiredArgsConstructor
@Slf4j
public class RateService {
    // 每个币种最新的汇率日期
    private Cache<String, Integer> currencyDatesLastRate;
    private final Random random = new Random();

    private final RateMapper rateMapper;
    private final ProjectService projectService;

    public void mockRateData(long timestampMillis) {
        List<ProjectPlusEntity> projectPlusEntities = projectService.projectEntityList();

        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            int dates = CdapDateUtils.timestampToDate(timestampMillis, projectPlusEntity.getZoneOffset());

            String currency = projectPlusEntity.getCurrency();

            Integer rateDates = currencyDatesLastRate.getIfPresent(currency);
            if (rateDates != null && rateDates >= dates) {
                continue;
            }

            BigDecimal baseRate = projectPlusEntity.getBaseUsdRate();
            if (baseRate == null) {
                log.error("no base rate, from currency: {}", currency);
                continue;
            }

            Rate rate = new Rate();
            rate.setBase("USD").setDates(dates).setSymbols(currency).setCreated(new Date(timestampMillis));

            // 基础汇率的 10 % 作为浮动汇率
            BigDecimal floatRate = baseRate.divide(BigDecimal.TEN, 2, RoundingMode.HALF_DOWN);
            // 先直接 扩大1000 倍得到一个整数，基于此最大值随机一个值
            int maxValue = floatRate.multiply(BigDecimal.valueOf(1000)).intValue();
            int rndValue = random.nextInt(maxValue);
            // 将得到的随机值再缩小1000 倍(还原为小数)。这就得到了，最终10% 以内的随机浮动汇率值。
            BigDecimal curFloatValue = BigDecimal.valueOf(rndValue).divide(BigDecimal.valueOf(1000), 3, RoundingMode.HALF_DOWN);
            // 当前汇率值 = 基础汇率 + 随机浮动汇率值
            BigDecimal rateValue = baseRate.add(curFloatValue).setScale(2, RoundingMode.HALF_DOWN);
            rate.setRate(rateValue);

            rateMapper.insert(rate);
            currencyDatesLastRate.put(currency, dates);
        }
    }

    public synchronized void init() {
        currencyDatesLastRate = Caffeine.newBuilder()
                .expireAfterWrite(1, TimeUnit.DAYS).initialCapacity(4096).build();

        List<ProjectPlusEntity> projectPlusEntities = projectService.projectEntityList();
        for (ProjectPlusEntity projectPlusEntity : projectPlusEntities) {
            Rate rate = rateMapper.selectEntityLastByCurrency(projectPlusEntity.getCurrency(), null);
            if (rate != null) {
                currencyDatesLastRate.put(projectPlusEntity.getCurrency(), rate.getDates());
            }
        }
    }

    /**
     * @param extraRate 结果额外的比率
     */
    public BigDecimal randomAmount(String pn, @Nullable BigDecimal extraRate) {
        double rnd = random.nextDouble() * 50.0 + 50.0D;
        BigDecimal usdValue = BigDecimal.valueOf(rnd);  // 美元币种
        BigDecimal targetValue = usdValue;  // 换算成pn 对应的币种

        do {
            ProjectPlusEntity projectPlusEntity = projectService.obtainEntityByPn(pn);
            if (projectPlusEntity == null) {
                log.error("cannot found {}, pn: {}", ProjectEntity.class.getSimpleName(), pn);
                break;
            }

            BigDecimal baseRate = projectPlusEntity.getBaseUsdRate();
            targetValue = usdValue.multiply(baseRate);
        } while (false);

        if (extraRate != null) {
            targetValue = targetValue.multiply(extraRate);
        }

        targetValue = targetValue.setScale(2, RoundingMode.HALF_DOWN);

        return targetValue;
    }
}
