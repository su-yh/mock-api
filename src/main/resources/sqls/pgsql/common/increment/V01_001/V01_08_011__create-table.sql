-- ----------------------------
-- Table structure for cohort_campaign_roi_origin
-- ----------------------------
DROP TABLE IF EXISTS "cohort_campaign_roi_origin";
CREATE TABLE "cohort_campaign_roi_origin"
(
    "id"            BIGSERIAL PRIMARY KEY,
    "dates"         int4,
    "channel"       varchar(50) COLLATE "pg_catalog"."default",
    "source"        varchar(20) COLLATE "pg_catalog"."default",
    "campaign_id"   varchar(20) COLLATE "pg_catalog"."default",
    "campaign_name" varchar(255) COLLATE "pg_catalog"."default",
    "cost"          numeric(14, 6),
    "cost_inr"      numeric(14, 6),
    "active"        int4,
    "cpi"           numeric(14, 6),
    "d0"            numeric(14, 6),
    "d1"            numeric(14, 6),
    "d2"            numeric(14, 6),
    "d3"            numeric(14, 6),
    "d4"            numeric(14, 6),
    "d5"            numeric(14, 6),
    "d6"            numeric(14, 6),
    "d7"            numeric(14, 6),
    "d8"            numeric(14, 6),
    "d9"            numeric(14, 6),
    "d10"           numeric(14, 6),
    "d11"           numeric(14, 6),
    "d12"           numeric(14, 6),
    "d13"           numeric(14, 6),
    "d14"           numeric(14, 6),
    "d15"           numeric(14, 6),
    "d16"           numeric(14, 6),
    "d17"           numeric(14, 6),
    "d18"           numeric(14, 6),
    "d19"           numeric(14, 6),
    "d20"           numeric(14, 6),
    "d21"           numeric(14, 6),
    "d22"           numeric(14, 6),
    "d23"           numeric(14, 6),
    "d24"           numeric(14, 6),
    "d25"           numeric(14, 6),
    "d26"           numeric(14, 6),
    "d27"           numeric(14, 6),
    "d28"           numeric(14, 6),
    "d29"           numeric(14, 6),
    "d30"           numeric(14, 6),
    "d31"           numeric(14, 6),
    "d32"           numeric(14, 6),
    "d33"           numeric(14, 6),
    "d34"           numeric(14, 6),
    "d35"           numeric(14, 6),
    "d36"           numeric(14, 6),
    "d37"           numeric(14, 6),
    "d38"           numeric(14, 6),
    "d39"           numeric(14, 6),
    "d40"           numeric(14, 6),
    "d41"           numeric(14, 6),
    "d42"           numeric(14, 6),
    "d43"           numeric(14, 6),
    "d44"           numeric(14, 6),
    "d45"           numeric(14, 6),
    "d46"           numeric(14, 6),
    "d47"           numeric(14, 6),
    "d48"           numeric(14, 6),
    "d49"           numeric(14, 6),
    "d50"           numeric(14, 6),
    "d51"           numeric(14, 6),
    "d52"           numeric(14, 6),
    "d53"           numeric(14, 6),
    "d54"           numeric(14, 6),
    "d55"           numeric(14, 6),
    "d56"           numeric(14, 6),
    "d57"           numeric(14, 6),
    "d58"           numeric(14, 6),
    "d59"           numeric(14, 6),
    "d60"           numeric(14, 6),
    "d61"           numeric(14, 6),
    "d62"           numeric(14, 6),
    "d63"           numeric(14, 6),
    "d64"           numeric(14, 6),
    "d65"           numeric(14, 6),
    "d66"           numeric(14, 6),
    "d67"           numeric(14, 6),
    "d68"           numeric(14, 6),
    "d69"           numeric(14, 6),
    "d70"           numeric(14, 6),
    "d71"           numeric(14, 6),
    "d72"           numeric(14, 6),
    "d73"           numeric(14, 6),
    "d74"           numeric(14, 6),
    "d75"           numeric(14, 6),
    "d76"           numeric(14, 6),
    "d77"           numeric(14, 6),
    "d78"           numeric(14, 6),
    "d79"           numeric(14, 6),
    "d80"           numeric(14, 6),
    "d81"           numeric(14, 6),
    "d82"           numeric(14, 6),
    "d83"           numeric(14, 6),
    "d84"           numeric(14, 6),
    "d85"           numeric(14, 6),
    "d86"           numeric(14, 6),
    "d87"           numeric(14, 6),
    "d88"           numeric(14, 6),
    "d89"           numeric(14, 6),
    "created"       timestamp(6),
    "updated"       timestamp(6)
)
;
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."id" IS '主键';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."dates" IS '自然天日期';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."channel" IS '渠道';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."source" IS '投放平台';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."campaign_id" IS '广告渠道ID';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."campaign_name" IS '广告系列名';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."cost" IS '花费';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."cost_inr" IS '花费(INR)';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."active" IS '新增人数';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."cpi" IS '新增成本(cost/active)';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."d0" IS '同期d0roi分成中间值';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."d1" IS '同期d1roi分成中间值';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."d2" IS '同期d2roi分成中间值';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."created" IS '创建时间';
COMMENT
ON COLUMN "cohort_campaign_roi_origin"."updated" IS '修改时间';
COMMENT
ON TABLE "cohort_campaign_roi_origin" IS '广告系列同期roi分成中间值';


-- ----------------------------
-- Table structure for cohort_channel_roi_origin
-- ----------------------------
DROP TABLE IF EXISTS "cohort_channel_roi_origin";
CREATE TABLE "cohort_channel_roi_origin"
(
    "id"       BIGSERIAL PRIMARY KEY,
    "dates"    int4,
    "channel"  varchar(50) COLLATE "pg_catalog"."default",
    "source"   varchar(20) COLLATE "pg_catalog"."default",
    "cost"     numeric(20, 2),
    "cost_inr" numeric(20, 2),
    "active"   int4,
    "cpi"      numeric(14, 6),
    "d0"       numeric(14, 6),
    "d1"       numeric(14, 6),
    "d2"       numeric(14, 6),
    "d3"       numeric(14, 6),
    "d4"       numeric(14, 6),
    "d5"       numeric(14, 6),
    "d6"       numeric(14, 6),
    "d7"       numeric(14, 6),
    "d8"       numeric(14, 6),
    "d9"       numeric(14, 6),
    "d10"      numeric(14, 6),
    "d11"      numeric(14, 6),
    "d12"      numeric(14, 6),
    "d13"      numeric(14, 6),
    "d14"      numeric(14, 6),
    "d15"      numeric(14, 6),
    "d16"      numeric(14, 6),
    "d17"      numeric(14, 6),
    "d18"      numeric(14, 6),
    "d19"      numeric(14, 6),
    "d20"      numeric(14, 6),
    "d21"      numeric(14, 6),
    "d22"      numeric(14, 6),
    "d23"      numeric(14, 6),
    "d24"      numeric(14, 6),
    "d25"      numeric(14, 6),
    "d26"      numeric(14, 6),
    "d27"      numeric(14, 6),
    "d28"      numeric(14, 6),
    "d29"      numeric(14, 6),
    "d30"      numeric(14, 6),
    "d31"      numeric(14, 6),
    "d32"      numeric(14, 6),
    "d33"      numeric(14, 6),
    "d34"      numeric(14, 6),
    "d35"      numeric(14, 6),
    "d36"      numeric(14, 6),
    "d37"      numeric(14, 6),
    "d38"      numeric(14, 6),
    "d39"      numeric(14, 6),
    "d40"      numeric(14, 6),
    "d41"      numeric(14, 6),
    "d42"      numeric(14, 6),
    "d43"      numeric(14, 6),
    "d44"      numeric(14, 6),
    "d45"      numeric(14, 6),
    "d46"      numeric(14, 6),
    "d47"      numeric(14, 6),
    "d48"      numeric(14, 6),
    "d49"      numeric(14, 6),
    "d50"      numeric(14, 6),
    "d51"      numeric(14, 6),
    "d52"      numeric(14, 6),
    "d53"      numeric(14, 6),
    "d54"      numeric(14, 6),
    "d55"      numeric(14, 6),
    "d56"      numeric(14, 6),
    "d57"      numeric(14, 6),
    "d58"      numeric(14, 6),
    "d59"      numeric(14, 6),
    "d60"      numeric(14, 6),
    "d61"      numeric(14, 6),
    "d62"      numeric(14, 6),
    "d63"      numeric(14, 6),
    "d64"      numeric(14, 6),
    "d65"      numeric(14, 6),
    "d66"      numeric(14, 6),
    "d67"      numeric(14, 6),
    "d68"      numeric(14, 6),
    "d69"      numeric(14, 6),
    "d70"      numeric(14, 6),
    "d71"      numeric(14, 6),
    "d72"      numeric(14, 6),
    "d73"      numeric(14, 6),
    "d74"      numeric(14, 6),
    "d75"      numeric(14, 6),
    "d76"      numeric(14, 6),
    "d77"      numeric(14, 6),
    "d78"      numeric(14, 6),
    "d79"      numeric(14, 6),
    "d80"      numeric(14, 6),
    "d81"      numeric(14, 6),
    "d82"      numeric(14, 6),
    "d83"      numeric(14, 6),
    "d84"      numeric(14, 6),
    "d85"      numeric(14, 6),
    "d86"      numeric(14, 6),
    "d87"      numeric(14, 6),
    "d88"      numeric(14, 6),
    "d89"      numeric(14, 6),
    "created"  timestamp(6),
    "updated"  timestamp(6)
)
;
COMMENT
ON COLUMN "cohort_channel_roi_origin"."id" IS '主键';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."dates" IS '自然天日期';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."channel" IS '渠道';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."source" IS '投放平台';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."cost" IS '花费($)';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."cost_inr" IS '花费(INR)';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."active" IS '新增人数';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."cpi" IS '新增成本(cost/active)';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."d0" IS '同期d0roi分成中间值';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."d1" IS '同期d1roi分成中间值';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."d2" IS '同期d2roi分成中间值';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."created" IS '创建时间';
COMMENT
ON COLUMN "cohort_channel_roi_origin"."updated" IS '修改时间';
COMMENT
ON TABLE "cohort_channel_roi_origin" IS '渠道同期roi分成中间值';

-- ----------------------------
-- Table structure for cohort_channel_roas_origin
-- ----------------------------
DROP TABLE IF EXISTS "cohort_channel_roas_origin";
CREATE TABLE "cohort_channel_roas_origin"
(
    "id"                BIGSERIAL PRIMARY KEY,
    "dates"             int4,
    "channel"           varchar(50) COLLATE "pg_catalog"."default",
    "source"            varchar(20) COLLATE "pg_catalog"."default",
    "cost"              numeric(20, 2),
    "cost_inr"          numeric(20, 2),
    "active"            int4,
    "cpi"               numeric(14, 6),
    "d0"                numeric(16, 6),
    "d1"                numeric(16, 6),
    "d2"                numeric(16, 6),
    "d3"                numeric(16, 6),
    "d4"                numeric(16, 6),
    "d5"                numeric(16, 6),
    "d6"                numeric(16, 6),
    "d7"                numeric(16, 6),
    "d8"                numeric(16, 6),
    "d9"                numeric(16, 6),
    "d10"               numeric(16, 6),
    "d11"               numeric(16, 6),
    "d12"               numeric(16, 6),
    "d13"               numeric(16, 6),
    "d14"               numeric(16, 6),
    "d15"               numeric(16, 6),
    "d16"               numeric(16, 6),
    "d17"               numeric(16, 6),
    "d18"               numeric(16, 6),
    "d19"               numeric(16, 6),
    "d20"               numeric(16, 6),
    "d21"               numeric(16, 6),
    "d22"               numeric(16, 6),
    "d23"               numeric(16, 6),
    "d24"               numeric(16, 6),
    "d25"               numeric(16, 6),
    "d26"               numeric(16, 6),
    "d27"               numeric(16, 6),
    "d28"               numeric(16, 6),
    "d29"               numeric(16, 6),
    "d30"               numeric(16, 6),
    "d31"               numeric(16, 6),
    "d32"               numeric(16, 6),
    "d33"               numeric(16, 6),
    "d34"               numeric(16, 6),
    "d35"               numeric(16, 6),
    "d36"               numeric(16, 6),
    "d37"               numeric(16, 6),
    "d38"               numeric(16, 6),
    "d39"               numeric(16, 6),
    "d40"               numeric(16, 6),
    "d41"               numeric(16, 6),
    "d42"               numeric(16, 6),
    "d43"               numeric(16, 6),
    "d44"               numeric(16, 6),
    "d45"               numeric(16, 6),
    "d46"               numeric(16, 6),
    "d47"               numeric(16, 6),
    "d48"               numeric(16, 6),
    "d49"               numeric(16, 6),
    "d50"               numeric(16, 6),
    "d51"               numeric(16, 6),
    "d52"               numeric(16, 6),
    "d53"               numeric(16, 6),
    "d54"               numeric(16, 6),
    "d55"               numeric(16, 6),
    "d56"               numeric(16, 6),
    "d57"               numeric(16, 6),
    "d58"               numeric(16, 6),
    "d59"               numeric(16, 6),
    "d60"               numeric(16, 6),
    "d61"               numeric(16, 6),
    "d62"               numeric(16, 6),
    "d63"               numeric(16, 6),
    "d64"               numeric(16, 6),
    "d65"               numeric(16, 6),
    "d66"               numeric(16, 6),
    "d67"               numeric(16, 6),
    "d68"               numeric(16, 6),
    "d69"               numeric(16, 6),
    "d70"               numeric(16, 6),
    "d71"               numeric(16, 6),
    "d72"               numeric(16, 6),
    "d73"               numeric(16, 6),
    "d74"               numeric(16, 6),
    "d75"               numeric(16, 6),
    "d76"               numeric(16, 6),
    "d77"               numeric(16, 6),
    "d78"               numeric(16, 6),
    "d79"               numeric(16, 6),
    "d80"               numeric(16, 6),
    "d81"               numeric(16, 6),
    "d82"               numeric(16, 6),
    "d83"               numeric(16, 6),
    "d84"               numeric(16, 6),
    "d85"               numeric(16, 6),
    "d86"               numeric(16, 6),
    "d87"               numeric(16, 6),
    "d88"               numeric(16, 6),
    "d89"               numeric(16, 6),
    "created"           timestamp(6),
    "updated"           timestamp(6),
    "d0_recharge_count" int4,
    "d0_withdrawal"     numeric(16, 6)
)
;
COMMENT
ON COLUMN "cohort_channel_roas_origin"."id" IS '主键';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."dates" IS '自然天日期';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."channel" IS '渠道';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."source" IS '投放平台';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."cost" IS '花费';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."cost_inr" IS '花费(INR)';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."active" IS '新增人数';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."cpi" IS '新增成本(cost/active)';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."d0" IS '同期d0roas充值';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."d1" IS '同期d1roas充值';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."d2" IS '同期d2roas充值';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."created" IS '创建时间';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."updated" IS '修改时间';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."d0_recharge_count" IS '首日充值人数';
COMMENT
ON COLUMN "cohort_channel_roas_origin"."d0_withdrawal" IS '首日提现额度';
COMMENT
ON TABLE "cohort_channel_roas_origin" IS '渠道同期roas原始值';

