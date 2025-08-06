-- ----------------------------
-- sys_menu_pre 新增菜单
-- ----------------------------
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (101, 0, '重复率报表', '', '', 0, 'admin', 0, 1);
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (102, 101, '重复率报表（渠道）', 'pg/report-form/index', '', 1, '', 0, 1);
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (103, 101, '重复率报表（投放方）', 'pg/report-form/advertiser-sift', '', 1, '', 1, 1);
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (104, 101, '重复率报表（广告系列）', 'pg/report-form/campaign-sift', '', 1, '', 2, 1);


-- ----------------------------
-- sys_menu 新增菜单
-- ----------------------------
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (101, 0, '重复率报表', '', '', 0, 'admin', 0, 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (102, 101, '重复率报表（渠道）', 'pg/report-form/index', '', 1, '', 0, 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (103, 101, '重复率报表（投放方）', 'pg/report-form/advertiser-sift', '', 1, '', 1, 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (104, 101, '重复率报表（广告系列）', 'pg/report-form/campaign-sift', '', 1, '', 2, 1);

