<?php

use yii\db\Migration;

/**
 * Handles the creation of ALL application tables.
 * This is the final, complete, and corrected version with all columns from the SQL dump.
 */
class m250807_200101_create_all_tables extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        // ======================================================================
        // 1. BUAT SEMUA TABEL DENGAN SEMUA KOLOMNYA
        // ======================================================================

        $this->createTable('{{%user}}', [
            'id' => $this->primaryKey(),
            'username' => $this->string()->notNull()->unique(),
            'email' => $this->string()->notNull()->unique(),
            'password_hash' => $this->string(60)->notNull(),
            'auth_key' => $this->string(32)->notNull(),
            'unconfirmed_email' => $this->string()->defaultValue(null),
            'registration_ip' => $this->string(45)->defaultValue(null),
            'flags' => $this->integer()->notNull()->defaultValue(0),
            'confirmed_at' => $this->integer()->defaultValue(null),
            'blocked_at' => $this->integer()->defaultValue(null),
            'created_at' => $this->integer()->notNull(),
            'updated_at' => $this->integer()->notNull(),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'last_login_at' => $this->integer()->defaultValue(null),
            'auth_tf_key' => $this->string(16)->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'auth_tf_enabled' => $this->boolean()->defaultValue(false),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%office}}', [
            'id' => $this->primaryKey(),
            'unique_id' => $this->string(15)->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'phone_number' => $this->string(100)->defaultValue(null),
            'fax_number' => $this->string(100)->defaultValue(null),
            'email' => $this->string(100)->defaultValue(null),
            'web' => $this->string(100)->defaultValue(null),
            'address' => $this->string(100)->defaultValue(null),
            'latitude' => $this->string(100)->defaultValue(null),
            'longitude' => $this->string(100)->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%auth_rule}}', [
            'name' => $this->string(64)->notNull(),
            'data' => $this->binary(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
            'PRIMARY KEY(name)',
        ]);

        $this->createTable('{{%auth_item}}', [
            'name' => $this->string(64)->notNull(),
            'type' => $this->smallInteger()->notNull(),
            'description' => $this->text(),
            'rule_name' => $this->string(64),
            'data' => $this->binary(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
            'PRIMARY KEY(name)',
        ]);

        $this->createTable('{{%auth_item_child}}', [
            'parent' => $this->string(64)->notNull(),
            'child' => $this->string(64)->notNull(),
            'PRIMARY KEY(parent, child)',
        ]);

        $this->createTable('{{%auth_assignment}}', [
            'item_name' => $this->string(64)->notNull(),
            'user_id' => $this->string(64)->notNull(),
            'created_at' => $this->integer(),
            'PRIMARY KEY(item_name, user_id)',
        ]);

        $this->createTable('{{%social_account}}', [
            'id' => $this->primaryKey(),
            'user_id' => $this->integer()->defaultValue(null),
            'provider' => $this->string()->notNull(),
            'client_id' => $this->string()->notNull(),
            'code' => $this->string(32)->unique()->defaultValue(null),
            'email' => $this->string()->defaultValue(null),
            'username' => $this->string()->defaultValue(null),
            'data' => $this->text(),
            'created_at' => $this->integer()->defaultValue(null),
        ]);

        $this->createTable('{{%asset_category}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(200)->defaultValue(null),
            'sequence' => $this->integer()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%asset}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'is_visible' => $this->integer()->defaultValue(null),
            'asset_type' => $this->integer()->defaultValue(null),
            'asset_category_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(200)->defaultValue(null),
            'date_issued' => $this->date()->defaultValue(null),
            'asset_name' => $this->string(200)->defaultValue(null),
            'asset_url' => $this->string(500)->defaultValue(null),
            'size' => $this->integer()->defaultValue(null),
            'mime_type' => $this->string(100)->defaultValue(null),
            'view_counter' => $this->integer()->defaultValue(null),
            'download_counter' => $this->integer()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%employment}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'description' => $this->text(),
            'sequence' => $this->tinyInteger()->defaultValue(null),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%staff}}', [
            'id' => $this->primaryKey(),
            'user_id' => $this->integer()->defaultValue(null),
            'office_id' => $this->integer()->defaultValue(null),
            'employment_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'initial' => $this->string(10)->defaultValue(null),
            'identity_number' => $this->string(100)->defaultValue(null),
            'phone_number' => $this->string(50)->defaultValue(null),
            'gender_status' => $this->integer()->defaultValue(null),
            'active_status' => $this->integer()->defaultValue(null),
            'address' => $this->text(),
            'asset_name' => $this->string(200)->defaultValue(null),
            'email' => $this->string(100)->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%group}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'sequence' => $this->tinyInteger()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%profile}}', [
            'user_id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'group_id' => $this->integer()->defaultValue(null),
            'user_type' => $this->integer()->defaultValue(null),
            'name' => $this->string()->defaultValue(null),
            'password' => $this->string(100)->defaultValue(null),
            'public_email' => $this->string()->defaultValue(null),
            'gravatar_email' => $this->string()->defaultValue(null),
            'gravatar_id' => $this->string(32)->defaultValue(null),
            'location' => $this->string()->defaultValue(null),
            'website' => $this->string()->defaultValue(null),
            'timezone' => $this->string(40)->defaultValue(null),
            'bio' => $this->text(),
            'asset_name' => $this->string(200)->defaultValue(null),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->bigInteger()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%period}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'is_active' => $this->integer()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%room}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'sequence' => $this->tinyInteger()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%subject}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'sequence' => $this->tinyInteger()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%schedule}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'period_id' => $this->integer()->defaultValue(null),
            'group_id' => $this->integer()->defaultValue(null),
            'room_id' => $this->integer()->defaultValue(null),
            'staff_id' => $this->integer()->defaultValue(null),
            'exam_type' => $this->integer()->defaultValue(null),
            'date_start' => $this->dateTime()->defaultValue(null),
            'date_end' => $this->dateTime()->defaultValue(null),
            'is_asset_available' => $this->integer()->comment('Available or not'),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%schedule_detail}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'schedule_id' => $this->integer()->defaultValue(null),
            'subject_id' => $this->integer()->defaultValue(null),
            'asset_id' => $this->integer()->defaultValue(null),
            'question_type' => $this->integer()->defaultValue(null),
            'remark' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%schedule_token}}', [
            'id' => $this->primaryKey(),
            'schedule_id' => $this->integer()->defaultValue(null),
            'user_id' => $this->integer()->defaultValue(null),
            'office_id' => $this->integer()->defaultValue(null),
            'token' => $this->string(6)->defaultValue(null),
            'token_time' => $this->dateTime()->defaultValue(null),
            'date_start' => $this->dateTime()->defaultValue(null),
            'date_end' => $this->dateTime()->defaultValue(null),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%assessment}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'schedule_id' => $this->integer()->defaultValue(null),
            'schedule_detail_id' => $this->integer()->defaultValue(null),
            'user_id' => $this->integer()->defaultValue(null),
            'period_id' => $this->integer()->defaultValue(null),
            'group_id' => $this->integer()->defaultValue(null),
            'subject_id' => $this->integer()->defaultValue(null),
            'question_type' => $this->integer()->defaultValue(null),
            'exam_type' => $this->integer()->defaultValue(null),
            'app_version' => $this->string(50)->defaultValue(null),
            'earned_points' => $this->decimal(18, 2)->defaultValue(null),
            'passing_score' => $this->decimal(18, 2)->defaultValue(null),
            'passing_score_percent' => $this->decimal(18, 2)->defaultValue(null),
            'gained_score' => $this->decimal(18, 2)->defaultValue(null),
            'evaluate_score' => $this->decimal(18, 2)->comment('(earn/gain)*100'),
            'quiz_title' => $this->string(50)->defaultValue(null),
            'quiz_type' => $this->string(50)->defaultValue(null),
            'username' => $this->string(50)->defaultValue(null),
            'time_limit' => $this->string(50)->defaultValue(null),
            'used_time' => $this->string(50)->defaultValue(null),
            'time_spent' => $this->string(50)->defaultValue(null),
            'submission_status' => $this->integer()->defaultValue(null),
            'token' => $this->string(6)->defaultValue(null),
            'created_at' => $this->dateTime()->defaultValue(null),
            'updated_at' => $this->dateTime()->defaultValue(null),
            'created_by' => $this->integer()->defaultValue(null),
            'updated_by' => $this->integer()->defaultValue(null),
            'is_deleted' => $this->integer()->defaultValue(null),
            'deleted_at' => $this->dateTime()->defaultValue(null),
            'deleted_by' => $this->integer()->defaultValue(null),
            'verlock' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);

        $this->createTable('{{%counter}}', [ 'id' => $this->primaryKey(), 'office_id' => $this->integer()->defaultValue(null), 'title' => $this->string(15)->notNull(), 'counter' => $this->integer()->defaultValue(null), 'created_at' => $this->dateTime()->defaultValue(null), 'updated_at' => $this->dateTime()->defaultValue(null), 'created_by' => $this->integer()->defaultValue(null), 'updated_by' => $this->integer()->defaultValue(null), 'is_deleted' => $this->integer()->defaultValue(null), 'deleted_at' => $this->dateTime()->defaultValue(null), 'deleted_by' => $this->integer()->defaultValue(null), 'verlock' => $this->bigInteger()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null), ]);
        $this->createTable('{{%office_media}}', [ 'id' => $this->primaryKey(), 'office_id' => $this->integer()->defaultValue(null), 'media_type' => $this->integer()->defaultValue(null), 'title' => $this->string(100)->defaultValue(null), 'description' => 'longtext', 'created_at' => $this->dateTime()->defaultValue(null), 'updated_at' => $this->dateTime()->defaultValue(null), 'created_by' => $this->integer()->defaultValue(null), 'updated_by' => $this->integer()->defaultValue(null), 'is_deleted' => $this->integer()->defaultValue(null), 'deleted_at' => $this->dateTime()->defaultValue(null), 'deleted_by' => $this->integer()->defaultValue(null), 'verlock' => $this->bigInteger()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null), ]);
        $this->createTable('{{%page}}', [ 'id' => $this->primaryKey(), 'page_type' => $this->integer()->defaultValue(null), 'title' => $this->string(100)->defaultValue(null), 'content' => $this->text(), 'asset_name' => $this->string(200)->defaultValue(null), 'description' => $this->text(), 'created_at' => $this->dateTime()->defaultValue(null), 'updated_at' => $this->dateTime()->defaultValue(null), 'created_by' => $this->integer()->defaultValue(null), 'updated_by' => $this->integer()->defaultValue(null), 'is_deleted' => $this->integer()->defaultValue(null), 'deleted_at' => $this->dateTime()->defaultValue(null), 'deleted_by' => $this->integer()->defaultValue(null), 'verlock' => $this->bigInteger()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null), ]);
        $this->createTable('{{%dashblock}}', ['id' => $this->primaryKey()->unsigned(), 'title' => $this->string()->notNull()->defaultValue(''), 'actions' => $this->text(), 'weight' => $this->integer()->unsigned()->notNull()->defaultValue(0), 'status' => $this->tinyInteger()->unsigned()->notNull()->defaultValue(1),]);
        $this->createTable('{{%event}}', ['id' => $this->primaryKey(), 'title' => $this->string(200)->defaultValue(null), 'date_start' => $this->dateTime()->defaultValue(null), 'date_end' => $this->dateTime()->defaultValue(null), 'location' => $this->text(), 'content' => $this->text(), 'view_counter' => $this->integer()->defaultValue(null), 'description' => $this->text(), 'created_at' => $this->dateTime()->defaultValue(null), 'updated_at' => $this->dateTime()->defaultValue(null), 'created_by' => $this->integer()->defaultValue(null), 'updated_by' => $this->integer()->defaultValue(null), 'is_deleted' => $this->integer()->defaultValue(null), 'deleted_at' => $this->dateTime()->defaultValue(null), 'deleted_by' => $this->integer()->defaultValue(null), 'verlock' => $this->bigInteger()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null),]);
        $this->createTable('{{%quote}}', ['id' => $this->primaryKey(), 'title' => $this->string(100)->defaultValue(null), 'content' => $this->text(), 'source' => $this->string(100)->defaultValue(null), 'file_name' => $this->string(200)->defaultValue(null), 'description' => $this->text(), 'created_at' => $this->dateTime()->defaultValue(null), 'updated_at' => $this->dateTime()->defaultValue(null), 'created_by' => $this->integer()->defaultValue(null), 'updated_by' => $this->integer()->defaultValue(null), 'is_deleted' => $this->integer()->defaultValue(null), 'deleted_at' => $this->dateTime()->defaultValue(null), 'deleted_by' => $this->integer()->defaultValue(null), 'verlock' => $this->bigInteger()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null),]);
        $this->createTable('{{%session}}', ['id' => $this->char(32)->notNull(), 'expire' => $this->integer(), 'data' => 'LONGBLOB', 'PRIMARY KEY(id)',]);
        $this->createTable('{{%tag}}', ['id' => $this->primaryKey(), 'tag_name' => $this->string(150)->notNull(), 'frequency' => $this->integer()->defaultValue(null), 'uuid' => $this->string(36)->defaultValue(null),]);

        // ======================================================================
        // 2. BUAT SEMUA FOREIGN KEY SETELAH SEMUA TABEL ADA
        // ======================================================================
        $this->addForeignKey('fk-auth_item-rule_name', '{{%auth_item}}', 'rule_name', '{{%auth_rule}}', 'name', 'SET NULL', 'CASCADE');
        $this->addForeignKey('fk-auth_item_child-parent', '{{%auth_item_child}}', 'parent', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-auth_item_child-child', '{{%auth_item_child}}', 'child', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-auth_assignment-item_name', '{{%auth_assignment}}', 'item_name', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_social_account_user', '{{%social_account}}', 'user_id', '{{%user}}', 'id', 'CASCADE');
        $this->addForeignKey('FK_tx_archive_category_office', '{{%asset_category}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_archive_office', '{{%asset}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_archive_category', '{{%asset}}', 'asset_category_id', '{{%asset_category}}', 'id');
        $this->addForeignKey('Fk_tx_employment_office', '{{%employment}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_staff_office', '{{%staff}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_staff_employment', '{{%staff}}', 'employment_id', '{{%employment}}', 'id');
        $this->addForeignKey('Fk_group_office', '{{%group}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('fk-profile-user', '{{%profile}}', 'user_id', '{{%user}}', 'id', 'CASCADE');
        $this->addForeignKey('tx_profile_tx_office_FK', '{{%profile}}', 'office_id', '{{%office}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('tx_profile_tx_group_FK', '{{%profile}}', 'group_id', '{{%group}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('Fk_period_office', '{{%period}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_room_office', '{{%room}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_subject_office', '{{%subject}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_office', '{{%schedule}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_period', '{{%schedule}}', 'period_id', '{{%period}}', 'id');
        $this->addForeignKey('Fk_schedule_group', '{{%schedule}}', 'group_id', '{{%group}}', 'id');
        $this->addForeignKey('Fk_schedule_room', '{{%schedule}}', 'room_id', '{{%room}}', 'id');
        $this->addForeignKey('Fk_schedule_staff', '{{%schedule}}', 'staff_id', '{{%staff}}', 'id');
        $this->addForeignKey('Fk_schedule_detail_office', '{{%schedule_detail}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_detail_schedule', '{{%schedule_detail}}', 'schedule_id', '{{%schedule}}', 'id');
        $this->addForeignKey('Fk_schedule_detail_subject', '{{%schedule_detail}}', 'subject_id', '{{%subject}}', 'id');
        $this->addForeignKey('FK_tx_schedule_detail_asset', '{{%schedule_detail}}', 'asset_id', '{{%asset}}', 'id');
        $this->addForeignKey('Fk_schedule_token_office', '{{%schedule_token}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_token_schedule', '{{%schedule_token}}', 'schedule_id', '{{%schedule}}', 'id');
        $this->addForeignKey('Fk_schedule_token_user', '{{%schedule_token}}', 'user_id', '{{%user}}', 'id');
        $this->addForeignKey('Fk_assessment_office', '{{%assessment}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_assessment_schedule', '{{%assessment}}', 'schedule_id', '{{%schedule}}', 'id');
        $this->addForeignKey('Fk_assessment_schedule_detail', '{{%assessment}}', 'schedule_detail_id', '{{%schedule_detail}}', 'id');
        $this->addForeignKey('tx_assessment_tx_profile_FK', '{{%assessment}}', 'user_id', '{{%profile}}', 'user_id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('Fk_assessment_period', '{{%assessment}}', 'period_id', '{{%period}}', 'id');
        $this->addForeignKey('FK_tx_assessment_group', '{{%assessment}}', 'group_id', '{{%group}}', 'id');
        $this->addForeignKey('Fk_assessment_subject', '{{%assessment}}', 'subject_id', '{{%subject}}', 'id');
        $this->addForeignKey('Fk_counter_office', '{{%counter}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_office_media_office', '{{%office_media}}', 'office_id', '{{%office}}', 'id');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        // Drop semua tabel dalam urutan terbalik untuk menghindari error FK
        $this->dropTable('{{%assessment}}');
        $this->dropTable('{{%schedule_token}}');
        $this->dropTable('{{%schedule_detail}}');
        $this->dropTable('{{%schedule}}');
        $this->dropTable('{{%profile}}');
        $this->dropTable('{{%staff}}');
        $this->dropTable('{{%asset}}');
        $this->dropTable('{{%asset_category}}');
        $this->dropTable('{{%employment}}');
        $this->dropTable('{{%subject}}');
        $this->dropTable('{{%room}}');
        $this->dropTable('{{%period}}');
        $this->dropTable('{{%group}}');
        $this->dropTable('{{%counter}}');
        $this->dropTable('{{%office_media}}');
        $this->dropTable('{{%office}}');
        $this->dropTable('{{%social_account}}');
        $this->dropTable('{{%auth_assignment}}');
        $this->dropTable('{{%auth_item_child}}');
        $this->dropTable('{{%auth_item}}');
        $this->dropTable('{{%auth_rule}}');
        $this->dropTable('{{%user}}');
        $this->dropTable('{{%tag}}');
        $this->dropTable('{{%session}}');
        $this->dropTable('{{%quote}}');
        $this->dropTable('{{%page}}');
        $this->dropTable('{{%event}}');
        $this->dropTable('{{%dashblock}}');
    }
}