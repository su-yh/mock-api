-- ----------------------------
-- sys_menu_pre 新增菜单
-- ----------------------------
UPDATE sys_menu_pre set url = null where menu_id = 51;
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (106, 0, 'Adjust | Firebase', 'pg/transport-conf', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (107, 0, 'Google Ads', 'pg/transport-conf-google-ads', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);
-- ----------------------------
-- sys_menu 新增菜单
-- ----------------------------
UPDATE sys_menu set url = null where menu_id = 51;
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (106, 0, 'Adjust | Firebase', 'pg/transport-conf', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (107, 0, 'Google Ads', 'pg/transport-conf-google-ads', 'api:transport:list,api:subchannel:list,api:channel:list', 1, '', 6, 1);