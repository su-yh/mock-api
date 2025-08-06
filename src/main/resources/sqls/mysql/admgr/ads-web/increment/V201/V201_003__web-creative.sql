-- DROP TABLE IF EXISTS ad_creative_group;
-- DROP TABLE IF EXISTS ad_creative;



-- 广告创意组对应的创意组表


CREATE TABLE ad_creative_group
(
    id              BIGINT       NOT NULL AUTO_INCREMENT,
    owner_user_id   BIGINT NOT NULL COMMENT '所属用户id',
    delete_flag     BIGINT NOT NULL COMMENT '删除标记，0：未删除，非0：已删除(一般记时间戳，以纳秒为单位)',
    name            varchar(64) NOT NULL COMMENT '创意组名称，用户维度下唯一',
    creative_properties      text NOT NULL COMMENT '整个创意信息的完整json 格式数据',
    create_by_id   BIGINT NOT NULL COMMENT '创建者ID',
    create_by_nick VARCHAR(64) NOT NULL COMMENT '创建者昵称',
    created        datetime DEFAULT CURRENT_TIMESTAMP,
    updated        datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = INNODB COMMENT = '广告创意组表';

-- 唯一索引
ALTER TABLE ad_creative_group
    ADD UNIQUE INDEX uni_uid_name(owner_user_id, name, delete_flag) USING BTREE;



