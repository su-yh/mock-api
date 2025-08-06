-- ----------------------------
-- sys_menu_pre 菜单变更(重复率报表和上报配置)
-- ----------------------------
UPDATE sys_menu_pre SET type = 0 WHERE menu_id = 101;
UPDATE sys_menu_pre SET parent_id =101  WHERE menu_id = 102;
UPDATE sys_menu_pre SET parent_id =101  WHERE menu_id = 103;
UPDATE sys_menu_pre SET parent_id =101  WHERE menu_id = 104;

UPDATE sys_menu_pre SET type = 0 WHERE menu_id = 51;
UPDATE sys_menu_pre SET parent_id =51  WHERE menu_id = 106;
UPDATE sys_menu_pre SET parent_id =51  WHERE menu_id = 107;

-- ----------------------------
-- sys_menu 菜单变更(重复率报表和上报配置)
-- ----------------------------
UPDATE sys_menu SET type = 0 WHERE menu_id = 101;
UPDATE sys_menu SET parent_id =101  WHERE menu_id = 102;
UPDATE sys_menu SET parent_id =101  WHERE menu_id = 103;
UPDATE sys_menu SET parent_id =101  WHERE menu_id = 104;

UPDATE sys_menu SET type = 0 WHERE menu_id = 51;
UPDATE sys_menu SET parent_id =51  WHERE menu_id = 106;
UPDATE sys_menu SET parent_id =51  WHERE menu_id = 107;