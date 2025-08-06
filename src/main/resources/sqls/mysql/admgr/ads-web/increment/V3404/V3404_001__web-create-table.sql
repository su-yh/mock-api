-- 因为业务需要一个分组可以配置多个投放方，为了后面更好维护和做权限控制。所以拆分出关联表
CREATE TABLE parent_team_group_relation
(
    id             bigint auto_increment comment '主键ID' primary key,
    parent_team_id bigint not null comment '投放方ID',
    group_id       bigint not null comment '群组ID',
    created_by_id  bigint                               not null comment '创建者ID',
    update_by_id   bigint                               null comment '修改者ID',
    created        timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    updated        timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '投放方分组关联表';

ALTER TABLE parent_team_group_relation
    ADD UNIQUE INDEX idx_parent_team_group (parent_team_id, group_id);

-- 迁移表数据
INSERT INTO parent_team_group_relation (group_id, parent_team_id, created_by_id)
SELECT id AS group_id, parent_team_id, 1 AS created_by_id
FROM parent_team_group_config
WHERE parent_team_id IS NOT NULL;

-- 为了保证版本还能正常运行，所以保留字段只修改备注
ALTER TABLE parent_team_group_config
  MODIFY COLUMN parent_team_id BIGINT COMMENT '投放方ID（3.4.4版本中这个字段已经迁移到parent_team_group_relation表中）';
