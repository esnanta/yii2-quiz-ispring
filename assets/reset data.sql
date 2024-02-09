/**
 * Author:  Nanta Es
 * Created: Sep 24, 2023
 */

delete from tx_assessment_detail;
ALTER TABLE tx_assessment_detail AUTO_INCREMENT=0;

delete from tx_assessment;
ALTER TABLE tx_assessment AUTO_INCREMENT=0;

delete from tx_schedule_detail;
ALTER TABLE tx_schedule_detail AUTO_INCREMENT=0;

delete from tx_schedule;
ALTER TABLE tx_schedule AUTO_INCREMENT=0;

DELETE FROM tx_staff WHERE id <> 1;
ALTER TABLE tx_staff AUTO_INCREMENT=1;

DELETE FROM tx_employment WHERE id <> 1;
ALTER TABLE tx_employment AUTO_INCREMENT=1;

delete from tx_theme;
ALTER TABLE tx_theme AUTO_INCREMENT=0;

delete from tx_counter;
ALTER TABLE tx_counter AUTO_INCREMENT=0;

DELETE FROM tx_office WHERE id <> 1;
ALTER TABLE tx_office AUTO_INCREMENT=1;

DELETE FROM tx_profile WHERE user_id <> 1;
ALTER TABLE tx_profile AUTO_INCREMENT=1;

DELETE FROM tx_auth_assignment WHERE user_id <> 1;

DELETE FROM tx_user WHERE id <> 1;
ALTER TABLE tx_user AUTO_INCREMENT=1;

INSERT INTO `tx_theme` (`id`, `office_id`, `title`, `theme_type`, `content`, `asset_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`,`uuid`) VALUES
(1, 1, 'Logo Frontend Header', 1, NULL, NULL, 'Logo Frontend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(2, 1, 'Logo Frontend Footer', 2, NULL, NULL, 'Logo Frontend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(3, 1, 'Logo Backend Header', 3, NULL, NULL, 'Logo Backend Header', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(4, 1, 'Logo Backend Footer', 4, NULL, NULL, 'Logo Backend Footer', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(5, 1, 'Logo Report', 5, NULL, NULL, 'Logo Report', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(6, 1, 'Logo Invoice', 6, NULL, NULL, 'Logo Invoice', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(7, 1, 'Title', 7, NULL, NULL, 'Title', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID()),
(8, 1, 'Content', 8, NULL, NULL, 'Content', '2023-09-17 20:25:47', '2023-09-17 20:25:47', 1, 1, NULL, NULL, NULL, 0, UUID());
