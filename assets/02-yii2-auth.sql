/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Nanta Es
 * Created: Aug 29, 2021
 */


delete from tx_auth_assignment;
delete from tx_auth_item_child;
delete from tx_auth_item;

/*Data for the table `tx_auth_item` */
/* TYPE 1 = ROLE */
insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('admin',1,'Admin',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('reguler',1,'Reguler',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('participant',1,'Participant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('guest',1,'Guest',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


/*Data for the table `tx_auth_assignment` */
/* ALOKASI ITEM KEPADA USER */
insert  into `tx_auth_assignment`(`item_name`,`user_id`,`created_at`)
values
    ('admin','1',UNIX_TIMESTAMP());


/* TYPE 2 = ITEM */
insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-master',2,'Index Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-master',2,'Create Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-master',2,'Update Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-master',2,'View Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-master',2,'Delete Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-master',2,'Report Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-transaction',2,'Index Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-transaction',2,'Create Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-transaction',2,'Update Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-transaction',2,'View Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-transaction',2,'Delete Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-transaction',2,'Report Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-asset',2,'Index Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-asset',2,'Create Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-asset',2,'Update Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-asset',2,'View Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-asset',2,'Delete Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-asset',2,'Report Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-assetcategory',2,'Index Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-assetcategory',2,'Create Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-assetcategory',2,'Update Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-assetcategory',2,'View Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-assetcategory',2,'Delete Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-assetcategory',2,'Report Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-employment',2,'Index Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-employment',2,'Create Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-employment',2,'Update Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-employment',2,'View Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-employment',2,'Delete Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-office',2,'Index Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-office',2,'Create Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-office',2,'Update Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-office',2,'View Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-office',2,'Delete Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-officemedia',2,'Index Office Media',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-officemedia',2,'Create Office Media',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-officemedia',2,'Update Office Media',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-officemedia',2,'View Office Media',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-officemedia',2,'Delete Office Media',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-profile',2,'Index Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-profile',2,'Create Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-profile',2,'Update Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-profile',2,'View Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-profile',2,'Delete Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-staff',2,'Index Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-staff',2,'Create Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-staff',2,'Update Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-staff',2,'View Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-staff',2,'Delete Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-theme',2,'Index Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-theme',2,'Create Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-theme',2,'Update Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-theme',2,'View Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-theme',2,'Delete Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());





/*Data for the table `tx_auth_item_child` */


insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-assetcategory'),
    ('create-master','create-assetcategory'),
    ('update-master','update-assetcategory'),
    ('view-master','view-assetcategory'),
    ('delete-master','delete-assetcategory'),
    ('report-master','report-assetcategory');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-employment'),
    ('create-master','create-employment'),
    ('update-master','update-employment'),
    ('view-master','view-employment'),
    ('delete-master','delete-employment');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-office'),
    ('create-master','create-office'),
    ('update-master','update-office'),
    ('view-master','view-office'),
    ('delete-master','delete-office');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-officemedia'),
    ('create-master','create-officemedia'),
    ('update-master','update-officemedia'),
    ('view-master','view-officemedia'),
    ('delete-master','delete-officemedia');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-profile'),
    ('create-master','create-profile'),
    ('update-master','update-profile'),
    ('view-master','view-profile'),
    ('delete-master','delete-profile');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-staff'),
    ('create-master','create-staff'),
    ('update-master','update-staff'),
    ('view-master','view-staff'),
    ('delete-master','delete-staff');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-theme'),
    ('create-master','create-theme'),
    ('update-master','update-theme'),
    ('view-master','view-theme'),
    ('delete-master','delete-theme');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-asset'),
    ('create-transaction','create-asset'),
    ('update-transaction','update-asset'),
    ('view-transaction','view-asset'),
    ('delete-transaction','delete-asset'),
    ('report-transaction','report-asset');


/**
 * Author:  Nanta Es
 * Created: Aug 29, 2021
 */


insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('admin','index-master'),
    ('admin','create-master'),
    ('admin','update-master'),
    ('admin','view-master'),
    ('admin','delete-master'),
    ('admin','report-master');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('admin','index-transaction'),
    ('admin','create-transaction'),
    ('admin','update-transaction'),
    ('admin','view-transaction'),
    ('admin','delete-transaction'),
    ('admin','report-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('reguler','index-transaction'),
    ('reguler','create-transaction'),
    ('reguler','update-transaction'),
    ('reguler','view-transaction'),
    ('reguler','delete-transaction'),
    ('reguler','report-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('reguler','update-profile'),
    ('reguler','view-profile');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('guest','index-asset'),
    ('guest','view-asset');


/**
 * Author:  Nanta Es
 * Created: Sep 24, 2023
 */

/**
  DAFTAR MENU
  01 Participant
  02 Room
  03 Subject
  04 Group
  05 assessment
  06 schedule
  07 schedule detail
  08 assessment detail

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
    ('index-group',2,'Index Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-group',2,'Create Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-group',2,'Update Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-group',2,'View Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-group',2,'Delete Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-group',2,'Report Group',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-period',2,'Index Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-period',2,'Create Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-period',2,'Update Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-period',2,'View Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-period',2,'Delete Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-period',2,'Report Period',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-schedule',2,'Index Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-schedule',2,'Create Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-schedule',2,'Update Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-schedule',2,'View Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-schedule',2,'Delete Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-schedule',2,'Report Schedule',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-scheduledetail',2,'Index Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-scheduledetail',2,'Create Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-scheduledetail',2,'Update Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-scheduledetail',2,'View Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-scheduledetail',2,'Delete Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-scheduledetail',2,'Report Schedule Detail',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

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


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Nanta Es
 * Created: Aug 27, 2023
 */

/**
  MENU FOR ISPRING MASTER
  01 Participant
  02 Room
  03 Subject
  04 Group
  05 Schedule
  06 Schedule Detail
 */

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-participant'),
    ('create-ispring-master','create-participant'),
    ('update-ispring-master','update-participant'),
    ('view-ispring-master','view-participant'),
    ('delete-ispring-master','delete-participant'),
    ('report-ispring-master','report-participant');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-room'),
    ('create-ispring-master','create-room'),
    ('update-ispring-master','update-room'),
    ('view-ispring-master','view-room'),
    ('delete-ispring-master','delete-room'),
    ('report-ispring-master','report-room');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-subject'),
    ('create-ispring-master','create-subject'),
    ('update-ispring-master','update-subject'),
    ('view-ispring-master','view-subject'),
    ('delete-ispring-master','delete-subject'),
    ('report-ispring-master','report-subject');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-period'),
    ('create-ispring-master','create-period'),
    ('update-ispring-master','update-period'),
    ('view-ispring-master','view-period'),
    ('delete-ispring-master','delete-period'),
    ('report-ispring-master','report-period');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-group'),
    ('create-ispring-master','create-group'),
    ('update-ispring-master','update-group'),
    ('view-ispring-master','view-group'),
    ('delete-ispring-master','delete-group'),
    ('report-ispring-master','report-group');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-schedule'),
    ('create-ispring-master','create-schedule'),
    ('update-ispring-master','update-schedule'),
    ('view-ispring-master','view-schedule'),
    ('delete-ispring-master','delete-schedule'),
    ('report-ispring-master','report-schedule');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-master','index-scheduledetail'),
    ('create-ispring-master','create-scheduledetail'),
    ('update-ispring-master','update-scheduledetail'),
    ('view-ispring-master','view-scheduledetail'),
    ('delete-ispring-master','delete-scheduledetail'),
    ('report-ispring-master','report-scheduledetail');


/**
  MENU FOR ISPRING TRANSACTION
  01 Assessment
  02 Assessment Detail

 */

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-ispring-transaction','index-assessment'),
    ('create-ispring-transaction','create-assessment'),
    ('update-ispring-transaction','update-assessment'),
    ('view-ispring-transaction','view-assessment'),
    ('delete-ispring-transaction','delete-assessment'),
    ('report-ispring-transaction','report-assessment');

/**
 * MENU FOR ADMIN
 */
insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('admin','index-ispring-master'),
    ('admin','create-ispring-master'),
    ('admin','update-ispring-master'),
    ('admin','view-ispring-master'),
    ('admin','delete-ispring-master'),
    ('admin','report-ispring-master');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('admin','index-ispring-transaction'),
    ('admin','create-ispring-transaction'),
    ('admin','update-ispring-transaction'),
    ('admin','view-ispring-transaction'),
    ('admin','delete-ispring-transaction'),
    ('admin','report-ispring-transaction');

/**
 * MENU FOR OWNER
 */
insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('owner','index-ispring-master'),
    ('owner','create-ispring-master'),
    ('owner','update-ispring-master'),
    ('owner','view-ispring-master'),
    ('owner','delete-ispring-master'),
    ('owner','report-ispring-master');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('owner','index-ispring-transaction'),
    ('owner','create-ispring-transaction'),
    ('owner','update-ispring-transaction'),
    ('owner','view-ispring-transaction'),
    ('owner','delete-ispring-transaction'),
    ('owner','report-ispring-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('owner','index-master'),
    ('owner','create-master'),
    ('owner','update-master'),
    ('owner','view-master'),
    ('owner','delete-master'),
    ('owner','report-master');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('owner','index-transaction'),
    ('owner','create-transaction'),
    ('owner','update-transaction'),
    ('owner','view-transaction'),
    ('owner','delete-transaction'),
    ('owner','report-transaction');


/**
 * MENU FOR REGULER
 */
insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('reguler','index-ispring-transaction'),
    ('reguler','create-ispring-transaction'),
    ('reguler','view-ispring-transaction'),
    ('reguler','report-ispring-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('reguler','index-master'),
    ('reguler','view-master'),
    ('reguler','index-ispring-master'),
    ('reguler','view-ispring-master'),
    ('reguler','report-ispring-master');