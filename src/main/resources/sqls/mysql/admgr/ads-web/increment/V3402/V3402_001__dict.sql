-- 测试报表
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (704, 9, 'FB应用时报导出指定渠道时间，导出到测试环境(reportRealTimeExcelChannelTestApplovin)', 'reportRealTimeExcelChannelTestApplovin', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (705, 10, 'FB时报导出指定渠道时间，导出到测试环境(reportRealTimeExcelChannelTest)', 'reportRealTimeExcelChannelTest', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (706, 11, 'FB时报导出指定渠道时间范围，导出到测试环境(reportRealTimeExcelChannelTestRange)', 'reportRealTimeExcelChannelTestRange', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,endDate,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (707, 12, 'GG时报导出指定渠道时间，导出到测试环境(reportRealTimeExcelChannelTestGG)', 'reportRealTimeExcelChannelTestGG', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (709, 13, 'GG时报导出指定渠道时间，导出到测试环境(reportRealTimeExcelChannelTestGGGKey)', 'reportRealTimeExcelChannelTestGGGKey', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,date,groupKey,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (710, 14, 'GG时报导出指定渠道时间(reportRealTimeExcelChannelGGRangeTest)', 'reportRealTimeExcelChannelGGRangeTest', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,groupKey,date,endDate,tgToken,chatId');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (711, 15, 'GG时报导出指定渠道时间(reportRealTimeExcelChannelGG)', 'reportRealTimeExcelChannelGG', 'xxl_job_report', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'channel,groupKey');
-- 使用status状态后 恢复以前状态为1的数据
UPDATE sys_dict_data SET status = '0' WHERE id = 703;

