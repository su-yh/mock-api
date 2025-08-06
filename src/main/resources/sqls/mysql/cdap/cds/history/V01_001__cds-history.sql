/*
 Navicat Premium Data Transfer

 Source Server         : cds-mysql-b
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 172.31.25.76:3306
 Source Schema         : cds

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 23/03/2024 17:57:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Sheet1
-- ----------------------------
DROP TABLE IF EXISTS `Sheet1`;
CREATE TABLE `Sheet1`  (
  `uid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pnum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recharge` decimal(11, 2) NULL DEFAULT NULL,
  INDEX `tmp_s_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for Sheet2
-- ----------------------------
DROP TABLE IF EXISTS `Sheet2`;
CREATE TABLE `Sheet2`  (
  `gaid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `idx_s_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for _adjust_user_old
-- ----------------------------
DROP TABLE IF EXISTS `_adjust_user_old`;
CREATE TABLE `_adjust_user_old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'gaid',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户运营商',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户语言',
  `key` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组合key',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_gaid_pkg_ch`(`gaid`, `pkg`, `channelid`) USING BTREE,
  INDEX `idx_a_u_key`(`key`) USING BTREE,
  INDEX `google_ads_campaign_id`(`google_ads_campaign_id`, `google_ads_adgroup_id`, `google_ads_creative_id`, `channelid`) USING BTREE,
  INDEX `channelid`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`, `fb_adgroup_id`) USING BTREE,
  INDEX `channelid_2`(`channelid`, `is_organic`) USING BTREE,
  INDEX `channelid_3`(`channelid`, `google_ads_campaign_id`) USING BTREE,
  INDEX `channelid_4`(`channelid`, `google_ads_campaign_id`, `google_ads_adgroup_id`) USING BTREE,
  INDEX `channelid_5`(`channelid`, `fb_campaign_group_id`) USING BTREE,
  INDEX `channelid_6`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `channelid_7`(`channelid`) USING BTREE,
  INDEX `idx_a_u_gaid`(`gaid`) USING BTREE,
  INDEX `idx_cts`(`cts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for ad_advertiser
-- ----------------------------
DROP TABLE IF EXISTS `ad_advertiser`;
CREATE TABLE `ad_advertiser`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '投放方名称',
  `sys_user_id` bigint(11) NOT NULL COMMENT '创建用户id',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投放平台',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字（,号隔开）',
  `single_pn` tinyint(1) NULL DEFAULT NULL COMMENT '【0 多个pn | 1 单个pn】所属于单独一个pn的投放方,用于方便投放日报的查询逻辑',
  `project_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的project_ids[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_advertiser_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投放方' ;

-- ----------------------------
-- Table structure for ad_advertiser_campaign
-- ----------------------------
DROP TABLE IF EXISTS `ad_advertiser_campaign`;
CREATE TABLE `ad_advertiser_campaign`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `advertiser_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投放方id',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告系列id',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `pn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PN',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ad_advertiser_campaign_pk`(`advertiser_id`, `campaign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投放方与广告系列关联表' ;

-- ----------------------------
-- Table structure for ad_campaign_tag
-- ----------------------------
DROP TABLE IF EXISTS `ad_campaign_tag`;
CREATE TABLE `ad_campaign_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键词【多个逗号隔开】',
  `dates` int(8) UNSIGNED NOT NULL COMMENT '日期',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_tag`(`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_ad
-- ----------------------------
DROP TABLE IF EXISTS `adjust_ad`;
CREATE TABLE `adjust_ad`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust tracker',
  `key` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '归因平台-广告系列-广告组-广告素材组合键',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '归因平台，暂时只有FB和GG, Organic',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '包名',
  `channelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道号',
  `is_organic` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '是否organic',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列类型',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告素材id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `dates` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_adjust_key`(`key`) USING BTREE COMMENT '归因平台+广告系列-组-素材key',
  INDEX `idx_ad_channelid`(`channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for adjust_ad_cost
-- ----------------------------
DROP TABLE IF EXISTS `adjust_ad_cost`;
CREATE TABLE `adjust_ad_cost`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(16, 6) NULL DEFAULT NULL COMMENT '成本',
  `click` int(11) NULL DEFAULT NULL COMMENT '点击',
  `install` int(11) NULL DEFAULT NULL COMMENT '安装',
  `impression` int(11) NULL DEFAULT NULL COMMENT '曝光',
  `ecpi` decimal(12, 6) NULL DEFAULT NULL COMMENT 'ecpi',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告系列id',
  `ad_set_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组id',
  `ad_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告id',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_key_dates`(`dates`, `key`) USING BTREE,
  INDEX `idx_ad_id`(`ad_id`) USING BTREE,
  INDEX `idx_ad_set_id`(`ad_set_id`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_ad_cost_pre
-- ----------------------------
DROP TABLE IF EXISTS `adjust_ad_cost_pre`;
CREATE TABLE `adjust_ad_cost_pre`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(16, 6) NULL DEFAULT NULL COMMENT '成本',
  `click` int(11) NULL DEFAULT NULL COMMENT '点击',
  `install` int(11) NULL DEFAULT NULL COMMENT '安装',
  `impression` int(11) NULL DEFAULT NULL COMMENT '曝光',
  `ecpi` decimal(12, 6) NULL DEFAULT NULL COMMENT 'ecpi',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告系列id',
  `ad_set_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组id',
  `ad_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告id',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ad_id`(`ad_id`) USING BTREE,
  INDEX `idx_ad_set_id`(`ad_set_id`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_key_dates`(`dates`, `key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_cost
-- ----------------------------
DROP TABLE IF EXISTS `adjust_cost`;
CREATE TABLE `adjust_cost`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '成本',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `tracker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust tracker',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告组id',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材id',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告组id',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告素材id',
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pkg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ac_dates_key`(`key`, `dates`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_cost_campaign
-- ----------------------------
DROP TABLE IF EXISTS `adjust_cost_campaign`;
CREATE TABLE `adjust_cost_campaign`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '成本',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `tracker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust tracker',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告组id',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材id',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告组id',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告素材id',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `channel` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ac_dates_key`(`key`, `dates`) USING BTREE,
  INDEX `idx_a_c_c_campaign_dates`(`dates`, `fb_campaign_group_id`, `google_ads_campaign_id`, `cost`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_cost_campaign_pre
-- ----------------------------
DROP TABLE IF EXISTS `adjust_cost_campaign_pre`;
CREATE TABLE `adjust_cost_campaign_pre`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '成本',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `tracker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust tracker',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告组id',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材id',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告组id',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告素材id',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `channel` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_a_c_c_campaign_dates`(`dates`, `fb_campaign_group_id`, `google_ads_campaign_id`, `cost`) USING BTREE,
  INDEX `uniq_ac_dates_key`(`key`, `dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_cost_pre
-- ----------------------------
DROP TABLE IF EXISTS `adjust_cost_pre`;
CREATE TABLE `adjust_cost_pre`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告组合key',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期(yyyyMMdd)',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '成本',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust app token',
  `tracker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'adjust tracker',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告组id',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材id',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告组id',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GG广告素材id',
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ac_dates_key`(`key`, `dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_install
-- ----------------------------
DROP TABLE IF EXISTS `adjust_install`;
CREATE TABLE `adjust_install`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'gaid',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户运营商',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户语言',
  `key` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '广告组合key',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_key`(`key`) USING BTREE,
  INDEX `idx_gaid_pkg_channl`(`gaid`, `pkg`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for adjust_stat
-- ----------------------------
DROP TABLE IF EXISTS `adjust_stat`;
CREATE TABLE `adjust_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归因来源',
  `channelid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `active` int(11) NULL DEFAULT NULL COMMENT '激活，即新增',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `retention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `newrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增用户充值',
  `newrechargecount` int(11) NULL DEFAULT NULL COMMENT '新增用户充值人数',
  `newrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '新增用户充值率',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '总充值',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '总充值人数',
  `allrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '总充值率',
  `arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPPU',
  `arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPU',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '总提现',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `allcost` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计投放金额（至dates）',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `key` varchar(500) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `is_organic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dayroi` decimal(14, 2) NULL DEFAULT NULL,
  `total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_dnu_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_arppu` decimal(14, 2) NULL DEFAULT NULL,
  `final_arpu` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_roi` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_roi` decimal(14, 2) NULL DEFAULT NULL,
  `total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `calculate_rate` decimal(14, 2) NULL DEFAULT NULL,
  `day_withdraw_rate` decimal(14, 4) NULL DEFAULT NULL,
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `rebate_agency_fee` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniq_putstat_d_k`(`dates`, `key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for adjust_stat_detail
-- ----------------------------
DROP TABLE IF EXISTS `adjust_stat_detail`;
CREATE TABLE `adjust_stat_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_d_b_c_s`(`dates`, `bdates`, `channelid`, `source`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_stat_history
-- ----------------------------
DROP TABLE IF EXISTS `adjust_stat_history`;
CREATE TABLE `adjust_stat_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归因来源',
  `channelid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `active` int(11) NULL DEFAULT NULL COMMENT '激活，即新增',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `retention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `newrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增用户充值',
  `newrechargecount` int(11) NULL DEFAULT NULL COMMENT '新增用户充值人数',
  `newrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '新增用户充值率',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '总充值',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '总充值人数',
  `allrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '总充值率',
  `arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPPU',
  `arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPU',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '总提现',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `allcost` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计投放金额（至dates）',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `key` varchar(500) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `is_organic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dayroi` decimal(14, 2) NULL DEFAULT NULL,
  `total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_dnu_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_arppu` decimal(14, 2) NULL DEFAULT NULL,
  `final_arpu` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_roi` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_roi` decimal(14, 2) NULL DEFAULT NULL,
  `total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `calculate_rate` decimal(14, 2) NULL DEFAULT NULL,
  `day_withdraw_rate` decimal(14, 4) NULL DEFAULT NULL,
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniq_putstat_d_k`(`dates`, `key`) USING BTREE,
  INDEX `idx_a_s_h_fb_c_g`(`fb_campaign_group_id`) USING BTREE,
  INDEX `idx_a_s_h_fb_c`(`fb_campaign_id`) USING BTREE,
  INDEX `idx_a_s_h_fb_a`(`fb_adgroup_id`) USING BTREE,
  INDEX `idx_a_s_h_gg_c`(`google_ads_campaign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for adjust_user
-- ----------------------------
DROP TABLE IF EXISTS `adjust_user`;
CREATE TABLE `adjust_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'gaid',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户运营商',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户语言',
  `key` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组合key',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `dates` int(10) UNSIGNED NULL DEFAULT NULL,
  `web_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_gaid_pkg_ch`(`gaid`, `pkg`, `channelid`) USING BTREE,
  INDEX `idx_a_u_key`(`key`) USING BTREE,
  INDEX `google_ads_campaign_id`(`google_ads_campaign_id`, `google_ads_adgroup_id`, `google_ads_creative_id`, `channelid`) USING BTREE,
  INDEX `channelid`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`, `fb_adgroup_id`) USING BTREE,
  INDEX `channelid_2`(`channelid`, `is_organic`) USING BTREE,
  INDEX `channelid_3`(`channelid`, `google_ads_campaign_id`) USING BTREE,
  INDEX `channelid_4`(`channelid`, `google_ads_campaign_id`, `google_ads_adgroup_id`) USING BTREE,
  INDEX `channelid_5`(`channelid`, `fb_campaign_group_id`) USING BTREE,
  INDEX `channelid_6`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `channelid_7`(`channelid`) USING BTREE,
  INDEX `idx_a_u_gaid`(`gaid`) USING BTREE,
  INDEX `idx_cts`(`cts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for adjust_user_history
-- ----------------------------
DROP TABLE IF EXISTS `adjust_user_history`;
CREATE TABLE `adjust_user_history`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gaid',
  `pkg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户运营商',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户语言',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '广告组合key',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `network` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归因网络',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `dates` int(10) NULL DEFAULT NULL COMMENT '日期',
  `web_uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gaid`(`gaid`) USING BTREE,
  INDEX `idx_dates`(`dates`) USING BTREE,
  INDEX `idx_channel`(`channelid`) USING BTREE,
  INDEX `idx_installed_at`(`installed_at`) USING BTREE,
  INDEX `idx_fb_campaign_group_id`(`fb_campaign_group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for adjust_user_taurus
-- ----------------------------
DROP TABLE IF EXISTS `adjust_user_taurus`;
CREATE TABLE `adjust_user_taurus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'gaid',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户运营商',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户语言',
  `key` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组合key',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `network` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告网络',
  `dates` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_gaid_pkg_ch`(`gaid`, `pkg`, `channelid`) USING BTREE,
  INDEX `idx_a_u_key`(`key`) USING BTREE,
  INDEX `google_ads_campaign_id`(`google_ads_campaign_id`, `google_ads_adgroup_id`, `google_ads_creative_id`, `channelid`) USING BTREE,
  INDEX `channelid`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`, `fb_adgroup_id`) USING BTREE,
  INDEX `channelid_2`(`channelid`, `is_organic`) USING BTREE,
  INDEX `channelid_3`(`channelid`, `google_ads_campaign_id`) USING BTREE,
  INDEX `channelid_4`(`channelid`, `google_ads_campaign_id`, `google_ads_adgroup_id`) USING BTREE,
  INDEX `channelid_5`(`channelid`, `fb_campaign_group_id`) USING BTREE,
  INDEX `channelid_6`(`channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `channelid_7`(`channelid`) USING BTREE,
  INDEX `idx_a_u_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for adjust_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `adjust_withdraw`;
CREATE TABLE `adjust_withdraw`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'gaid',
  `pkg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '包名',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '渠道号',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'appid',
  `app_name_dashboard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app name',
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'app token',
  `tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'tracker',
  `campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告系列名称',
  `adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告组名称',
  `creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告素材名称',
  `click_referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '点击refer',
  `installed_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '安装时间',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设备名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统版本',
  `timezone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '时区',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '事件名称',
  `deeplink` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '深度链接',
  `cost_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '成本金额',
  `google_ads_campaign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG1广告系列类型',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告系列id',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组id',
  `google_ads_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告组名称',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告素材id',
  `google_ads_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告关键词',
  `google_ads_placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'GG广告placement',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告素材id',
  `fb_ad_objective_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'FB广告对象名称',
  `adid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'adjust id',
  `is_organic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否organic',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户ip',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户城市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户运营商',
  `referrer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'referrer',
  `fb_account_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'fb_account_id',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户语言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ;

-- ----------------------------
-- Table structure for advertise_platform
-- ----------------------------
DROP TABLE IF EXISTS `advertise_platform`;
CREATE TABLE `advertise_platform`  (
  `id` bigint(20) NOT NULL,
  `advertise_id` bigint(20) NULL DEFAULT NULL,
  `platform_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for advertise_series
-- ----------------------------
DROP TABLE IF EXISTS `advertise_series`;
CREATE TABLE `advertise_series`  (
  `id` bigint(20) NOT NULL,
  `advertise_id` bigint(20) NULL DEFAULT NULL,
  `advertise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `campaign_id` bigint(20) NULL DEFAULT NULL,
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for advertising_material
-- ----------------------------
DROP TABLE IF EXISTS `advertising_material`;
CREATE TABLE `advertising_material`  (
  `id` bigint(20) NOT NULL,
  `project_id` bigint(20) NULL DEFAULT NULL COMMENT '项目ID',
  `channel_id` bigint(20) NULL DEFAULT NULL,
  `channel_code_id` bigint(20) NULL DEFAULT NULL,
  `platform_id` bigint(20) NULL DEFAULT NULL,
  `advertise_id` bigint(20) NULL DEFAULT NULL,
  `data_org` bigint(255) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `material_status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for apkinfo
-- ----------------------------
DROP TABLE IF EXISTS `apkinfo`;
CREATE TABLE `apkinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `versionCode` int(11) NULL DEFAULT NULL,
  `apkPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `packageName`(`packageName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for aw_login
-- ----------------------------
DROP TABLE IF EXISTS `aw_login`;
CREATE TABLE `aw_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channle`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for aw_recharge
-- ----------------------------
DROP TABLE IF EXISTS `aw_recharge`;
CREATE TABLE `aw_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'aiwan支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前渠道',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`, `status`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_ctime`(`ctime`) USING BTREE,
  INDEX `idx_channle`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for aw_user
-- ----------------------------
DROP TABLE IF EXISTS `aw_user`;
CREATE TABLE `aw_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channle`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for aw_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `aw_withdrawal`;
CREATE TABLE `aw_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前渠道',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`, `status`, `progress`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdraw_ctime`(`ctime`) USING BTREE,
  INDEX `idx_channle`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bic_campaign_predict
-- ----------------------------
DROP TABLE IF EXISTS `bic_campaign_predict`;
CREATE TABLE `bic_campaign_predict`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dates` int(10) UNSIGNED NULL DEFAULT NULL,
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `life_cycle` int(4) NULL DEFAULT NULL,
  `model_d` int(10) NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT NULL,
  `created` int(10) UNSIGNED NULL DEFAULT NULL,
  `pred_roi_d0` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d1` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d2` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d3` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d4` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d5` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d6` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d7` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d8` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d9` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d10` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d11` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d12` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d13` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d14` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d15` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d16` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d17` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d18` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d19` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d20` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d21` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d22` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d23` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d24` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d25` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d26` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d27` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d28` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d29` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d0` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d1` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d2` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d3` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d4` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d5` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d6` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d7` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d8` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d9` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d10` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d11` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d12` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d13` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d14` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d15` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d16` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d17` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d18` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d19` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d20` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d21` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d22` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d23` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d24` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d25` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d26` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d27` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d28` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d29` decimal(20, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created`(`created`) USING BTREE,
  INDEX `iqx_cscdcm`(`channel`, `source`, `campaign_id`, `dates`, `created`, `model_d`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bic_campaign_predict_pre
-- ----------------------------
DROP TABLE IF EXISTS `bic_campaign_predict_pre`;
CREATE TABLE `bic_campaign_predict_pre`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dates` int(10) UNSIGNED NULL DEFAULT NULL,
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `life_cycle` int(4) NULL DEFAULT NULL,
  `model_d` int(10) NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT NULL,
  `created` int(10) UNSIGNED NULL DEFAULT NULL,
  `pred_roi_d0` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d1` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d2` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d3` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d4` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d5` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d6` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d7` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d8` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d9` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d10` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d11` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d12` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d13` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d14` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d15` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d16` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d17` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d18` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d19` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d20` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d21` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d22` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d23` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d24` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d25` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d26` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d27` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d28` decimal(20, 6) NULL DEFAULT NULL,
  `pred_roi_d29` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d0` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d1` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d2` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d3` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d4` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d5` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d6` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d7` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d8` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d9` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d10` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d11` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d12` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d13` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d14` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d15` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d16` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d17` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d18` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d19` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d20` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d21` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d22` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d23` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d24` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d25` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d26` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d27` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d28` decimal(20, 6) NULL DEFAULT NULL,
  `roi_d29` decimal(20, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created`(`created`) USING BTREE,
  INDEX `iqx_cscdcm`(`channel`, `source`, `campaign_id`, `dates`, `created`, `model_d`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bic_market_analy_roi
-- ----------------------------
DROP TABLE IF EXISTS `bic_market_analy_roi`;
CREATE TABLE `bic_market_analy_roi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cohort` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同期第几天',
  `ltv` decimal(20, 6) NULL DEFAULT NULL,
  `dates` int(10) NULL DEFAULT NULL COMMENT '花费时间',
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cost` decimal(20, 6) NULL DEFAULT NULL,
  `updated` int(10) NULL DEFAULT NULL,
  `created` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_dates_cohort_source`(`dates`, `pn`, `cohort`, `source`) USING BTREE COMMENT '唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for black_list_1122
-- ----------------------------
DROP TABLE IF EXISTS `black_list_1122`;
CREATE TABLE `black_list_1122`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pnum` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for bt_login
-- ----------------------------
DROP TABLE IF EXISTS `bt_login`;
CREATE TABLE `bt_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bt_recharge
-- ----------------------------
DROP TABLE IF EXISTS `bt_recharge`;
CREATE TABLE `bt_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'aiwan支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前渠道',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`, `status`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_ctime`(`ctime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bt_user
-- ----------------------------
DROP TABLE IF EXISTS `bt_user`;
CREATE TABLE `bt_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bt_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `bt_withdrawal`;
CREATE TABLE `bt_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前渠道',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`, `status`, `progress`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdraw_ctime`(`ctime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for btp_login
-- ----------------------------
DROP TABLE IF EXISTS `btp_login`;
CREATE TABLE `btp_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for btp_recharge
-- ----------------------------
DROP TABLE IF EXISTS `btp_recharge`;
CREATE TABLE `btp_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for btp_user
-- ----------------------------
DROP TABLE IF EXISTS `btp_user`;
CREATE TABLE `btp_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for btp_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `btp_withdrawal`;
CREATE TABLE `btp_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bw_login
-- ----------------------------
DROP TABLE IF EXISTS `bw_login`;
CREATE TABLE `bw_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bw_recharge
-- ----------------------------
DROP TABLE IF EXISTS `bw_recharge`;
CREATE TABLE `bw_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bw_user
-- ----------------------------
DROP TABLE IF EXISTS `bw_user`;
CREATE TABLE `bw_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bw_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `bw_withdrawal`;
CREATE TABLE `bw_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bws_login
-- ----------------------------
DROP TABLE IF EXISTS `bws_login`;
CREATE TABLE `bws_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bws_recharge
-- ----------------------------
DROP TABLE IF EXISTS `bws_recharge`;
CREATE TABLE `bws_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for bws_user
-- ----------------------------
DROP TABLE IF EXISTS `bws_user`;
CREATE TABLE `bws_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for bws_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `bws_withdrawal`;
CREATE TABLE `bws_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for campaign_material
-- ----------------------------
DROP TABLE IF EXISTS `campaign_material`;
CREATE TABLE `campaign_material`  (
  `id` bigint(22) NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `advertise_group_id` bigint(22) NULL DEFAULT NULL,
  `advertise_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `advertise_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `advertise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(22) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for campaign_picture
-- ----------------------------
DROP TABLE IF EXISTS `campaign_picture`;
CREATE TABLE `campaign_picture`  (
  `id` bigint(22) NOT NULL,
  `parent_id` bigint(22) NULL DEFAULT NULL,
  `picture_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for cds_uid_detail
-- ----------------------------
DROP TABLE IF EXISTS `cds_uid_detail`;
CREATE TABLE `cds_uid_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏ID',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '余额',
  `add_days` int(11) NULL DEFAULT NULL COMMENT '新增天数',
  `recharge_num` int(11) NULL DEFAULT NULL COMMENT '充值次数',
  `recharge_amt` decimal(20, 2) NULL DEFAULT NULL COMMENT '充值额度',
  `withdrawal_num` int(11) NULL DEFAULT NULL COMMENT '提现次数',
  `withdrawal_amt` decimal(20, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `aid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安卓ID',
  `gaid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google 广告ID',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uindex_cds_uid_detail_uid_channel_pkg`(`uid`, `channel`, `pkg`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'cp用户明细' ;

-- ----------------------------
-- Table structure for cg_dealer_daily
-- ----------------------------
DROP TABLE IF EXISTS `cg_dealer_daily`;
CREATE TABLE `cg_dealer_daily`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dates` int(20) NOT NULL COMMENT '日期',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理用户游戏uid',
  `did` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理推广码',
  `channelid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始渠道号',
  `recharge` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日充值',
  `withdrawal` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日提现',
  `income` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日收入',
  `prize` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日拉新收入',
  `rebeat` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日流水返利收入',
  `proxy` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日下级代理提成收入',
  `flow` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '推广用户当日流水',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_cg_d_d_u_d`(`dates`, `uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道名字',
  `proportion` decimal(11, 4) NOT NULL COMMENT '分成比例',
  `start_code` int(11) NOT NULL DEFAULT 0 COMMENT '渠道起始号段',
  `end_code` int(11) NOT NULL DEFAULT 0 COMMENT '渠道结束号段',
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for channel_code
-- ----------------------------
DROP TABLE IF EXISTS `channel_code`;
CREATE TABLE `channel_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '渠道id',
  `channel_prefix` int(11) NOT NULL COMMENT '渠道号前缀',
  `start_code` int(3) NOT NULL DEFAULT 1 COMMENT '渠道的起始号码',
  `end_code` int(3) NOT NULL DEFAULT 99 COMMENT '渠道最大号码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_prefix`(`channel_prefix`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for channel_code_platform
-- ----------------------------
DROP TABLE IF EXISTS `channel_code_platform`;
CREATE TABLE `channel_code_platform`  (
  `id` bigint(20) NOT NULL,
  `channel_code_id` bigint(20) NULL DEFAULT NULL,
  `platform_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for channel_proportion
-- ----------------------------
DROP TABLE IF EXISTS `channel_proportion`;
CREATE TABLE `channel_proportion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `proportion` decimal(10, 2) NOT NULL COMMENT '显示比例',
  `date` int(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_chp_ch_d`(`channel_code`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for channel_rebate_daily
-- ----------------------------
DROP TABLE IF EXISTS `channel_rebate_daily`;
CREATE TABLE `channel_rebate_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `channelid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `dates` int(11) NOT NULL COMMENT '日期',
  `rebate` decimal(14, 2) NOT NULL DEFAULT 0.00 COMMENT '返利',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `sync` datetime NULL DEFAULT NULL COMMENT '同步时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_crd_ch_d`(`channelid`, `dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for cohort_calculation_channel_code
-- ----------------------------
DROP TABLE IF EXISTS `cohort_calculation_channel_code`;
CREATE TABLE `cohort_calculation_channel_code`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pn_id` bigint(20) NOT NULL,
  `channel` bigint(20) NOT NULL,
  `channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_time` datetime NULL DEFAULT NULL,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '关联项目渠道分成',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_channel_code`(`channel_code`, `pid`) USING BTREE,
  INDEX `index_pn_id`(`pn_id`, `channel`, `channel_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_cost_calculate_trend
-- ----------------------------
DROP TABLE IF EXISTS `cohort_cost_calculate_trend`;
CREATE TABLE `cohort_cost_calculate_trend`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增注册数',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道号',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告系列',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告组',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告素材',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告系列',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告组',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告素材',
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  `dynamic_dimension` bigint(11) NULL DEFAULT NULL COMMENT '统计的动态24小时维度',
  `device_activation` bigint(11) NULL DEFAULT 0 COMMENT '设备激活',
  `new_cost` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '新增成本',
  `stream_divided_roas` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '流水分成ROAS',
  `stream_divided_roi` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '流水分成ROI',
  `profit_divided_roas` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '利润分成ROAS',
  `profit_divided_roi` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '利润分成ROI',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`, `dynamic_dimension`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE,
  INDEX `idx_channel_dates`(`channelid`, `dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_cost_calculate_trend_pre
-- ----------------------------
DROP TABLE IF EXISTS `cohort_cost_calculate_trend_pre`;
CREATE TABLE `cohort_cost_calculate_trend_pre`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增注册数',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道号',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告系列',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告组',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告素材',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告系列',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告组',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告素材',
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  `dynamic_dimension` bigint(11) NULL DEFAULT NULL COMMENT '统计的动态24小时维度',
  `device_activation` bigint(11) NULL DEFAULT 0 COMMENT '设备激活',
  `new_cost` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '新增成本',
  `stream_divided_roas` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '流水分成ROAS',
  `stream_divided_roi` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '流水分成ROI',
  `profit_divided_roas` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '利润分成ROAS',
  `profit_divided_roi` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '利润分成ROI',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`, `dynamic_dimension`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE,
  INDEX `idx_channel_dates`(`channelid`, `dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_real_curve_trend
-- ----------------------------
DROP TABLE IF EXISTS `cohort_real_curve_trend`;
CREATE TABLE `cohort_real_curve_trend`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增注册数',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道号',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告系列',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告组',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '谷歌广告素材',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告系列',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告组',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'FB广告素材',
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `withdrawcount` int(11) NULL DEFAULT NULL COMMENT '提现人数',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  `hash_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL COMMENT '时间维度',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`) USING BTREE,
  INDEX `idx_d_b_c_s`(`dates`, `bdates`, `channelid`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f_c`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `idx_d_b_c_s_c`(`dates`, `bdates`, `channelid`, `google_ads_campaign_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_recharge_retention
-- ----------------------------
DROP TABLE IF EXISTS `cohort_recharge_retention`;
CREATE TABLE `cohort_recharge_retention`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  `new_recharge_count` int(11) NULL DEFAULT NULL COMMENT '新增付费用户人数',
  `new_recharge_day_retention` bigint(11) NULL DEFAULT NULL COMMENT '新增付费用户次留',
  `new_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增付费用户充值',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`) USING BTREE,
  INDEX `idx_d_b_c_s`(`dates`, `bdates`, `channelid`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f_c`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `idx_d_b_c_s_c`(`dates`, `bdates`, `channelid`, `google_ads_campaign_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_recharge_retention_pre
-- ----------------------------
DROP TABLE IF EXISTS `cohort_recharge_retention_pre`;
CREATE TABLE `cohort_recharge_retention_pre`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  `new_recharge_count` int(11) NULL DEFAULT NULL COMMENT '新增付费用户人数',
  `new_recharge_day_retention` bigint(11) NULL DEFAULT NULL COMMENT '新增付费用户次留',
  `new_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增付费用户充值',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`) USING BTREE,
  INDEX `idx_d_b_c_s`(`dates`, `bdates`, `channelid`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f_c`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `idx_d_b_c_s_c`(`dates`, `bdates`, `channelid`, `google_ads_campaign_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_roi_calculation
-- ----------------------------
DROP TABLE IF EXISTS `cohort_roi_calculation`;
CREATE TABLE `cohort_roi_calculation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `calculation_type` int(8) NULL DEFAULT NULL,
  `calculation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pn_id` bigint(22) NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT NULL,
  `creation_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for cohort_roi_calculation_conf
-- ----------------------------
DROP TABLE IF EXISTS `cohort_roi_calculation_conf`;
CREATE TABLE `cohort_roi_calculation_conf`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recharge_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '充值手续费',
  `withdrawal_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提现手续费',
  `proportion` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '分成比例',
  `departure_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '离境手续费',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '关联项目渠道渠道号',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for computing_center
-- ----------------------------
DROP TABLE IF EXISTS `computing_center`;
CREATE TABLE `computing_center`  (
  `id` bigint(22) NOT NULL COMMENT '主键ID',
  `project_id` bigint(22) NULL DEFAULT NULL COMMENT '项目ID',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `channel_id` bigint(22) NULL DEFAULT NULL COMMENT '渠道',
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `channel_code_id` bigint(22) NULL DEFAULT NULL COMMENT '渠道号ID',
  `channel_code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号名称',
  `recharge_amount` decimal(14, 4) NULL DEFAULT NULL COMMENT '充值金额',
  `withdraw_amount` decimal(14, 4) NULL DEFAULT NULL COMMENT '提现金额',
  `rebate_to_agent` decimal(14, 4) NULL DEFAULT NULL COMMENT '代理返现金额',
  `begin_day` datetime NULL DEFAULT NULL,
  `end_day` datetime NULL DEFAULT NULL,
  `recharge_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '充值费率',
  `withdraw_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '提现费率',
  `settlement_ratio` decimal(14, 4) NULL DEFAULT NULL COMMENT '结算比例',
  `cross_border_rates` decimal(14, 4) NULL DEFAULT NULL COMMENT '跨境费率',
  `exchange_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '汇率',
  `create_time` datetime NULL DEFAULT NULL,
  `data_org` bigint(22) NULL DEFAULT NULL,
  `settlement_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `settlement_amount` decimal(24, 4) NULL DEFAULT NULL COMMENT '结算金额(卢比)',
  `actual_settlement_amount` decimal(24, 4) NULL DEFAULT NULL COMMENT '实际结算金额(美元)',
  `picture_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `parent_id` bigint(22) NULL DEFAULT NULL,
  `is_del` tinyint(2) NULL DEFAULT NULL,
  `picture_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for daily_rebate
-- ----------------------------
DROP TABLE IF EXISTS `daily_rebate`;
CREATE TABLE `daily_rebate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dates` int(11) NOT NULL COMMENT '日期yyyyMMdd',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `rebate` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献一级的充值返利',
  `proxy2` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给二级代理返利p2',
  `proxy3` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给三级代理返利p3',
  `proxy4` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给四级代理返利p4',
  `proxy5` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给5级代理返利p5',
  `pcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直接代理',
  `p3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2级代理',
  `p4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '3级代理',
  `p5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '4级代理',
  `p6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '5级代理',
  `pkg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xid_uid_dates_channel`(`uid`, `dates`, `channel`, `pkg`) USING BTREE,
  INDEX `xid_dates_channel`(`dates`, `channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for daily_rebate_today
-- ----------------------------
DROP TABLE IF EXISTS `daily_rebate_today`;
CREATE TABLE `daily_rebate_today`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dates` int(11) NOT NULL COMMENT '日期yyyyMMdd',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `rebate` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献一级的充值返利',
  `proxy2` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给二级代理返利p2',
  `proxy3` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给三级代理返利p3',
  `proxy4` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给四级代理返利p4',
  `proxy5` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '贡献给5级代理返利p5',
  `pcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直接代理',
  `p3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2级代理',
  `p4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '3级代理',
  `p5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '4级代理',
  `p6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '5级代理',
  `pkg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xid_uid_dates_channel`(`uid`, `dates`, `channel`, `pkg`) USING BTREE,
  INDEX `xid_dates_channel`(`dates`, `channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for daily_report
-- ----------------------------
DROP TABLE IF EXISTS `daily_report`;
CREATE TABLE `daily_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `channelid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道，即代理渠道下的某渠道号段',
  `dealer_channelid` int(11) NULL DEFAULT NULL COMMENT '代理渠道的id，管理channel表中的记录',
  `pkg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `dnu` int(11) NULL DEFAULT NULL COMMENT '日新增用户数',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `dou` int(11) NULL DEFAULT NULL COMMENT '历史活跃（老用户）',
  `total_users` int(11) NULL DEFAULT NULL COMMENT '截止dates的所有（新增）用户',
  `retention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `newrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增用户充值',
  `newrechargecount` int(11) NULL DEFAULT NULL COMMENT '新增用户充值人数',
  `newrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '新增用户充值率',
  `real_day_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '日充值总额',
  `recharge_user` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `recharge_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '日充值率',
  `real_arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPPU',
  `real_arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPU',
  `real_day_all_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '总提现',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `recharge_agency_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '代收费用',
  `payment_agency_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '代付费用',
  `departure_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '离境费用',
  `dealer_sharing_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '渠道分成比例',
  `total_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '裂变的总收入',
  `fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '需要分给渠道的裂变收入',
  `calculate_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '显示比例（计算比例），影响充值、提现、收入',
  `final_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日付费（充值）总额',
  `final_recharge_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日付费（充值）率',
  `final_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日提现总额',
  `final_withdraw_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的日提现率',
  `final_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '结算收入 = 充值 - 提现   + 部分裂变收入',
  `dealer_sharing_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '渠道分成',
  `final_arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的arppu',
  `final_arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的arpu',
  `real_total_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '截止dates为止的总充值数',
  `final_total_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的截止dates为止的总充值数',
  `final_newrecharge` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的日新增充值',
  `real_dou_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '活跃充值金额',
  `final_dou_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的活跃充值金额',
  `dou_rechargecount` int(11) NULL DEFAULT NULL COMMENT '老用户充值人数',
  `dou_rechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的活跃充值率',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL COMMENT '代理返利',
  `rebate_agency_fee` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniq_putstat_d_k`(`dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for dau_summary
-- ----------------------------
DROP TABLE IF EXISTS `dau_summary`;
CREATE TABLE `dau_summary`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型[D:天,H:小时,HH:30分钟,M:分钟]',
  `hash_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'hash key',
  `pkg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_dau_channel`(`channel`) USING BTREE COMMENT 'channel index',
  INDEX `index_dau_dates`(`dates`) USING BTREE COMMENT 'dates index',
  INDEX `index_dau_created`(`created`) USING BTREE COMMENT 'created index',
  INDEX `index_dau_hash_key`(`hash_key`) USING BTREE COMMENT 'hash key index'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for delivery_platform
-- ----------------------------
DROP TABLE IF EXISTS `delivery_platform`;
CREATE TABLE `delivery_platform`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义分组名',
  `create_data_org` bigint(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投放平台',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for epic_login
-- ----------------------------
DROP TABLE IF EXISTS `epic_login`;
CREATE TABLE `epic_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for epic_recharge
-- ----------------------------
DROP TABLE IF EXISTS `epic_recharge`;
CREATE TABLE `epic_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for epic_user
-- ----------------------------
DROP TABLE IF EXISTS `epic_user`;
CREATE TABLE `epic_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for epic_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `epic_withdrawal`;
CREATE TABLE `epic_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for firebase_user
-- ----------------------------
DROP TABLE IF EXISTS `firebase_user`;
CREATE TABLE `firebase_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firebase_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'firebase_id',
  `gaid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gaid',
  `online_pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线上包',
  `offline_pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线下包',
  `dates` int(8) UNSIGNED NULL DEFAULT NULL COMMENT '日期',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_firebase_id`(`firebase_id`) USING BTREE,
  INDEX `idx_gaid_offline_pkg`(`gaid`, `offline_pkg`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for flink_adjust_stat
-- ----------------------------
DROP TABLE IF EXISTS `flink_adjust_stat`;
CREATE TABLE `flink_adjust_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归因来源',
  `channelid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pkg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `active` int(11) NULL DEFAULT NULL COMMENT '激活，即新增',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `retention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `newrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增用户充值',
  `newrechargecount` int(11) NULL DEFAULT NULL COMMENT '新增用户充值人数',
  `newrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '新增用户充值率',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '总充值',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '总充值人数',
  `allrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '总充值率',
  `arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPPU',
  `arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPU',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '总提现',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `allcost` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计投放金额（至dates）',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `key` varchar(500) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `is_organic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dayroi` decimal(14, 2) NULL DEFAULT NULL,
  `total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL,
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_dnu_recharge` decimal(14, 2) NULL DEFAULT NULL,
  `final_arppu` decimal(14, 2) NULL DEFAULT NULL,
  `final_arpu` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_roi` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_roi` decimal(14, 2) NULL DEFAULT NULL,
  `total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `final_total_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `total_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL,
  `calculate_rate` decimal(14, 2) NULL DEFAULT NULL,
  `day_withdraw_rate` decimal(14, 4) NULL DEFAULT NULL,
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_day_roas` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_channel_key_dates`(`channelid`, `key`, `dates`) USING BTREE,
  INDEX `uniq_putstat_d_k`(`dates`, `key`) USING BTREE,
  INDEX `idx_a_s_h_fb_c_g`(`fb_campaign_group_id`) USING BTREE,
  INDEX `idx_a_s_h_fb_c`(`fb_campaign_id`) USING BTREE,
  INDEX `idx_a_s_h_fb_a`(`fb_adgroup_id`) USING BTREE,
  INDEX `idx_a_s_h_gg_c`(`google_ads_campaign_id`) USING BTREE,
  INDEX `idx_d_c`(`dates`, `channelid`) USING BTREE,
  INDEX `idx_d_c_s_f`(`dates`, `source`, `channelid`, `fb_campaign_group_id`) USING BTREE,
  INDEX `idx_d_c_s_g`(`dates`, `source`, `channelid`, `google_ads_campaign_id`) USING BTREE,
  INDEX `idx_d_c_s`(`dates`, `source`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for flink_adjust_stat_detail
-- ----------------------------
DROP TABLE IF EXISTS `flink_adjust_stat_detail`;
CREATE TABLE `flink_adjust_stat_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '新增日期',
  `active` int(11) NULL DEFAULT NULL COMMENT '新增',
  `bdates` int(11) NULL DEFAULT NULL COMMENT '行为日期',
  `taurus_income` decimal(14, 2) NULL DEFAULT NULL COMMENT '线下收益',
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `channelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `google_ads_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `google_ads_creative_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_organic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归因来源',
  `dayretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `allretention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `dayrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `allrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `dayrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `allrechargecount` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `daywithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `allwithdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `dayincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `daygrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `daynetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `daycost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allcost` decimal(14, 2) NULL DEFAULT NULL COMMENT '投放金额',
  `allroi` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ROI',
  `final_day_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日充值',
  `final_day_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例后的日提现',
  `day_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日推广收入',
  `final_delivery_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日推广收入',
  `day_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日裂变总收入',
  `day_sharing_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '日渠道分成的裂变收入',
  `day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '原始日总收入，包含裂变收入分成',
  `final_day_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的日总收入，包含裂变收入分成',
  `final_all_roi` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总roi',
  `final_all_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总收入，包含裂变收入分成',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL,
  `final_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的总充值，用于roas的计算',
  `final_all_roas` decimal(14, 2) NULL DEFAULT NULL COMMENT 'roas',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_d_b_c_k`(`dates`, `bdates`, `channelid`, `key`) USING BTREE,
  INDEX `idx_d_b_c_s`(`dates`, `bdates`, `channelid`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f_c`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `fb_campaign_id`) USING BTREE,
  INDEX `idx_d_b_c_s_c`(`dates`, `bdates`, `channelid`, `google_ads_campaign_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c_s_c_f`(`dates`, `bdates`, `channelid`, `fb_campaign_group_id`, `source`) USING BTREE,
  INDEX `idx_d_b_c`(`dates`, `bdates`, `channelid`) USING BTREE,
  INDEX `idx_b_c`(`bdates`, `channelid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for flink_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `flink_daily_report`;
CREATE TABLE `flink_daily_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `channelid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道，即代理渠道下的某渠道号段',
  `dealer_channelid` int(11) NULL DEFAULT NULL COMMENT '代理渠道的id，管理channel表中的记录',
  `pkg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `dnu` int(11) NULL DEFAULT NULL COMMENT '日新增用户数',
  `dau` int(11) NULL DEFAULT NULL COMMENT '活跃',
  `dou` int(11) NULL DEFAULT NULL COMMENT '历史活跃（老用户）',
  `total_users` int(11) NULL DEFAULT NULL COMMENT '截止dates的所有（新增）用户',
  `retention` int(11) NULL DEFAULT NULL COMMENT '次留',
  `newrecharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '新增用户充值',
  `newrechargecount` int(11) NULL DEFAULT NULL COMMENT '新增用户充值人数',
  `newrechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '新增用户充值率',
  `real_day_all_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '日充值总额',
  `recharge_user` int(11) NULL DEFAULT NULL COMMENT '充值人数',
  `recharge_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '日充值率',
  `real_arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPPU',
  `real_arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT 'ARPU',
  `real_day_all_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '总提现',
  `allincome` decimal(14, 2) NULL DEFAULT NULL COMMENT '总收入',
  `allgrossprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '毛利',
  `allnetprofit` decimal(14, 2) NULL DEFAULT NULL COMMENT '净利',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `remarkt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `recharge_agency_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '代收费用',
  `payment_agency_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '代付费用',
  `departure_fee` decimal(14, 2) NULL DEFAULT NULL COMMENT '离境费用',
  `dealer_sharing_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '渠道分成比例',
  `total_fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '裂变的总收入',
  `fission_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '需要分给渠道的裂变收入',
  `calculate_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '显示比例（计算比例），影响充值、提现、收入',
  `final_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日付费（充值）总额',
  `final_recharge_rate` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日付费（充值）率',
  `final_withdraw` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的日提现总额',
  `final_withdraw_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的日提现率',
  `final_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '结算收入 = 充值 - 提现   + 部分裂变收入',
  `dealer_sharing_revenue` decimal(14, 2) NULL DEFAULT NULL COMMENT '渠道分成',
  `final_arppu` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的arppu',
  `final_arpu` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的arpu',
  `real_total_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '截止dates为止的总充值数',
  `final_total_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '计算显示比例之后的截止dates为止的总充值数',
  `final_newrecharge` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的日新增充值',
  `real_dou_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '活跃充值金额',
  `final_dou_recharge` decimal(14, 2) NULL DEFAULT NULL COMMENT '最终显示的活跃充值金额',
  `dou_rechargecount` int(11) NULL DEFAULT NULL COMMENT '老用户充值人数',
  `dou_rechargerate` decimal(14, 4) NULL DEFAULT NULL COMMENT '最终显示的活跃充值率',
  `rebate_to_agent` decimal(14, 2) NULL DEFAULT NULL COMMENT '代理返利',
  `rebate_agency_fee` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_channel_dates`(`channelid`, `dates`) USING BTREE,
  INDEX `uniq_putstat_d_k`(`dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for gaid_recharge
-- ----------------------------
DROP TABLE IF EXISTS `gaid_recharge`;
CREATE TABLE `gaid_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gaid',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `gaid_unique_key`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已充值过的gaid记录' ;

-- ----------------------------
-- Table structure for generate_statement
-- ----------------------------
DROP TABLE IF EXISTS `generate_statement`;
CREATE TABLE `generate_statement`  (
  `id` bigint(22) NOT NULL COMMENT '主键ID',
  `type_id` bigint(22) NULL DEFAULT NULL COMMENT '类型ID',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `channel_id` bigint(22) NULL DEFAULT NULL COMMENT '渠道',
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `channel_code_id` bigint(22) NULL DEFAULT NULL COMMENT '渠道号ID',
  `channel_code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号名称',
  `recharge_amount` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '充值金额',
  `withdraw_amount` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '提现金额',
  `rebate_to_agent` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '代理返现金额',
  `begin_day` datetime NULL DEFAULT NULL,
  `end_day` datetime NULL DEFAULT NULL,
  `recharge_rate` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '充值费率',
  `withdraw_rate` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '提现费率',
  `settlement_ratio` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '结算比例',
  `cross_border_rates` decimal(14, 4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '跨境费率',
  `exchange_rate` decimal(14, 4) NULL DEFAULT NULL COMMENT '汇率',
  `create_time` datetime NULL DEFAULT NULL,
  `data_org` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for gold_login
-- ----------------------------
DROP TABLE IF EXISTS `gold_login`;
CREATE TABLE `gold_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channel_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for gold_recharge
-- ----------------------------
DROP TABLE IF EXISTS `gold_recharge`;
CREATE TABLE `gold_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_channel_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for gold_user
-- ----------------------------
DROP TABLE IF EXISTS `gold_user`;
CREATE TABLE `gold_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channel_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for gold_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `gold_withdrawal`;
CREATE TABLE `gold_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_channel_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for gold_withdrawal_2
-- ----------------------------
DROP TABLE IF EXISTS `gold_withdrawal_2`;
CREATE TABLE `gold_withdrawal_2`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_channel_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for imprint_login
-- ----------------------------
DROP TABLE IF EXISTS `imprint_login`;
CREATE TABLE `imprint_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_uid`(`uid`, `ctime`) USING BTREE COMMENT 'uid unique',
  INDEX `index_login_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_login_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_login_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for imprint_recharge
-- ----------------------------
DROP TABLE IF EXISTS `imprint_recharge`;
CREATE TABLE `imprint_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `tel_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `goods_amt` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `goods_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品ID',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `scene` tinyint(1) NULL DEFAULT NULL COMMENT '支付场景。0：大厅；1-------',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_recharge_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_recharge_day`(`day`) USING BTREE COMMENT 'ctime index',
  INDEX `index_recharge_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_recharge_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for imprint_user
-- ----------------------------
DROP TABLE IF EXISTS `imprint_user`;
CREATE TABLE `imprint_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_uid`(`uid`) USING BTREE COMMENT 'uid unique',
  INDEX `index_user_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_user_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_user_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for imprint_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `imprint_withdrawal`;
CREATE TABLE `imprint_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_withdrawal_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_withdrawal_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_withdrawal_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_withdrawal_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for lucky_login
-- ----------------------------
DROP TABLE IF EXISTS `lucky_login`;
CREATE TABLE `lucky_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_uid`(`uid`, `ctime`) USING BTREE COMMENT 'uid unique',
  INDEX `index_login_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_login_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_login_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for lucky_recharge
-- ----------------------------
DROP TABLE IF EXISTS `lucky_recharge`;
CREATE TABLE `lucky_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `tel_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `goods_amt` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `goods_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品ID',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `scene` tinyint(1) NULL DEFAULT NULL COMMENT '支付场景。0：大厅；1-------',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_recharge_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_recharge_day`(`day`) USING BTREE COMMENT 'ctime index',
  INDEX `index_recharge_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_recharge_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for lucky_user
-- ----------------------------
DROP TABLE IF EXISTS `lucky_user`;
CREATE TABLE `lucky_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_uid`(`uid`) USING BTREE COMMENT 'uid unique',
  INDEX `index_user_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_user_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_user_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for lucky_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `lucky_withdrawal`;
CREATE TABLE `lucky_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_withdrawal_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_withdrawal_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_withdrawal_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_withdrawal_ctime`(`ctime`) USING BTREE COMMENT 'ctime index',
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for material_permissions
-- ----------------------------
DROP TABLE IF EXISTS `material_permissions`;
CREATE TABLE `material_permissions`  (
  `id` bigint(22) NOT NULL,
  `project_id` bigint(22) NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `channel_id` bigint(22) NULL DEFAULT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_code_id` bigint(22) NULL DEFAULT NULL,
  `channel_code_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `platform_id` bigint(22) NULL DEFAULT NULL,
  `platform_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_org` bigint(22) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for mbr_login
-- ----------------------------
DROP TABLE IF EXISTS `mbr_login`;
CREATE TABLE `mbr_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for mbr_recharge
-- ----------------------------
DROP TABLE IF EXISTS `mbr_recharge`;
CREATE TABLE `mbr_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for mbr_user
-- ----------------------------
DROP TABLE IF EXISTS `mbr_user`;
CREATE TABLE `mbr_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for mbr_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `mbr_withdrawal`;
CREATE TABLE `mbr_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for meta_login
-- ----------------------------
DROP TABLE IF EXISTS `meta_login`;
CREATE TABLE `meta_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for meta_recharge
-- ----------------------------
DROP TABLE IF EXISTS `meta_recharge`;
CREATE TABLE `meta_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for meta_user
-- ----------------------------
DROP TABLE IF EXISTS `meta_user`;
CREATE TABLE `meta_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for meta_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `meta_withdrawal`;
CREATE TABLE `meta_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for monitor_mq_input_config
-- ----------------------------
DROP TABLE IF EXISTS `monitor_mq_input_config`;
CREATE TABLE `monitor_mq_input_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enable` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否开启。0-关闭，1-开启',
  `created` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `calls` int(10) NULL DEFAULT 0 COMMENT '打电话次数。为0时就不用再打',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目名',
  `pn` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `enable` tinyint(10) NULL DEFAULT 1 COMMENT '是否开启',
  `extra_rate` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '额外汇率系数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for project_currency_config
-- ----------------------------
DROP TABLE IF EXISTS `project_currency_config`;
CREATE TABLE `project_currency_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT NULL,
  `dates` int(8) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for put_calc_channel
-- ----------------------------
DROP TABLE IF EXISTS `put_calc_channel`;
CREATE TABLE `put_calc_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for put_channel
-- ----------------------------
DROP TABLE IF EXISTS `put_channel`;
CREATE TABLE `put_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `put_channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投放渠道名',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for put_channel_daily_detail
-- ----------------------------
DROP TABLE IF EXISTS `put_channel_daily_detail`;
CREATE TABLE `put_channel_daily_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `put_channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广渠道名',
  `put_channel_id` int(11) NOT NULL COMMENT '推广渠道id',
  `dates` int(11) NOT NULL COMMENT '新增日期',
  `bdates` int(11) NOT NULL COMMENT '行为日期',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告源',
  `active` int(11) NOT NULL DEFAULT 0 COMMENT '新增人数',
  `retention` int(11) NOT NULL DEFAULT 0 COMMENT '留存',
  `cost` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '成本',
  `recharge_count` int(11) NOT NULL DEFAULT 0 COMMENT '充值人数',
  `recharge` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '充值金额',
  `recharge_roi` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值roi',
  `withdraw` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `real_roi` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际roi',
  `qualified` int(10) NOT NULL DEFAULT 0 COMMENT '是否合格，0表示不合格，1表示合格',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `fb_campaign_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列名称',
  `fb_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告组id',
  `fb_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告组名称',
  `fb_adgroup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材名称',
  `fb_adgroup_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告素材id',
  `google_ads_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列名称',
  `google_ads_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GG广告系列id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `channel_change_active` int(11) NOT NULL DEFAULT 0 COMMENT '切换渠道新增人数',
  `channel_change_retention` int(11) NOT NULL DEFAULT 0 COMMENT '切换渠道留存',
  `channel_change_recharge_count` int(11) NOT NULL DEFAULT 0 COMMENT '切换渠道充值人数',
  `channel_change_recharge` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '切换渠道充值数',
  `channel_change_withdraw` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '切换渠道提现数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_channel_p_d_b_s`(`channel`, `put_channel_id`, `dates`, `bdates`, `source`) USING BTREE,
  INDEX `idx_channel_p_d_b_fb`(`channel`, `put_channel_id`, `dates`, `bdates`, `fb_campaign_group_id`, `fb_campaign_id`, `fb_adgroup_id`) USING BTREE,
  INDEX `idx_channel_p_d_b_gg`(`channel`, `put_channel_id`, `dates`, `bdates`, `google_ads_campaign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for put_channel_qualified
-- ----------------------------
DROP TABLE IF EXISTS `put_channel_qualified`;
CREATE TABLE `put_channel_qualified`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL COMMENT '新增到行为日期的是检查',
  `roi` decimal(11, 2) NOT NULL COMMENT '合格标准',
  `realroi` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '实际合格roi',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '注释',
  `base` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标币种',
  `symbols` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '转换币种',
  `rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '汇率',
  `dates` int(11) NULL DEFAULT NULL COMMENT '日期',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_b_s_d`(`base`, `symbols`, `dates`) USING BTREE,
  INDEX `idx_dates`(`dates`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sh_login
-- ----------------------------
DROP TABLE IF EXISTS `sh_login`;
CREATE TABLE `sh_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_uid`(`uid`, `ctime`) USING BTREE COMMENT 'uid unique',
  INDEX `index_login_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_login_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_login_ctime`(`ctime`) USING BTREE COMMENT 'ctime index'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for sh_recharge
-- ----------------------------
DROP TABLE IF EXISTS `sh_recharge`;
CREATE TABLE `sh_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `goods_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品ID',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `scene` tinyint(1) NULL DEFAULT NULL COMMENT '支付场景。0：大厅；1-------',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_recharge_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_recharge_day`(`day`) USING BTREE COMMENT 'ctime index',
  INDEX `index_recharge_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_recharge_ctime`(`ctime`) USING BTREE COMMENT 'ctime index'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以玩游戏的总余额，depositedcash和winningcash总和',
  `depostiedcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户不能提现的余额',
  `winningcash` decimal(20, 2) NULL DEFAULT NULL COMMENT '用户可以提现的余额（每一局赢牌的钱*提现比）',
  `logindays` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户登录天数',
  `src` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `register_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '注册时间  Unix时间戳，单位秒',
  `login_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间  Unix时间戳，单位秒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_uid`(`uid`) USING BTREE COMMENT 'uid unique',
  INDEX `index_user_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_user_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_user_ctime`(`ctime`) USING BTREE COMMENT 'ctime index'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for sh_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `sh_withdrawal`;
CREATE TABLE `sh_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pkg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `pvc` int(11) NULL DEFAULT NULL COMMENT 'apk版本号',
  `svc` int(11) NULL DEFAULT NULL COMMENT 'sdk版本号',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安卓id',
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'facebook id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'google advertising id',
  `pvn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'package version name',
  `osv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'os version name',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product name',
  `pc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'product channel',
  `gc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏渠道',
  `sovc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'so version code',
  `ivu` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用vpn',
  `iwp` tinyint(1) NULL DEFAULT NULL COMMENT '是否使用了wifi代理',
  `ism` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模拟器',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家编码',
  `timezone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  `localtimestamp` bigint(20) NULL DEFAULT NULL COMMENT '本机时间',
  `sim` tinyint(1) NULL DEFAULT NULL COMMENT '是否有手机卡',
  `isp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商信息',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备号mac地址。69:25:47:29:8c:d0',
  `mobile_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机操作系统。如android',
  `mobile_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机名称。如没有用mobile_model代',
  `mobile_brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机品牌。如samsung',
  `mobile_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机具体型号。如SM-A205F',
  `network` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网络制式。wlan,4g,5g',
  `pver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '插件版本号',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `osc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'android sdk版本',
  `pnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '玩家注册手机号',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前（充值、提现、登录）渠道号',
  `loginchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户登录渠道号',
  `regchannelid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户注册渠道号',
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `timestamp` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'Unix时间戳，单位毫秒(数据传输的时间戳)',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货币币种，默认INR，卢比',
  `cts` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '入库时间戳。单位秒',
  `day` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的年月日。20220401',
  `ctime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件产生的时间戳。单位秒',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件金额',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '事件之后的余额',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CP订单号（唯一值）',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '事件通道名称',
  `mtime` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '事件完成时间。时间戳，单位秒',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_withdrawal_order`(`order`) USING BTREE COMMENT 'order unique',
  INDEX `index_withdrawal_day`(`day`) USING BTREE COMMENT 'day index',
  INDEX `index_withdrawal_gaid`(`gaid`) USING BTREE COMMENT 'gaid index',
  INDEX `index_withdrawal_ctime`(`ctime`) USING BTREE COMMENT 'ctime index'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ;

-- ----------------------------
-- Table structure for sm_login
-- ----------------------------
DROP TABLE IF EXISTS `sm_login`;
CREATE TABLE `sm_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sm_recharge
-- ----------------------------
DROP TABLE IF EXISTS `sm_recharge`;
CREATE TABLE `sm_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for sm_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_user`;
CREATE TABLE `sm_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sm_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `sm_withdrawal`;
CREATE TABLE `sm_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for smbr_login
-- ----------------------------
DROP TABLE IF EXISTS `smbr_login`;
CREATE TABLE `smbr_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for smbr_recharge
-- ----------------------------
DROP TABLE IF EXISTS `smbr_recharge`;
CREATE TABLE `smbr_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for smbr_user
-- ----------------------------
DROP TABLE IF EXISTS `smbr_user`;
CREATE TABLE `smbr_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for smbr_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `smbr_withdrawal`;
CREATE TABLE `smbr_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for smpk_login
-- ----------------------------
DROP TABLE IF EXISTS `smpk_login`;
CREATE TABLE `smpk_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for smpk_recharge
-- ----------------------------
DROP TABLE IF EXISTS `smpk_recharge`;
CREATE TABLE `smpk_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for smpk_user
-- ----------------------------
DROP TABLE IF EXISTS `smpk_user`;
CREATE TABLE `smpk_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for smpk_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `smpk_withdrawal`;
CREATE TABLE `smpk_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for sub_channel
-- ----------------------------
DROP TABLE IF EXISTS `sub_channel`;
CREATE TABLE `sub_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `channel_id` int(11) NOT NULL COMMENT '所属渠道id',
  `package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `apk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包下载地址',
  `apk_config_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包配置地址',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_code`(`channel_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for super_login
-- ----------------------------
DROP TABLE IF EXISTS `super_login`;
CREATE TABLE `super_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for super_recharge
-- ----------------------------
DROP TABLE IF EXISTS `super_recharge`;
CREATE TABLE `super_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for super_user
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for super_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `super_withdrawal`;
CREATE TABLE `super_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '??id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '??ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '????',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '????',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?????',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '?????',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????????',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '???',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `risk` int(11) NULL DEFAULT NULL COMMENT '??0???????',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????? 0??????1???????2????',
  `status` int(11) NULL DEFAULT NULL COMMENT '????    0????1?????2????',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '????',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '??????',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?????',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?????',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '???',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '??????????? ??',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '??',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '?????',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '??????????',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' ???????',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_channek_day`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for superbr_login
-- ----------------------------
DROP TABLE IF EXISTS `superbr_login`;
CREATE TABLE `superbr_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for superbr_recharge
-- ----------------------------
DROP TABLE IF EXISTS `superbr_recharge`;
CREATE TABLE `superbr_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for superbr_user
-- ----------------------------
DROP TABLE IF EXISTS `superbr_user`;
CREATE TABLE `superbr_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for superbr_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `superbr_withdrawal`;
CREATE TABLE `superbr_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用【0-禁用 ｜ 1-启用】 默认启用',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_menu_pre
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_pre`;
CREATE TABLE `sys_menu_pre`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用【0-禁用 ｜ 1-启用】 默认启用',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `admin` int(11) NOT NULL DEFAULT 0 COMMENT '是否是管理员，0表示不是管理员，1表示是管理远',
  `data_org` bigint(22) NULL DEFAULT 0 COMMENT 'data_org',
  `google_sec_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'google身份验证器key',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tb_cum_ad_campaign
-- ----------------------------
DROP TABLE IF EXISTS `tb_cum_ad_campaign`;
CREATE TABLE `tb_cum_ad_campaign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_campaign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义分组名',
  `create_user_id` int(11) NOT NULL COMMENT '创建用户id',
  `channel_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投放平台',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tb_cum_ad_creative
-- ----------------------------
DROP TABLE IF EXISTS `tb_cum_ad_creative`;
CREATE TABLE `tb_cum_ad_creative`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_creative_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义广告素材分组',
  `create_user_id` int(11) NOT NULL COMMENT '创建用户id',
  `channel_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投放平台',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `ad_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告组id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx`(`channel_code`, `source`, `fb_campaign_group_id`, `ad_group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tb_cum_ad_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_cum_ad_group`;
CREATE TABLE `tb_cum_ad_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名',
  `create_user_id` int(11) NOT NULL COMMENT '创建用户id',
  `channel_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道号',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投放平台',
  `fb_campaign_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FB广告系列id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx`(`channel_code`, `source`, `fb_campaign_group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tb_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tb_recharge`;
CREATE TABLE `tb_recharge`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '订单创建时间',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，卢比',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归因渠道号',
  `chips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `vungo_recharge_id` bigint(20) NOT NULL COMMENT '原数据id',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gaid',
  `origin_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始渠道',
  `day` bigint(20) NULL DEFAULT NULL COMMENT '日期',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pn',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单修改时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_pn`(`order`, `pn`) USING BTREE,
  INDEX `idx_t_r_uid`(`uid`) USING BTREE,
  INDEX `idx_t_r_gaid`(`gaid`) USING BTREE,
  INDEX `idx_t_r_o_d`(`origin_channel`, `day`) USING BTREE,
  INDEX `idx_t_r_c_d`(`channel`, `day`) USING BTREE,
  INDEX `idx_uid_amt`(`uid`, `goods_amt`) USING BTREE,
  INDEX `idx_g_c_a`(`goods_amt`, `gaid`, `day`, `channel`) USING BTREE,
  INDEX `index_cts`(`cts`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '谷歌广告ID',
  `origin_channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始渠道',
  `vungo_user_id` bigint(20) NULL DEFAULT NULL COMMENT '原数据id',
  `day` bigint(20) NULL DEFAULT NULL COMMENT '日期',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_uid_pn`(`uid`, `pn`) USING BTREE,
  INDEX `idx_t_u_c_d`(`channel`, `day`) USING BTREE,
  INDEX `idx_t_u_gaid`(`gaid`) USING BTREE,
  INDEX `idx_t_u_o_d`(`origin_channel`, `day`) USING BTREE,
  INDEX `idx_t_u_d`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for tb_user_ad_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_ad_permission`;
CREATE TABLE `tb_user_ad_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `is_cum_ad_group` int(11) NOT NULL DEFAULT 0 COMMENT '是否有自定义广告分组的权限0 没有开启，1开启了',
  `is_select_all_ad` int(11) NOT NULL DEFAULT 1 COMMENT '是否选择所有广告素材0表示没有选中所有素材,1选中',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tb_user_login
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_login`;
CREATE TABLE `tb_user_login`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '谷歌广告ID',
  `origin_channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始渠道',
  `vungo_user_login_id` bigint(20) NULL DEFAULT NULL COMMENT '原数据id',
  `day` bigint(20) NULL DEFAULT NULL COMMENT '日期',
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_u_c_g_d_p`(`uid`, `channel`, `gaid`, `day`, `pn`) USING BTREE,
  INDEX `idx_t_u_u_o_d`(`origin_channel`, `day`) USING BTREE,
  INDEX `idx_t_u_l_gaid`(`gaid`) USING BTREE,
  INDEX `idx_t_u_u_c_d`(`uid`, `channel`, `day`) USING BTREE,
  INDEX `idx_t_u_c_g_u`(`channel`, `gaid`, `uid`) USING BTREE,
  INDEX `idx_t_u_l_c_d`(`channel`, `day`) USING BTREE,
  INDEX `idx_t_d`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for tb_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `tb_withdrawal`;
CREATE TABLE `tb_withdrawal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归因渠道号',
  `vungo_withdrawal_id` bigint(20) NULL DEFAULT NULL COMMENT 'vungo提现数据id',
  `origin_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原渠道',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gaid',
  `day` bigint(20) NULL DEFAULT NULL COMMENT '日期',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cts` bigint(20) NULL DEFAULT NULL COMMENT '数据入库时间',
  `pn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pn',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单修改时间，秒',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_pn`(`order`, `pn`) USING BTREE,
  INDEX `idx_t_w_uid`(`uid`) USING BTREE,
  INDEX `idx_t_w_gaid`(`gaid`) USING BTREE,
  INDEX `idx_t_w_o_d`(`origin_channel`, `day`) USING BTREE,
  INDEX `idx_t_w_c_d`(`channel`, `day`) USING BTREE,
  INDEX `idx_cts`(`cts`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for tmp_1000004
-- ----------------------------
DROP TABLE IF EXISTS `tmp_1000004`;
CREATE TABLE `tmp_1000004`  (
  `day` int(11) NULL DEFAULT NULL,
  `gaid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for tmp_aw_recall_0224
-- ----------------------------
DROP TABLE IF EXISTS `tmp_aw_recall_0224`;
CREATE TABLE `tmp_aw_recall_0224`  (
  `uid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `back_time` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for tmp_channel
-- ----------------------------
DROP TABLE IF EXISTS `tmp_channel`;
CREATE TABLE `tmp_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proportion` decimal(11, 2) NULL DEFAULT 1.00,
  `date` int(11) NULL DEFAULT 20210819,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for tmp_recall_user
-- ----------------------------
DROP TABLE IF EXISTS `tmp_recall_user`;
CREATE TABLE `tmp_recall_user`  (
  `uid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_send_time` int(11) NULL DEFAULT NULL,
  `back_time` int(11) NULL DEFAULT NULL,
  `recharge` decimal(11, 2) NULL DEFAULT NULL,
  `amount` decimal(11, 2) NULL DEFAULT NULL,
  `bonus_time` int(11) NULL DEFAULT NULL,
  INDEX `idx_tmp_u`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ;

-- ----------------------------
-- Table structure for tr_campaign_ad_campaign
-- ----------------------------
DROP TABLE IF EXISTS `tr_campaign_ad_campaign`;
CREATE TABLE `tr_campaign_ad_campaign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cum_ad_campaign_id` int(11) NOT NULL DEFAULT 0 COMMENT '自定义广告系列分组id',
  `ad_campaign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告系列id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_creative_ad_creative
-- ----------------------------
DROP TABLE IF EXISTS `tr_creative_ad_creative`;
CREATE TABLE `tr_creative_ad_creative`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cum_creative_id` int(11) NOT NULL COMMENT '自定义广告素材组id',
  `ad_creative_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告素材id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_group_ad_group
-- ----------------------------
DROP TABLE IF EXISTS `tr_group_ad_group`;
CREATE TABLE `tr_group_ad_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cum_group_id` int(11) NULL DEFAULT NULL COMMENT '自定义广告组id',
  `ad_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_user_ads
-- ----------------------------
DROP TABLE IF EXISTS `tr_user_ads`;
CREATE TABLE `tr_user_ads`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `google_ad_campaign_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'google广告系列id列表用，分割',
  `fb_campaign_group_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'fb广告系列id列表，用，分割',
  `group_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告组列表，用，分割',
  `creative_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告素材列表，用，分割',
  `channels` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ' 广告渠道',
  `sources` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告平台',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_user_compaign
-- ----------------------------
DROP TABLE IF EXISTS `tr_user_compaign`;
CREATE TABLE `tr_user_compaign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `cum_compaign_id` int(11) NOT NULL COMMENT '自定义广告系列id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_user_creative
-- ----------------------------
DROP TABLE IF EXISTS `tr_user_creative`;
CREATE TABLE `tr_user_creative`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `creative_id` int(11) NOT NULL COMMENT '自定义广告素材id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for tr_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tr_user_group`;
CREATE TABLE `tr_user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `group_id` int(11) NOT NULL COMMENT '自定义广告组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for txg_login
-- ----------------------------
DROP TABLE IF EXISTS `txg_login`;
CREATE TABLE `txg_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for txg_recharge
-- ----------------------------
DROP TABLE IF EXISTS `txg_recharge`;
CREATE TABLE `txg_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for txg_user
-- ----------------------------
DROP TABLE IF EXISTS `txg_user`;
CREATE TABLE `txg_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for txg_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `txg_withdrawal`;
CREATE TABLE `txg_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for user_channel
-- ----------------------------
DROP TABLE IF EXISTS `user_channel`;
CREATE TABLE `user_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `show_rebate` int(11) NOT NULL DEFAULT 0 COMMENT '返利',
  `show_bill` int(11) NULL DEFAULT 0 COMMENT '是否展示结算',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(22) NOT NULL,
  `project_id` bigint(22) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for user_sub_channel
-- ----------------------------
DROP TABLE IF EXISTS `user_sub_channel`;
CREATE TABLE `user_sub_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `sub_channel_id` int(11) NOT NULL COMMENT '子渠道id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for vgn_login
-- ----------------------------
DROP TABLE IF EXISTS `vgn_login`;
CREATE TABLE `vgn_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for vgn_recharge
-- ----------------------------
DROP TABLE IF EXISTS `vgn_recharge`;
CREATE TABLE `vgn_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for vgn_user
-- ----------------------------
DROP TABLE IF EXISTS `vgn_user`;
CREATE TABLE `vgn_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for vgn_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `vgn_withdrawal`;
CREATE TABLE `vgn_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for vungo_login
-- ----------------------------
DROP TABLE IF EXISTS `vungo_login`;
CREATE TABLE `vungo_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for vungo_recharge
-- ----------------------------
DROP TABLE IF EXISTS `vungo_recharge`;
CREATE TABLE `vungo_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'vungo支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`, `status`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_ctime`(`ctime`) USING BTREE,
  INDEX `idx_uid_tel_no_amount`(`uid`, `goods_amt`, `status`, `tel_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for vungo_user
-- ----------------------------
DROP TABLE IF EXISTS `vungo_user`;
CREATE TABLE `vungo_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for vungo_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `vungo_withdrawal`;
CREATE TABLE `vungo_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`, `status`, `progress`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdraw_ctime`(`ctime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for white_gaid_app
-- ----------------------------
DROP TABLE IF EXISTS `white_gaid_app`;
CREATE TABLE `white_gaid_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'gaid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_w_g_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for whzy_login
-- ----------------------------
DROP TABLE IF EXISTS `whzy_login`;
CREATE TABLE `whzy_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for whzy_recharge
-- ----------------------------
DROP TABLE IF EXISTS `whzy_recharge`;
CREATE TABLE `whzy_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for whzy_user
-- ----------------------------
DROP TABLE IF EXISTS `whzy_user`;
CREATE TABLE `whzy_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for whzy_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `whzy_withdrawal`;
CREATE TABLE `whzy_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for ysl_login
-- ----------------------------
DROP TABLE IF EXISTS `ysl_login`;
CREATE TABLE `ysl_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for ysl_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ysl_recharge`;
CREATE TABLE `ysl_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for ysl_user
-- ----------------------------
DROP TABLE IF EXISTS `ysl_user`;
CREATE TABLE `ysl_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for ysl_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ysl_withdrawal`;
CREATE TABLE `ysl_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE,
  INDEX `idx_day_channel`(`day`, `channel`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for yth_login
-- ----------------------------
DROP TABLE IF EXISTS `yth_login`;
CREATE TABLE `yth_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for yth_recharge
-- ----------------------------
DROP TABLE IF EXISTS `yth_recharge`;
CREATE TABLE `yth_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for yth_user
-- ----------------------------
DROP TABLE IF EXISTS `yth_user`;
CREATE TABLE `yth_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for yth_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `yth_withdrawal`;
CREATE TABLE `yth_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for ytp_login
-- ----------------------------
DROP TABLE IF EXISTS `ytp_login`;
CREATE TABLE `ytp_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei aid',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ul_uid_ctime`(`uid`, `ctime`) USING BTREE COMMENT '用户登录uid和时间ctime唯一',
  INDEX `idx_ul_ctime`(`ctime`) USING BTREE,
  INDEX `idx_ul_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for ytp_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ytp_recharge`;
CREATE TABLE `ytp_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `goods_amt` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品额度，单位卢比',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付平台那边产生的订单号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `scene` int(11) NULL DEFAULT NULL COMMENT '支付场景，0：大厅；1-------',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户号',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态 1创建订单；2支付成功（发货失败）；3支付成功（发货成功）；4支付失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `tel_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `chips` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_recharge_order`(`order`) USING BTREE COMMENT '充值支付订单号',
  INDEX `idx_recharge_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

-- ----------------------------
-- Table structure for ytp_user
-- ----------------------------
DROP TABLE IF EXISTS `ytp_user`;
CREATE TABLE `ytp_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `src` int(11) NULL DEFAULT NULL COMMENT '1：用户注册；2：用户登录',
  `device` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设备号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'imsi',
  `mobile_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机操作系统',
  `mobile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端版本',
  `rver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端热更资源版本',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `gaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谷歌广告ID',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机系统语言',
  `type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0：正常用户；1：白名单用户；2：黑名单用户；3：灰名单用户',
  `package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现加不可提现总余额',
  `depostiedcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '不可提现余额',
  `winningcash` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '可提现余额',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 秒',
  `loginchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录渠道号',
  `register_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册时间 秒',
  `regchannelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册渠道号',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logindays` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录时间 天',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '注册年月日',
  `pvn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`uid`) USING BTREE COMMENT '用户uid唯一',
  INDEX `idx_user_ctime`(`ctime`) USING BTREE,
  INDEX `idx_user_gaid`(`gaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ;

-- ----------------------------
-- Table structure for ytp_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ytp_withdrawal`;
CREATE TABLE `ytp_withdrawal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `ctime` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现额度',
  `cur_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '提现之后额度',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现订单号',
  `other_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道对应的订单号',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现通道名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道那边给的提现提示信息',
  `risk` int(11) NULL DEFAULT NULL COMMENT '大于0的是有风险订单',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现进度， 0我们未审核；1第三方未审核；2交易完成',
  `status` int(11) NULL DEFAULT NULL COMMENT '提现状态    0提现中；1提现成功；2提现失败',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '用户余额',
  `mtime` bigint(20) NULL DEFAULT NULL COMMENT '订单更新时间',
  `login_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录渠道号',
  `register_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册渠道号',
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `timestamp` bigint(20) NULL DEFAULT 0 COMMENT '发送端发送的时候时间戳 毫秒',
  `pn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '币种',
  `osv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `svc` int(11) NULL DEFAULT NULL,
  `pc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cts` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '入库时间戳',
  `day` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单完成时候的年月日',
  `gaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'google ad id',
  `pvn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_withdrawal_order`(`order`) USING BTREE COMMENT ' 提现支付订单号',
  INDEX `idx_withdrawal_day`(`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ;

SET FOREIGN_KEY_CHECKS = 1;
