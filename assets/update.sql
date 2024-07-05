RENAME TABLE `tx_archive_category` TO `tx_asset_category`;
RENAME TABLE `tx_archive` TO `tx_asset`;
ALTER TABLE `tx_asset` CHANGE `archive_type` `asset_type` INT(11);
ALTER TABLE `tx_asset` CHANGE `archive_category_id`  `asset_category_id` INT(11);