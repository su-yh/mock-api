-- 用户表加个演示账号判断
ALTER TABLE sys_user
    ADD COLUMN demo_account tinyint(1) DEFAULT 0 COMMENT '演示账号（0否 1是）' AFTER remark;



-- 去掉约束
ALTER TABLE task_ad_detail_external_asset
    MODIFY COLUMN asset_url VARCHAR(1000) COMMENT '素材存储路径，绝对路径，非http 的url。';
