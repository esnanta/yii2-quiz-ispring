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
    ('index-ispring-master','index-group'),
    ('create-ispring-master','create-group'),
    ('update-ispring-master','update-group'),
    ('view-ispring-master','view-group'),
    ('delete-ispring-master','delete-group'),
    ('report-ispring-master','report-group');
/**
  MENU FOR ISPRING TRANSACTION
  01 Assessment

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
insert  into `tx_auth_item_child`(`parent`,`child`) values
('admin','index-ispring-master'),
('admin','create-ispring-master'),
('admin','update-ispring-master'),
('admin','view-ispring-master'),
('admin','delete-ispring-master'),
('admin','report-ispring-master');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('admin','index-ispring-transaction'),
('admin','create-ispring-transaction'),
('admin','update-ispring-transaction'),
('admin','view-ispring-transaction'),
('admin','delete-ispring-transaction'),
('admin','report-ispring-transaction');

/**
 * MENU FOR OWNER
 */
insert  into `tx_auth_item_child`(`parent`,`child`) values
('owner','index-ispring-master'),
('owner','create-ispring-master'),
('owner','update-ispring-master'),
('owner','view-ispring-master'),
('owner','delete-ispring-master'),
('owner','report-ispring-master');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('owner','index-ispring-transaction'),
('owner','create-ispring-transaction'),
('owner','update-ispring-transaction'),
('owner','view-ispring-transaction'),
('owner','delete-ispring-transaction'),
('owner','report-ispring-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('owner','index-master'),
('owner','create-master'),
('owner','update-master'),
('owner','view-master'),
('owner','delete-master'),
('owner','report-master');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('owner','index-transaction'),
('owner','create-transaction'),
('owner','update-transaction'),
('owner','view-transaction'),
('owner','delete-transaction'),
('owner','report-transaction');


/**
 * MENU FOR REGULER
 */
insert  into `tx_auth_item_child`(`parent`,`child`) values
('reguler','index-ispring-transaction'),
('reguler','create-ispring-transaction'),
('reguler','view-ispring-transaction'),
('reguler','report-ispring-transaction');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('reguler','index-master'),
('reguler','view-master'),
('reguler','index-ispring-master'),
('reguler','view-ispring-master'),
('reguler','report-ispring-master');