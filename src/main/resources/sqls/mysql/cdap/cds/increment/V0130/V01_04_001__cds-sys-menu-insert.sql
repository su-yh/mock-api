-- ----------------------------
-- sys_menu_pre 新增菜单
-- ----------------------------
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (105, 0, '实时趋势报表', 'pg/statistics/index', '', 1, 'editor', 1, 1);

-- ----------------------------
-- sys_menu 新增菜单
-- ----------------------------
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (105, 0, '实时趋势报表', 'pg/statistics/index', '', 1, 'editor', 1, 1);
