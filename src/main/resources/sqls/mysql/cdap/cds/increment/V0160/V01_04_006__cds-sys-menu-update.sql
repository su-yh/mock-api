-- ----------------------------
-- sys_menu_pre 新增推广详情菜单, 并将以下菜单父id设置为 menu_id 108(推广详情)
-- 推广数据 menu_id = 36
-- 推广详细数据 menu_id = 39
-- ROI趋势(同期群) menu_id = 45
-- ROAS趋势(同期群) menu_id = 46
-- 投放日报 menu_id = 56
-- 投放方配置 menu_id = 57
-- 广告系列效果分析 menu_id = 58
-- 渠道ROI趋势(同期群) menu_id = 59
-- 渠道ROAS趋势(同期群) menu_id = 60
-- 推广详情 icon(promotion)同 menu_id = 36 推广数据保持一致, 可自行更换确认
-- ----------------------------
INSERT INTO sys_menu_pre (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (108, 0, '推广详情', '', '', 0, 'promotion',3, 1);

UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 36;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 39;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 45;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 46;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 56;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 57;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 58;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 59;
UPDATE sys_menu_pre SET parent_id = 108  WHERE menu_id = 60;

-- ----------------------------
-- 将历史角色中授权过以上菜单的角色, 统一增加 108 菜单授权
-- ----------------------------
INSERT INTO sys_role_menu (role_id, menu_id)
SELECT DISTINCT role_id,108 FROM sys_role_menu
WHERE menu_id IN ( "36", "39", "45", "46", "56", "57", "58", "59", "60" );

-- ----------------------------
-- sys_menu 新增推广详情菜单, 并将以下菜单父id设置为 menu_id 108(推广详情)
-- -- 推广数据 menu_id = 36
-- -- 推广详细数据 menu_id = 39
-- -- ROI趋势(同期群) menu_id = 45
-- -- ROAS趋势(同期群) menu_id = 46
-- -- 投放日报 menu_id = 56
-- -- 投放方配置 menu_id = 57
-- -- 广告系列效果分析 menu_id = 58
-- -- 渠道ROI趋势(同期群) menu_id = 59
-- -- 渠道ROAS趋势(同期群) menu_id = 60
-- 推广详情 icon(promotion)同 menu_id = 36 推广数据保持一致, 可自行更换确认
-- ----------------------------
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num, enable) VALUES (108, 0, '推广详情', '', '', 0, 'promotion',3, 1);

UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 36;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 39;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 45;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 46;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 56;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 57;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 58;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 59;
UPDATE sys_menu SET parent_id = 108  WHERE menu_id = 60;