<?php

use yii\db\Migration;

/**
 * Handles the creation of the rest of the application tables.
 */
class m240807_050003_create_other_tables extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        // Tables without dependencies (or dependent on tx_office)
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
        $this->addForeignKey('FK_tx_archive_category_office', '{{%asset_category}}', 'office_id', '{{%office}}', 'id');

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
        $this->addForeignKey('Fk_tx_employment_office', '{{%employment}}', 'office_id', '{{%office}}', 'id');

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
        $this->addForeignKey('Fk_group_office', '{{%group}}', 'office_id', '{{%office}}', 'id');

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
        $this->addForeignKey('Fk_period_office', '{{%period}}', 'office_id', '{{%office}}', 'id');

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
        $this->addForeignKey('Fk_room_office', '{{%room}}', 'office_id', '{{%office}}', 'id');

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
        $this->addForeignKey('Fk_subject_office', '{{%subject}}', 'office_id', '{{%office}}', 'id');

        // Tables with dependencies
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
        $this->addForeignKey('FK_tx_staff_office', '{{%staff}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_staff_employment', '{{%staff}}', 'employment_id', '{{%employment}}', 'id');

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
        $this->addForeignKey('FK_tx_archive_office', '{{%asset}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('FK_tx_archive_category', '{{%asset}}', 'asset_category_id', '{{%asset_category}}', 'id');

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
            'token' => $this->string(6)->defaultValue(null),
            'token_time' => $this->dateTime()->defaultValue(null),
            'is_asset' => $this->integer()->comment('Available or not'),
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
        $this->addForeignKey('Fk_schedule_office', '{{%schedule}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_period', '{{%schedule}}', 'period_id', '{{%period}}', 'id');
        $this->addForeignKey('Fk_schedule_group', '{{%schedule}}', 'group_id', '{{%group}}', 'id');
        $this->addForeignKey('Fk_schedule_room', '{{%schedule}}', 'room_id', '{{%room}}', 'id');
        $this->addForeignKey('Fk_schedule_staff', '{{%schedule}}', 'staff_id', '{{%staff}}', 'id');

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
        $this->addForeignKey('Fk_schedule_detail_office', '{{%schedule_detail}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_schedule_detail_schedule', '{{%schedule_detail}}', 'schedule_id', '{{%schedule}}', 'id');
        $this->addForeignKey('Fk_schedule_detail_subject', '{{%schedule_detail}}', 'subject_id', '{{%subject}}', 'id');
        $this->addForeignKey('FK_tx_schedule_detail_asset', '{{%schedule_detail}}', 'asset_id', '{{%asset}}', 'id');

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
        $this->addForeignKey('Fk_assessment_office', '{{%assessment}}', 'office_id', '{{%office}}', 'id');
        $this->addForeignKey('Fk_assessment_schedule', '{{%assessment}}', 'schedule_id', '{{%schedule}}', 'id');
        $this->addForeignKey('Fk_assessment_schedule_detail', '{{%assessment}}', 'schedule_detail_id', '{{%schedule_detail}}', 'id');
        $this->addForeignKey('tx_assessment_tx_profile_FK', '{{%assessment}}', 'user_id', '{{%profile}}', 'user_id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('Fk_assessment_period', '{{%assessment}}', 'period_id', '{{%period}}', 'id');
        $this->addForeignKey('FK_tx_assessment_group', '{{%assessment}}', 'group_id', '{{%group}}', 'id');
        $this->addForeignKey('Fk_assessment_subject', '{{%assessment}}', 'subject_id', '{{%subject}}', 'id');

        // --- Other Simple Tables ---

        $this->createTable('{{%office_media}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'media_type' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'description' => 'longtext',
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
        $this->addForeignKey('FK_tx_office_media_office', '{{%office_media}}', 'office_id', '{{%office}}', 'id');

        $this->createTable('{{%counter}}', [
            'id' => $this->primaryKey(),
            'office_id' => $this->integer()->defaultValue(null),
            'title' => $this->string(15)->notNull(),
            'counter' => $this->integer()->defaultValue(null),
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
        $this->addForeignKey('Fk_counter_office', '{{%counter}}', 'office_id', '{{%office}}', 'id');

        $this->createTable('{{%page}}', [
            'id' => $this->primaryKey(),
            'page_type' => $this->integer()->defaultValue(null),
            'title' => $this->string(100)->defaultValue(null),
            'content' => $this->text(),
            'asset_name' => $this->string(200)->defaultValue(null),
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

        $this->createTable('{{%session}}', [
            'id' => $this->char(32)->notNull(),
            'expire' => $this->integer()->defaultValue(null),
            'data' => 'LONGBLOB',
            'PRIMARY KEY(id)',
        ]);

        $this->createTable('{{%dashblock}}', [
            'id' => $this->primaryKey()->unsigned(),
            'title' => $this->string()->notNull()->defaultValue(''),
            'actions' => $this->text(),
            'weight' => $this->integer()->unsigned()->notNull()->defaultValue(0),
            'status' => $this->tinyInteger()->unsigned()->notNull()->defaultValue(1),
        ]);

        $this->createTable('{{%event}}', [
            'id' => $this->primaryKey(),
            'title' => $this->string(200)->defaultValue(null),
            'date_start' => $this->dateTime()->defaultValue(null),
            'date_end' => $this->dateTime()->defaultValue(null),
            'location' => $this->text(),
            'content' => $this->text(),
            'view_counter' => $this->integer()->defaultValue(null),
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

        $this->createTable('{{%quote}}', [
            'id' => $this->primaryKey(),
            'title' => $this->string(100)->defaultValue(null),
            'content' => $this->text(),
            'source' => $this->string(100)->defaultValue(null),
            'file_name' => $this->string(200)->defaultValue(null),
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

        $this->createTable('{{%tag}}', [
            'id' => $this->primaryKey(),
            'tag_name' => $this->string(150)->notNull(),
            'frequency' => $this->integer()->defaultValue(null),
            'uuid' => $this->string(36)->defaultValue(null),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        // Drop tables in reverse order of creation to respect foreign keys
        $this->dropTable('{{%tag}}');
        $this->dropTable('{{%quote}}');
        $this->dropTable('{{%event}}');
        $this->dropTable('{{%dashblock}}');
        $this->dropTable('{{%session}}');
        $this->dropTable('{{%page}}');
        $this->dropTable('{{%counter}}');
        $this->dropTable('{{%office_media}}');
        $this->dropTable('{{%assessment}}');
        $this->dropTable('{{%schedule_detail}}');
        $this->dropTable('{{%schedule}}');
        $this->dropTable('{{%asset}}');
        $this->dropTable('{{%staff}}');
        $this->dropTable('{{%subject}}');
        $this->dropTable('{{%room}}');
        $this->dropTable('{{%period}}');
        $this->dropTable('{{%group}}');
        $this->dropTable('{{%employment}}');
        $this->dropTable('{{%asset_category}}');
        $this->dropTable('{{%office}}');
    }


}