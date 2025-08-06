
-- 因本次基础数据变更较大,已无法兼容历史手动录入账号的数据,
-- 故本次变更需清除以下数据表中历史数据,防止用户使用历史模板或者草稿出现问题。
DELETE FROM ad_template_draft;
DELETE FROM ad_template_formal;
DELETE FROM ad_template_preview;