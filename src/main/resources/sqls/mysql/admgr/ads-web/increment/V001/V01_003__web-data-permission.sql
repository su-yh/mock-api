-- ----------------------------
-- 数据权限表
-- ----------------------------
create table sys_data_permission (
  id                bigint          not null auto_increment    comment 'id',
  parent_id         bigint          default 0                  comment '父id，0表示根节点。',
  ancestors         varchar(1024)   default '[0]'               comment '祖级列表，以json 格式存储，依次祖级ID。',
  key_list          varchar(4096)   default '[]'               comment '关键字列表，以json 格式存储。',
  permission_name   varchar(64)     default ''                 comment '数据权限名称',
  order_num         int             default 0                  comment '显示顺序',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime        DEFAULT CURRENT_TIMESTAMP  comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  primary key (id)
) engine=innodb comment = '数据权限表';

ALTER TABLE sys_data_permission
    ADD INDEX ui_name(permission_name) USING BTREE;

INSERT INTO sys_data_permission (id, permission_name, create_by, create_time, update_by, update_time)
    VALUES (1, '系统管理员', 'system', sysdate(), 'system', sysdate());


-- ----------------------------
-- 角色和数据权限关联表  角色1-N数据权限
-- ----------------------------
create table sys_role_data_permission (
  id                   bigint not null auto_increment comment 'id',
  role_id              bigint not null comment '角色ID',
  data_permission_id   bigint not null comment '数据权限ID',
  primary key(id)
) engine=innodb comment = '角色和数据权限关联表';

ALTER TABLE sys_role_data_permission
    ADD UNIQUE INDEX ui_role_data(role_id, data_permission_id) USING BTREE;

INSERT INTO sys_role_data_permission (id, role_id, data_permission_id) VALUES (1, 1, 1);

