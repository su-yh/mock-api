ALTER TABLE fb_ad_material_metrics_record
    DROP KEY uni_fb_ad_material_metrics_record_combine;
ALTER TABLE fb_ad_material_metrics_record
    DROP INDEX idx_fb_ad_campaign_metrics_record_groups;
ALTER TABLE fb_ad_material_metrics_record
    DROP COLUMN creative_id;
ALTER TABLE fb_ad_material_metrics_record
    DROP COLUMN creative_name;

CREATE UNIQUE INDEX uni_fb_ad_material_metrics_record_a_a_d ON fb_ad_material_metrics_record (ad_account_id, ad_id, dates);
CREATE INDEX idx_fb_ad_material_metrics_record_a_a ON fb_ad_material_metrics_record (ad_account_id, ad_id);
