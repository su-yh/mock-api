package com.cdap.mock.constants;

import com.cdap.mock.vo.ProjectPlusEntity;

import java.math.BigDecimal;
import java.time.ZoneOffset;
import java.util.Date;

/**
 * @author suyh
 * @since 2024-12-16
 */
public class DataMockConstants {
    public static final String DEFAULT_GAID = "default_gaid";

    // 全部的项目信息
    public static final ProjectPlusEntity PROJECT_HY = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_INR = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_CNY = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_BRL = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_PKR = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_AW = new ProjectPlusEntity();
    public static final ProjectPlusEntity PROJECT_GOLD = new ProjectPlusEntity();

    static {
        PROJECT_HY.setBaseUsdRate(BigDecimal.valueOf(7));
        PROJECT_INR.setBaseUsdRate(BigDecimal.valueOf(80));
        PROJECT_CNY.setBaseUsdRate(BigDecimal.valueOf(7));
        PROJECT_BRL.setBaseUsdRate(BigDecimal.valueOf(5));
        PROJECT_PKR.setBaseUsdRate(BigDecimal.valueOf(200));
        PROJECT_AW.setBaseUsdRate(BigDecimal.valueOf(57));
        PROJECT_GOLD.setBaseUsdRate(BigDecimal.valueOf(92));

        PROJECT_HY.setZoneOffset(ZoneOffset.of("+08:00")).setZoneIdOffset("+08:00");
        PROJECT_INR.setZoneOffset(ZoneOffset.of("+05:30")).setZoneIdOffset("+05:30");
        PROJECT_CNY.setZoneOffset(ZoneOffset.of("+08:00")).setZoneIdOffset("+08:00");
        PROJECT_BRL.setZoneOffset(ZoneOffset.of("-03:00")).setZoneIdOffset("-03:00");
        PROJECT_PKR.setZoneOffset(ZoneOffset.of("+05:00")).setZoneIdOffset("+05:00");
        PROJECT_AW.setZoneOffset(ZoneOffset.of("+04:00")).setZoneIdOffset("+04:00");
        PROJECT_GOLD.setZoneOffset(ZoneOffset.of("+03:30")).setZoneIdOffset("+03:30");

        PROJECT_HY.setId(2L).setEnable(0).setCreateTime(new Date());
        PROJECT_INR.setId(3L).setEnable(1).setCreateTime(new Date());
        PROJECT_CNY.setId(5L).setEnable(1).setCreateTime(new Date());
        PROJECT_BRL.setId(6L).setEnable(1).setCreateTime(new Date());
        PROJECT_PKR.setId(9L).setEnable(1).setCreateTime(new Date());
        PROJECT_AW.setId(10L).setEnable(1).setCreateTime(new Date());
        PROJECT_GOLD.setId(12L).setEnable(1).setCreateTime(new Date());

        PROJECT_HY.setName("PN_NAME_HY").setPn("hy").setCurrency("HY");
        PROJECT_INR.setName("PN_NAME_INR").setPn("inr").setCurrency("INR");
        PROJECT_CNY.setName("PN_NAME_CNY").setPn("cny").setCurrency("CNY");
        PROJECT_BRL.setName("PN_NAME_BRL").setPn("brl").setCurrency("BRL");
        PROJECT_PKR.setName("PN_NAME_PKR").setPn("pkr").setCurrency("PKR");
        PROJECT_AW.setName("PN_NAME_AW").setPn("aw").setCurrency("AW");
        PROJECT_GOLD.setName("PN_NAME_GOLD").setPn("gold").setCurrency("GOLD");


    }
}
