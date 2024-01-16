/**
 * Author:  Nanta Es
 * Created: Sep 24, 2023
 */

/**
  DAFTAR MENU
  01 Participant
  02 Room
  03 Subject
  04 assessment

  xx Ispring Master
  yy Ispring Transaction
 */


insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('owner',1,'Company Owner',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-participant',2,'Index Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-participant',2,'Create Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-participant',2,'Update Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-participant',2,'View Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-participant',2,'Delete Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-participant',2,'Report Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-room',2,'Index Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-room',2,'Create Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-room',2,'Update Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-room',2,'View Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-room',2,'Delete Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-room',2,'Report Room',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-subject',2,'Index Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-subject',2,'Create Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-subject',2,'Update Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-subject',2,'View Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-subject',2,'Delete Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-subject',2,'Report Subject',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-assessment',2,'Index Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-assessment',2,'Create Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-assessment',2,'Update Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-assessment',2,'View Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-assessment',2,'Delete Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-assessment',2,'Report Assessment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-ispring-master',2,'Index Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-ispring-master',2,'Create Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-ispring-master',2,'Update Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-ispring-master',2,'View Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-ispring-master',2,'Delete Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-ispring-master',2,'Report Ispring Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-ispring-transaction',2,'Index Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-ispring-transaction',2,'Create Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-ispring-transaction',2,'Update Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-ispring-transaction',2,'View Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-ispring-transaction',2,'Delete Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-ispring-transaction',2,'Report Ispring Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());
