/*
 Navicat Premium Data Transfer

 Source Server         : cds-postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 140011
 Source Host           : 172.31.29.74:5432
 Source Catalog        : cds
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140011
 File Encoding         : 65001

 Date: 23/03/2024 17:56:23
*/


-- ----------------------------
-- Sequence structure for ad_advertiser_campaign_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ad_advertiser_campaign_id_seq";
CREATE SEQUENCE "public"."ad_advertiser_campaign_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ad_advertiser_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ad_advertiser_id_seq";
CREATE SEQUENCE "public"."ad_advertiser_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ad_keywords_campaign_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ad_keywords_campaign_id_seq";
CREATE SEQUENCE "public"."ad_keywords_campaign_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_campaign_roas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_campaign_roas_id_seq";
CREATE SEQUENCE "public"."cohort_campaign_roas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_campaign_roas_origin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_campaign_roas_origin_id_seq";
CREATE SEQUENCE "public"."cohort_campaign_roas_origin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_campaign_roi_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_campaign_roi_id_seq";
CREATE SEQUENCE "public"."cohort_campaign_roi_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_campaign_roi_origin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_campaign_roi_origin_id_seq";
CREATE SEQUENCE "public"."cohort_campaign_roi_origin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_channel_roas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_channel_roas_id_seq";
CREATE SEQUENCE "public"."cohort_channel_roas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_channel_roas_origin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_channel_roas_origin_id_seq";
CREATE SEQUENCE "public"."cohort_channel_roas_origin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_channel_roi_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_channel_roi_id_seq";
CREATE SEQUENCE "public"."cohort_channel_roi_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_channel_roi_origin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_channel_roi_origin_id_seq";
CREATE SEQUENCE "public"."cohort_channel_roi_origin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_cost_calculate_trend_campaign_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_cost_calculate_trend_campaign_id_seq";
CREATE SEQUENCE "public"."cohort_cost_calculate_trend_campaign_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cohort_cost_calculate_trend_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cohort_cost_calculate_trend_id_seq";
CREATE SEQUENCE "public"."cohort_cost_calculate_trend_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
