
-- 新增币种字段
ALTER TABLE project
    ADD COLUMN currency varchar(20) DEFAULT NULL COMMENT '项目币种';

--
UPDATE project p
SET p.currency = (
    SELECT currency
    FROM project_currency_config
    WHERE project_id = p.id
    ORDER BY dates DESC, updated DESC
    LIMIT 1
    );