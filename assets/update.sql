/**
 * Author:  Nanta Es
 * Created: Oktober 06, 2024
 */

ALTER TABLE `tx_schedule_detail`
    ADD COLUMN `asset_id` INTEGER(11) DEFAULT NULL AFTER `subject_id`;

ALTER TABLE `tx_schedule_detail` ADD CONSTRAINT `FK_tx_schedule_detail_asset`
    FOREIGN KEY (`asset_id`) REFERENCES `tx_asset`(`id`)
        ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_schedule_detail` DROP `asset_name`;