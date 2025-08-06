-- ----------------------------
-- 投放包配置
-- ----------------------------
create table ad_package
(
    id           bigint       not null auto_increment comment 'id',
    package_name varchar(256) not null comment '包名',
    channel      varchar(64)  not null comment '渠道',
    created_id   bigint null comment '创建者ID',
    created_by    varchar(64) null comment '创建者昵称',
    created_date  datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    primary key (id)
) engine=innodb comment = '投放包配置';

ALTER TABLE ad_package
    ADD INDEX index_channel(channel) USING BTREE;




