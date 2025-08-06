create table tg_notify_setting
(
    id           bigint        not null auto_increment comment 'id',
    team_id      bigint        not null comment '投放方id',
    chat_id      varchar(128)  not null comment '聊天id',
    bot_token    varchar(64)   not null comment '机器token',
    description  varchar(128)  default null comment '描述信息',
    enable       tinyint(1)    not null default 0 comment '是否启用[0:启用,1:禁用]',
    created      timestamp     null comment '创建时间',
    updated      timestamp     null comment '修改时间',
    created_by   varchar(64)   null comment '创建人',
    updated_by   varchar(64)   null comment '修改人',
    primary key (id)
) engine=innodb comment = 'TG 通知配置表';


INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2042, 'TG通知配置', 1, 5, 'tg-config', 'system/tg-config/index', NULL, 1, 0, 'C', '0', '0', 'system:tg:list', 'wechat', 'admin', '2024-04-15 10:35:30', 'admin', '2024-04-15 10:36:29', '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2043, '新增', 2042, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:tg:add', '#', 'admin', '2024-04-15 10:36:59', '', NULL, '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2044, '修改', 2042, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:tg:edit', '#', 'admin', '2024-04-15 10:37:25', '', NULL, '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2045, '删除', 2042, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:tg:remove', '#', 'admin', '2024-04-15 10:37:56', '', NULL, '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2046, '查询', 2042, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:tg:query', '#', 'admin', '2024-04-15 10:38:14', '', NULL, '');
