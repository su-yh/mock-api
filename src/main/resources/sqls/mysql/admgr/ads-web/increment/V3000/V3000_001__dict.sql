-- AdMaterialSourceEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (181, '素材库来源', 'ad_material_source_type', '0', 'admin', now(), '', now(), 'AdMaterialSourceEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (600, 0, '用户上传', 'USER_UPLOAD', 'ad_material_source_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '用户在广告后台上传');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (601, 0, 'AIGC', 'AI_GENERATE', 'ad_material_source_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '在AIGC中生成对');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (602, 0, '同步', 'SYNC', 'ad_material_source_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '同步素材下来的');

-- FileCompressEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (182, '文件压缩状态', 'file_compression_status', '0', 'admin', now(), '', now(), 'FileCompressEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (605, 0, '未压缩', 'UNCOMPRESSED', 'file_compression_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '未压缩');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (606, 0, 'GZIP', 'GZIP', 'file_compression_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'gzip压缩');

-- FileTypeEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (183, '文件类型', 'ai_file_type', '0', 'admin', now(), '', now(), 'FileTypeEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (610, 0, '图片', 'IMAGE', 'ai_file_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '图片');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (611, 0, '视频', 'VIDEO', 'ai_file_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '视频');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (612, 0, '未知', 'UNKNOWN', 'ai_file_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), '未知');

-- StorageMediumEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (184, '存储介质', 'ai_storage_media', '0', 'admin', now(), '', now(), 'StorageMediumEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (615, 0, '已删除', 'DELETED', 'ai_storage_media', '', 'primary', 'N', '0', 'admin', now(), '', now(), '已删除');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (616, 0, '本地', 'LOCAL', 'ai_storage_media', '', 'primary', 'N', '0', 'admin', now(), '', now(), '本地');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (617, 0, 'S3-标准', 'S3_STANDARD', 'ai_storage_media', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'S3-标准');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (618, 0, 'S3-IA', 'S3_IA', 'ai_storage_media', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'S3-IA');

-- AITaskStatusEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (185, 'AI任务状态', 'ai_task_status', '0', 'admin', now(), '', now(), 'AITaskStatusEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (620, 0, '等待中', 'WAITING', 'ai_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '等待中');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (621, 0, '进行中', 'PROCESSING', 'ai_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '进行中');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (622, 0, '已完成', 'COMPLETED', 'ai_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '已完成');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (623, 0, '失败', 'FAILED', 'ai_task_status', '', 'primary', 'N', '0', 'admin', now(), '', now(), '失败');


--  AIImageTypeEnum
INSERT INTO sys_dict_type (id, dict_name, dict_type, status, create_by, created, update_by, updated, remark)
VALUES (186, 'AI图片类型', 'ai_image_type', '0', 'admin', now(), '', now(), 'AIImageTypeEnum');

INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (625, 0, 'png', 'png', 'ai_image_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'png');
INSERT INTO sys_dict_data (id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, created, update_by, updated, remark)
VALUES (626, 0, 'jpeg', 'jpeg', 'ai_image_type', '', 'primary', 'N', '0', 'admin', now(), '', now(), 'jpeg');

-- 加入 AIGC  路由
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2070, 'AIGC', 0, 4, 'aigc', null, null, 1, 0, 'M', '0', '0', null, 'ant-design:robot-outlined', 'admin', '2025-04-18 18:31:52', 'admin', '2025-04-18 18:32:11', '');

INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2071, 'AI图生文', 2070, 0, 'pic2text', 'aigc/pic2text/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:file-text-outlined', 'admin', '2025-04-18 18:37:43', 'admin', '2025-04-18 18:38:59', '');
INSERT INTO sys_menu (id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, created, update_by, updated, remark)
VALUES (2072, 'AI生图', 2070, 1, 'text2pic', 'aigc/text2pic/index', null, 1, 0, 'C', '0', '0', null, 'ant-design:picture-outlined', 'admin', '2025-04-18 18:40:41', '', '2025-04-18 18:40:41', '');

