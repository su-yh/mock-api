

ALTER TABLE task_ad_detail
    ADD COLUMN person_account_data_id BIGINT after task_uuid;

ALTER TABLE task_ad_detail_external_asset
    ADD COLUMN person_account_data_id BIGINT after owner_task_uuid;

ALTER TABLE task_ad_detail_external_creative
    ADD COLUMN person_account_data_id BIGINT after owner_task_uuid;

ALTER TABLE task_management_ad DROP COLUMN ad_channel;
ALTER TABLE task_management_ad
    ADD COLUMN package_data_id BIGINT NOT NULL COMMENT '投放包数据id' after preview_detail_properties;
ALTER TABLE task_management_ad
    MODIFY app_id VARCHAR(64) NULL COMMENT '推广应用id';


ALTER TABLE fb_ad_campaign
    ADD COLUMN package_data_id BIGINT NOT NULL COMMENT '投放包数据id' after id;

UPDATE fb_ad_campaign AS campaign
SET package_data_id = (
    SELECT package.id
    FROM ad_package AS package
    WHERE package.channel = campaign.ad_channel
)
WHERE EXISTS (
    SELECT 0
    FROM ad_package AS package
    WHERE package.channel = campaign.ad_channel
);

ALTER TABLE fb_ad_campaign DROP COLUMN ad_channel;