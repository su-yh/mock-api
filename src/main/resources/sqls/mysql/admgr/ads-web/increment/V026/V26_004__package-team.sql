create table ad_package_team
(
    id           bigint       not null auto_increment comment 'id',
    package_id bigint not null comment '投放包id',
    team_id      bigint  not null comment '投放方id',
    primary key (id)
) engine=innodb comment = '投放包和投放方关联表';