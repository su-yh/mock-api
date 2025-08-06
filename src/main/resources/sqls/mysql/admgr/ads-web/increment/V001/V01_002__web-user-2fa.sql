
-- 添加用户二次认证密钥字段
ALTER TABLE sys_user
    ADD COLUMN secret_key_2fa varchar(64) NULL;

-- 初始化二次认证密钥
update sys_user set secret_key_2fa = 'HMG6NIOZPH65HGKIMLUW7YIDCG2M65XN';


