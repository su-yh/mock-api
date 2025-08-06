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
-- Table structure for ad_advertiser
-- ----------------------------
DROP TABLE IF EXISTS "public"."ad_advertiser";
CREATE TABLE "public"."ad_advertiser" (
  "id" int8 NOT NULL DEFAULT nextval('ad_advertiser_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sys_user_id" int8 NOT NULL,
  "channel" varchar(255) COLLATE "pg_catalog"."default",
  "source" varchar(255) COLLATE "pg_catalog"."default",
  "created" timestamp(6),
  "updated" timestamp(6),
  "keywords" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "single_pn" int2,
  "project_ids" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ad_advertiser"."name" IS '投放方名称';
COMMENT ON COLUMN "public"."ad_advertiser"."sys_user_id" IS '创建用户id';
COMMENT ON COLUMN "public"."ad_advertiser"."channel" IS '渠道号';
COMMENT ON COLUMN "public"."ad_advertiser"."source" IS '投放平台';
COMMENT ON COLUMN "public"."ad_advertiser"."created" IS '创建时间';
COMMENT ON COLUMN "public"."ad_advertiser"."updated" IS '更新时间';
COMMENT ON COLUMN "public"."ad_advertiser"."keywords" IS '关键字（,号隔开）';
COMMENT ON COLUMN "public"."ad_advertiser"."single_pn" IS '所属于单独一个pn的投放方';
COMMENT ON COLUMN "public"."ad_advertiser"."project_ids" IS '关联的project_ids[]';

-- ----------------------------
-- Table structure for ad_advertiser_campaign
-- ----------------------------
DROP TABLE IF EXISTS "public"."ad_advertiser_campaign";
CREATE TABLE "public"."ad_advertiser_campaign" (
  "id" int8 NOT NULL DEFAULT nextval('ad_advertiser_campaign_id_seq'::regclass),
  "advertiser_id" int8 NOT NULL DEFAULT 0,
  "campaign_id" varchar(255) COLLATE "pg_catalog"."default",
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "pn" varchar(50) COLLATE "pg_catalog"."default",
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."advertiser_id" IS '投放方id';
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."campaign_id" IS '广告系列id';
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."channel" IS '渠道code';
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."pn" IS 'PN';
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."created" IS '创建时间';
COMMENT ON COLUMN "public"."ad_advertiser_campaign"."updated" IS '更新时间';
COMMENT ON TABLE "public"."ad_advertiser_campaign" IS '投放方与广告系列关联表';

-- ----------------------------
-- Table structure for ad_keywords_campaign
-- ----------------------------
DROP TABLE IF EXISTS "public"."ad_keywords_campaign";
CREATE TABLE "public"."ad_keywords_campaign" (
  "id" int8 NOT NULL DEFAULT nextval('ad_keywords_campaign_id_seq'::regclass),
  "keyword" varchar(50) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(30) COLLATE "pg_catalog"."default",
  "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "created" timestamp(6),
  "dates" int4
)
;
COMMENT ON COLUMN "public"."ad_keywords_campaign"."id" IS '主键';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."keyword" IS '广告系列关键字';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."campaign_id" IS '广告系列ID';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."campaign_name" IS '广告系列名';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."channel" IS '渠道';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."source" IS '投放平台';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."created" IS '创建时间';
COMMENT ON COLUMN "public"."ad_keywords_campaign"."dates" IS '日期';
COMMENT ON TABLE "public"."ad_keywords_campaign" IS '广告关键字广告系列映射';

-- ----------------------------
-- Table structure for cohort_campaign_roas
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_campaign_roas";
CREATE TABLE "public"."cohort_campaign_roas" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_campaign_roas_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "active" int4,
  "cpi" numeric(20,2),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_campaign_roas"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."campaign_id" IS '广告渠道ID';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."campaign_name" IS '广告系列名';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."d0" IS '同期d0roi';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."d1" IS '同期d1roi';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."d2" IS '同期d2roi';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_campaign_roas"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_campaign_roas" IS '广告系列同期roas';

-- ----------------------------
-- Table structure for cohort_campaign_roas_origin
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_campaign_roas_origin";
CREATE TABLE "public"."cohort_campaign_roas_origin" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_campaign_roas_origin_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
  "cost" numeric(14,6),
  "cost_inr" numeric(14,6),
  "active" int4,
  "cpi" numeric(14,6),
  "d0" numeric(16,6),
  "d1" numeric(16,6),
  "d2" numeric(16,6),
  "d3" numeric(16,6),
  "d4" numeric(16,6),
  "d5" numeric(16,6),
  "d6" numeric(16,6),
  "d7" numeric(16,6),
  "d8" numeric(16,6),
  "d9" numeric(16,6),
  "d10" numeric(16,6),
  "d11" numeric(16,6),
  "d12" numeric(16,6),
  "d13" numeric(16,6),
  "d14" numeric(16,6),
  "d15" numeric(16,6),
  "d16" numeric(16,6),
  "d17" numeric(16,6),
  "d18" numeric(16,6),
  "d19" numeric(16,6),
  "d20" numeric(16,6),
  "d21" numeric(16,6),
  "d22" numeric(16,6),
  "d23" numeric(16,6),
  "d24" numeric(16,6),
  "d25" numeric(16,6),
  "d26" numeric(16,6),
  "d27" numeric(16,6),
  "d28" numeric(16,6),
  "d29" numeric(16,6),
  "d30" numeric(16,6),
  "d31" numeric(16,6),
  "d32" numeric(16,6),
  "d33" numeric(16,6),
  "d34" numeric(16,6),
  "d35" numeric(16,6),
  "d36" numeric(16,6),
  "d37" numeric(16,6),
  "d38" numeric(16,6),
  "d39" numeric(16,6),
  "d40" numeric(16,6),
  "d41" numeric(16,6),
  "d42" numeric(16,6),
  "d43" numeric(16,6),
  "d44" numeric(16,6),
  "d45" numeric(16,6),
  "d46" numeric(16,6),
  "d47" numeric(16,6),
  "d48" numeric(16,6),
  "d49" numeric(16,6),
  "d50" numeric(16,6),
  "d51" numeric(16,6),
  "d52" numeric(16,6),
  "d53" numeric(16,6),
  "d54" numeric(16,6),
  "d55" numeric(16,6),
  "d56" numeric(16,6),
  "d57" numeric(16,6),
  "d58" numeric(16,6),
  "d59" numeric(16,6),
  "d60" numeric(16,6),
  "d61" numeric(16,6),
  "d62" numeric(16,6),
  "d63" numeric(16,6),
  "d64" numeric(16,6),
  "d65" numeric(16,6),
  "d66" numeric(16,6),
  "d67" numeric(16,6),
  "d68" numeric(16,6),
  "d69" numeric(16,6),
  "d70" numeric(16,6),
  "d71" numeric(16,6),
  "d72" numeric(16,6),
  "d73" numeric(16,6),
  "d74" numeric(16,6),
  "d75" numeric(16,6),
  "d76" numeric(16,6),
  "d77" numeric(16,6),
  "d78" numeric(16,6),
  "d79" numeric(16,6),
  "d80" numeric(16,6),
  "d81" numeric(16,6),
  "d82" numeric(16,6),
  "d83" numeric(16,6),
  "d84" numeric(16,6),
  "d85" numeric(16,6),
  "d86" numeric(16,6),
  "d87" numeric(16,6),
  "d88" numeric(16,6),
  "d89" numeric(16,6),
  "created" timestamp(6),
  "updated" timestamp(6),
  "d0_recharge_count" int4,
  "d0_withdrawal" numeric(16,6)
)
;
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."campaign_id" IS '广告渠道ID';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."campaign_name" IS '广告系列名';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."cost_inr" IS '花费(INR)';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."d0" IS '同期d0roas充值';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."d1" IS '同期d1roas充值';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."d2" IS '同期d2roas充值';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."updated" IS '修改时间';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."d0_recharge_count" IS '首日充值人数';
COMMENT ON COLUMN "public"."cohort_campaign_roas_origin"."d0_withdrawal" IS '首日提现额度';
COMMENT ON TABLE "public"."cohort_campaign_roas_origin" IS '广告系列同期roas原始值';

-- ----------------------------
-- Table structure for cohort_campaign_roi
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_campaign_roi";
CREATE TABLE "public"."cohort_campaign_roi" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_campaign_roi_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "active" int4,
  "cpi" numeric(20,2),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_campaign_roi"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."campaign_id" IS '广告渠道ID';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."campaign_name" IS '广告系列名';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."d0" IS '同期d0roi';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."d1" IS '同期d1roi';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."d2" IS '同期d2roi';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_campaign_roi"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_campaign_roi" IS '广告系列同期roi';

-- ----------------------------
-- Table structure for cohort_campaign_roi_origin
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_campaign_roi_origin";
CREATE TABLE "public"."cohort_campaign_roi_origin" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_campaign_roi_origin_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
  "cost" numeric(14,6),
  "cost_inr" numeric(14,6),
  "active" int4,
  "cpi" numeric(14,6),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."campaign_id" IS '广告渠道ID';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."campaign_name" IS '广告系列名';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."cost_inr" IS '花费(INR)';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."d0" IS '同期d0roi分成中间值';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."d1" IS '同期d1roi分成中间值';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."d2" IS '同期d2roi分成中间值';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_campaign_roi_origin"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_campaign_roi_origin" IS '广告系列同期roi分成中间值';

-- ----------------------------
-- Table structure for cohort_channel_roas
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_channel_roas";
CREATE TABLE "public"."cohort_channel_roas" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_channel_roas_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "active" int4,
  "cpi" numeric(20,2),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_channel_roas"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_channel_roas"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_channel_roas"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_channel_roas"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_channel_roas"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_channel_roas"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_channel_roas"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_channel_roas"."d0" IS '同期d0roi';
COMMENT ON COLUMN "public"."cohort_channel_roas"."d1" IS '同期d1roi';
COMMENT ON COLUMN "public"."cohort_channel_roas"."d2" IS '同期d2roi';
COMMENT ON COLUMN "public"."cohort_channel_roas"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_channel_roas"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_channel_roas" IS '渠道同期roas';

-- ----------------------------
-- Table structure for cohort_channel_roas_origin
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_channel_roas_origin";
CREATE TABLE "public"."cohort_channel_roas_origin" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_channel_roas_origin_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "cost_inr" numeric(20,2),
  "active" int4,
  "cpi" numeric(14,6),
  "d0" numeric(16,6),
  "d1" numeric(16,6),
  "d2" numeric(16,6),
  "d3" numeric(16,6),
  "d4" numeric(16,6),
  "d5" numeric(16,6),
  "d6" numeric(16,6),
  "d7" numeric(16,6),
  "d8" numeric(16,6),
  "d9" numeric(16,6),
  "d10" numeric(16,6),
  "d11" numeric(16,6),
  "d12" numeric(16,6),
  "d13" numeric(16,6),
  "d14" numeric(16,6),
  "d15" numeric(16,6),
  "d16" numeric(16,6),
  "d17" numeric(16,6),
  "d18" numeric(16,6),
  "d19" numeric(16,6),
  "d20" numeric(16,6),
  "d21" numeric(16,6),
  "d22" numeric(16,6),
  "d23" numeric(16,6),
  "d24" numeric(16,6),
  "d25" numeric(16,6),
  "d26" numeric(16,6),
  "d27" numeric(16,6),
  "d28" numeric(16,6),
  "d29" numeric(16,6),
  "d30" numeric(16,6),
  "d31" numeric(16,6),
  "d32" numeric(16,6),
  "d33" numeric(16,6),
  "d34" numeric(16,6),
  "d35" numeric(16,6),
  "d36" numeric(16,6),
  "d37" numeric(16,6),
  "d38" numeric(16,6),
  "d39" numeric(16,6),
  "d40" numeric(16,6),
  "d41" numeric(16,6),
  "d42" numeric(16,6),
  "d43" numeric(16,6),
  "d44" numeric(16,6),
  "d45" numeric(16,6),
  "d46" numeric(16,6),
  "d47" numeric(16,6),
  "d48" numeric(16,6),
  "d49" numeric(16,6),
  "d50" numeric(16,6),
  "d51" numeric(16,6),
  "d52" numeric(16,6),
  "d53" numeric(16,6),
  "d54" numeric(16,6),
  "d55" numeric(16,6),
  "d56" numeric(16,6),
  "d57" numeric(16,6),
  "d58" numeric(16,6),
  "d59" numeric(16,6),
  "d60" numeric(16,6),
  "d61" numeric(16,6),
  "d62" numeric(16,6),
  "d63" numeric(16,6),
  "d64" numeric(16,6),
  "d65" numeric(16,6),
  "d66" numeric(16,6),
  "d67" numeric(16,6),
  "d68" numeric(16,6),
  "d69" numeric(16,6),
  "d70" numeric(16,6),
  "d71" numeric(16,6),
  "d72" numeric(16,6),
  "d73" numeric(16,6),
  "d74" numeric(16,6),
  "d75" numeric(16,6),
  "d76" numeric(16,6),
  "d77" numeric(16,6),
  "d78" numeric(16,6),
  "d79" numeric(16,6),
  "d80" numeric(16,6),
  "d81" numeric(16,6),
  "d82" numeric(16,6),
  "d83" numeric(16,6),
  "d84" numeric(16,6),
  "d85" numeric(16,6),
  "d86" numeric(16,6),
  "d87" numeric(16,6),
  "d88" numeric(16,6),
  "d89" numeric(16,6),
  "created" timestamp(6),
  "updated" timestamp(6),
  "d0_recharge_count" int4,
  "d0_withdrawal" numeric(16,6)
)
;
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."cost_inr" IS '花费(INR)';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."d0" IS '同期d0roas充值';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."d1" IS '同期d1roas充值';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."d2" IS '同期d2roas充值';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."updated" IS '修改时间';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."d0_recharge_count" IS '首日充值人数';
COMMENT ON COLUMN "public"."cohort_channel_roas_origin"."d0_withdrawal" IS '首日提现额度';
COMMENT ON TABLE "public"."cohort_channel_roas_origin" IS '渠道同期roas原始值';

-- ----------------------------
-- Table structure for cohort_channel_roi
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_channel_roi";
CREATE TABLE "public"."cohort_channel_roi" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_channel_roi_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "active" int4,
  "cpi" numeric(20,2),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_channel_roi"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_channel_roi"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_channel_roi"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_channel_roi"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_channel_roi"."cost" IS '花费';
COMMENT ON COLUMN "public"."cohort_channel_roi"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_channel_roi"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_channel_roi"."d0" IS '同期d0roi';
COMMENT ON COLUMN "public"."cohort_channel_roi"."d1" IS '同期d1roi';
COMMENT ON COLUMN "public"."cohort_channel_roi"."d2" IS '同期d2roi';
COMMENT ON COLUMN "public"."cohort_channel_roi"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_channel_roi"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_channel_roi" IS '渠道同期roi';

-- ----------------------------
-- Table structure for cohort_channel_roi_origin
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_channel_roi_origin";
CREATE TABLE "public"."cohort_channel_roi_origin" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_channel_roi_origin_id_seq'::regclass),
  "dates" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "cost" numeric(20,2),
  "cost_inr" numeric(20,2),
  "active" int4,
  "cpi" numeric(14,6),
  "d0" numeric(14,6),
  "d1" numeric(14,6),
  "d2" numeric(14,6),
  "d3" numeric(14,6),
  "d4" numeric(14,6),
  "d5" numeric(14,6),
  "d6" numeric(14,6),
  "d7" numeric(14,6),
  "d8" numeric(14,6),
  "d9" numeric(14,6),
  "d10" numeric(14,6),
  "d11" numeric(14,6),
  "d12" numeric(14,6),
  "d13" numeric(14,6),
  "d14" numeric(14,6),
  "d15" numeric(14,6),
  "d16" numeric(14,6),
  "d17" numeric(14,6),
  "d18" numeric(14,6),
  "d19" numeric(14,6),
  "d20" numeric(14,6),
  "d21" numeric(14,6),
  "d22" numeric(14,6),
  "d23" numeric(14,6),
  "d24" numeric(14,6),
  "d25" numeric(14,6),
  "d26" numeric(14,6),
  "d27" numeric(14,6),
  "d28" numeric(14,6),
  "d29" numeric(14,6),
  "d30" numeric(14,6),
  "d31" numeric(14,6),
  "d32" numeric(14,6),
  "d33" numeric(14,6),
  "d34" numeric(14,6),
  "d35" numeric(14,6),
  "d36" numeric(14,6),
  "d37" numeric(14,6),
  "d38" numeric(14,6),
  "d39" numeric(14,6),
  "d40" numeric(14,6),
  "d41" numeric(14,6),
  "d42" numeric(14,6),
  "d43" numeric(14,6),
  "d44" numeric(14,6),
  "d45" numeric(14,6),
  "d46" numeric(14,6),
  "d47" numeric(14,6),
  "d48" numeric(14,6),
  "d49" numeric(14,6),
  "d50" numeric(14,6),
  "d51" numeric(14,6),
  "d52" numeric(14,6),
  "d53" numeric(14,6),
  "d54" numeric(14,6),
  "d55" numeric(14,6),
  "d56" numeric(14,6),
  "d57" numeric(14,6),
  "d58" numeric(14,6),
  "d59" numeric(14,6),
  "d60" numeric(14,6),
  "d61" numeric(14,6),
  "d62" numeric(14,6),
  "d63" numeric(14,6),
  "d64" numeric(14,6),
  "d65" numeric(14,6),
  "d66" numeric(14,6),
  "d67" numeric(14,6),
  "d68" numeric(14,6),
  "d69" numeric(14,6),
  "d70" numeric(14,6),
  "d71" numeric(14,6),
  "d72" numeric(14,6),
  "d73" numeric(14,6),
  "d74" numeric(14,6),
  "d75" numeric(14,6),
  "d76" numeric(14,6),
  "d77" numeric(14,6),
  "d78" numeric(14,6),
  "d79" numeric(14,6),
  "d80" numeric(14,6),
  "d81" numeric(14,6),
  "d82" numeric(14,6),
  "d83" numeric(14,6),
  "d84" numeric(14,6),
  "d85" numeric(14,6),
  "d86" numeric(14,6),
  "d87" numeric(14,6),
  "d88" numeric(14,6),
  "d89" numeric(14,6),
  "created" timestamp(6),
  "updated" timestamp(6)
)
;
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."dates" IS '自然天日期';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."cost" IS '花费($)';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."cost_inr" IS '花费(INR)';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."active" IS '新增人数';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."cpi" IS '新增成本(cost/active)';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."d0" IS '同期d0roi分成中间值';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."d1" IS '同期d1roi分成中间值';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."d2" IS '同期d2roi分成中间值';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_channel_roi_origin"."updated" IS '修改时间';
COMMENT ON TABLE "public"."cohort_channel_roi_origin" IS '渠道同期roi分成中间值';

-- ----------------------------
-- Table structure for cohort_cost_calculate_trend
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_cost_calculate_trend";
CREATE TABLE "public"."cohort_cost_calculate_trend" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_cost_calculate_trend_id_seq'::regclass),
  "dates" int4,
  "active" int4,
  "bdates" int4,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "channelid" varchar(50) COLLATE "pg_catalog"."default",
  "google_ads_campaign_id" varchar(255) COLLATE "pg_catalog"."default",
  "google_ads_adgroup_id" varchar(255) COLLATE "pg_catalog"."default",
  "google_ads_creative_id" varchar(255) COLLATE "pg_catalog"."default",
  "fb_campaign_group_id" varchar(255) COLLATE "pg_catalog"."default",
  "fb_campaign_id" varchar(255) COLLATE "pg_catalog"."default",
  "fb_adgroup_id" varchar(255) COLLATE "pg_catalog"."default",
  "is_organic" varchar(10) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "dayretention" int4,
  "dayrecharge" numeric(14,2),
  "dayrechargecount" int4,
  "daywithdraw" numeric(14,2),
  "daycost" numeric(14,2),
  "allcost" numeric(14,2),
  "updatetime" timestamp(6),
  "dynamic_dimension" int8,
  "device_activation" int8,
  "new_cost" numeric(14,2),
  "stream_divided_roas" numeric(14,2),
  "stream_divided_roi" numeric(14,2),
  "profit_divided_roas" numeric(14,2),
  "profit_divided_roi" numeric(14,2),
  "pn" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for cohort_cost_calculate_trend_campaign
-- ----------------------------
DROP TABLE IF EXISTS "public"."cohort_cost_calculate_trend_campaign";
CREATE TABLE "public"."cohort_cost_calculate_trend_campaign" (
  "id" int8 NOT NULL DEFAULT nextval('cohort_cost_calculate_trend_campaign_id_seq'::regclass),
  "dates" int4,
  "bdates" int4,
  "cohort" int8,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "pn" varchar(10) COLLATE "pg_catalog"."default",
  "channel" varchar(20) COLLATE "pg_catalog"."default",
  "source" varchar(20) COLLATE "pg_catalog"."default",
  "campaign_id" varchar(30) COLLATE "pg_catalog"."default",
  "ad_group_id" varchar(30) COLLATE "pg_catalog"."default",
  "ad_id" varchar(30) COLLATE "pg_catalog"."default",
  "active" int8,
  "day_recharge" numeric(18,2),
  "day_recharge_count" int8,
  "day_withdraw" numeric(18,2),
  "created" timestamp(6),
  "updated" timestamp(6),
  "is_organic" int4
)
;
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."id" IS '主键';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."dates" IS '注册日期';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."bdates" IS '行为日期';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."cohort" IS '同期值';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."key" IS '关系关键字';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."pn" IS '项目';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."channel" IS '渠道';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."source" IS '投放平台';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."campaign_id" IS '广告系列ID';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."ad_group_id" IS '广告组ID';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."ad_id" IS '广告ID';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."active" IS '新增/活跃';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."day_recharge" IS '充值金额';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."day_recharge_count" IS '充值人数';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."day_withdraw" IS '提现金额';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."created" IS '创建时间';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."updated" IS '修改日期';
COMMENT ON COLUMN "public"."cohort_cost_calculate_trend_campaign"."is_organic" IS '是否是自然量';
COMMENT ON TABLE "public"."cohort_cost_calculate_trend_campaign" IS '同期广告系列维度详细数据';

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS "public"."test";
CREATE TABLE "public"."test" (
  "id" int4 NOT NULL,
  "info" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ad_advertiser_campaign_id_seq"
OWNED BY "public"."ad_advertiser_campaign"."id";
SELECT setval('"public"."ad_advertiser_campaign_id_seq"', 777341, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ad_advertiser_id_seq"
OWNED BY "public"."ad_advertiser"."id";
SELECT setval('"public"."ad_advertiser_id_seq"', 47, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ad_keywords_campaign_id_seq"
OWNED BY "public"."ad_keywords_campaign"."id";
SELECT setval('"public"."ad_keywords_campaign_id_seq"', 128090, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_campaign_roas_id_seq"
OWNED BY "public"."cohort_campaign_roas"."id";
SELECT setval('"public"."cohort_campaign_roas_id_seq"', 1221292, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_campaign_roas_origin_id_seq"
OWNED BY "public"."cohort_campaign_roas_origin"."id";
SELECT setval('"public"."cohort_campaign_roas_origin_id_seq"', 3865707, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_campaign_roi_id_seq"
OWNED BY "public"."cohort_campaign_roi"."id";
SELECT setval('"public"."cohort_campaign_roi_id_seq"', 1221292, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_campaign_roi_origin_id_seq"
OWNED BY "public"."cohort_campaign_roi_origin"."id";
SELECT setval('"public"."cohort_campaign_roi_origin_id_seq"', 3865709, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_channel_roas_id_seq"
OWNED BY "public"."cohort_channel_roas"."id";
SELECT setval('"public"."cohort_channel_roas_id_seq"', 135332, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_channel_roas_origin_id_seq"
OWNED BY "public"."cohort_channel_roas_origin"."id";
SELECT setval('"public"."cohort_channel_roas_origin_id_seq"', 325512, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_channel_roi_id_seq"
OWNED BY "public"."cohort_channel_roi"."id";
SELECT setval('"public"."cohort_channel_roi_id_seq"', 135332, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_channel_roi_origin_id_seq"
OWNED BY "public"."cohort_channel_roi_origin"."id";
SELECT setval('"public"."cohort_channel_roi_origin_id_seq"', 325512, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_cost_calculate_trend_campaign_id_seq"
OWNED BY "public"."cohort_cost_calculate_trend_campaign"."id";
SELECT setval('"public"."cohort_cost_calculate_trend_campaign_id_seq"', 10164444, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cohort_cost_calculate_trend_id_seq"
OWNED BY "public"."cohort_cost_calculate_trend"."id";
SELECT setval('"public"."cohort_cost_calculate_trend_id_seq"', 136966737, true);

-- ----------------------------
-- Primary Key structure for table ad_advertiser
-- ----------------------------
ALTER TABLE "public"."ad_advertiser" ADD CONSTRAINT "ad_advertiser_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ad_advertiser_campaign
-- ----------------------------
CREATE INDEX "ad_advertiser_campaign_campaign_id_index" ON "public"."ad_advertiser_campaign" USING btree (
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table ad_advertiser_campaign
-- ----------------------------
ALTER TABLE "public"."ad_advertiser_campaign" ADD CONSTRAINT "ad_advertiser_campaign_advertiser_id_campaign_id_key" UNIQUE ("advertiser_id", "campaign_id");

-- ----------------------------
-- Primary Key structure for table ad_advertiser_campaign
-- ----------------------------
ALTER TABLE "public"."ad_advertiser_campaign" ADD CONSTRAINT "ad_advertiser_campaign_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ad_keywords_campaign
-- ----------------------------
CREATE UNIQUE INDEX "unidx_ad_keywords_campaign_k_c" ON "public"."ad_keywords_campaign" USING btree (
  "keyword" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ad_keywords_campaign
-- ----------------------------
ALTER TABLE "public"."ad_keywords_campaign" ADD CONSTRAINT "ad_keywords_campaign_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_campaign_roas
-- ----------------------------
CREATE UNIQUE INDEX "uni_roas_dcsc" ON "public"."cohort_campaign_roas" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_campaign_roas
-- ----------------------------
ALTER TABLE "public"."cohort_campaign_roas" ADD CONSTRAINT "cohort_campaign_roas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_campaign_roas_origin
-- ----------------------------
CREATE INDEX "cohort_campaign_roas_origin_dates_channel_campaign_source" ON "public"."cohort_campaign_roas_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_campaign_roas_origin
-- ----------------------------
ALTER TABLE "public"."cohort_campaign_roas_origin" ADD CONSTRAINT "cohort_campaign_roas_origin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_campaign_roi
-- ----------------------------
CREATE UNIQUE INDEX "uni_roi_dcsc" ON "public"."cohort_campaign_roi" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_campaign_roi
-- ----------------------------
ALTER TABLE "public"."cohort_campaign_roi" ADD CONSTRAINT "cohort_campaign_roi_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_campaign_roi_origin
-- ----------------------------
CREATE INDEX "cohort_campaign_roi_origin_dates" ON "public"."cohort_campaign_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_campaign_roi_origin_dates_channel" ON "public"."cohort_campaign_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_campaign_roi_origin_dates_channel_campaign" ON "public"."cohort_campaign_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_campaign_roi_origin_dates_channel_source_campaign" ON "public"."cohort_campaign_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_campaign_roi_origin
-- ----------------------------
ALTER TABLE "public"."cohort_campaign_roi_origin" ADD CONSTRAINT "cohort_campaign_roi_origin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_channel_roas
-- ----------------------------
CREATE UNIQUE INDEX "uni_roas_dcs" ON "public"."cohort_channel_roas" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_channel_roas
-- ----------------------------
ALTER TABLE "public"."cohort_channel_roas" ADD CONSTRAINT "cohort_channel_roas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_channel_roas_origin
-- ----------------------------
CREATE INDEX "cohort_channel_roas_origin_dates" ON "public"."cohort_channel_roas_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_channel_roas_origin_dates_channel" ON "public"."cohort_channel_roas_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_channel_roas_origin_dates_channel_source" ON "public"."cohort_channel_roas_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_channel_roas_origin
-- ----------------------------
ALTER TABLE "public"."cohort_channel_roas_origin" ADD CONSTRAINT "cohort_channel_roas_origin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_channel_roi
-- ----------------------------
CREATE UNIQUE INDEX "uni_roi_dcs" ON "public"."cohort_channel_roi" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_channel_roi
-- ----------------------------
ALTER TABLE "public"."cohort_channel_roi" ADD CONSTRAINT "cohort_channel_roi_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_channel_roi_origin
-- ----------------------------
CREATE INDEX "cohort_channel_roi_origin_dates" ON "public"."cohort_channel_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_channel_roi_origin_dates_channel" ON "public"."cohort_channel_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cohort_channel_roi_origin_dates_channel_source" ON "public"."cohort_channel_roi_origin" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_channel_roi_origin
-- ----------------------------
ALTER TABLE "public"."cohort_channel_roi_origin" ADD CONSTRAINT "cohort_channel_roi_origin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_cost_calculate_trend
-- ----------------------------
CREATE INDEX "idx_c_d_b" ON "public"."cohort_cost_calculate_trend" USING btree (
  "channelid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "bdates" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_d_b" ON "public"."cohort_cost_calculate_trend" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "bdates" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uni_d_b_c_k_d" ON "public"."cohort_cost_calculate_trend" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "bdates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "channelid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dynamic_dimension" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_cost_calculate_trend
-- ----------------------------
ALTER TABLE "public"."cohort_cost_calculate_trend" ADD CONSTRAINT "cohort_cost_calculate_trend_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cohort_cost_calculate_trend_campaign
-- ----------------------------
CREATE UNIQUE INDEX "unidx_cohort_cost_calculate_trend_campaign_d_b_c_c_s_c" ON "public"."cohort_cost_calculate_trend_campaign" USING btree (
  "dates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "bdates" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "cohort" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cohort_cost_calculate_trend_campaign
-- ----------------------------
ALTER TABLE "public"."cohort_cost_calculate_trend_campaign" ADD CONSTRAINT "cohort_cost_calculate_trend_campaign_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table test
-- ----------------------------
ALTER TABLE "public"."test" ADD CONSTRAINT "test_pkey" PRIMARY KEY ("id");
