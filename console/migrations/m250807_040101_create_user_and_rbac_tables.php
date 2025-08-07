<?php

use yii\db\Migration;

/**
 * Handles the creation of tables for User and RBAC system.
 */
class m240807_050001_create_user_and_rbac_tables extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        // Tabel User
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

        // Tabel Profile
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

        $this->addForeignKey('fk-profile-user', '{{%profile}}', 'user_id', '{{%user}}', 'id', 'CASCADE');

        // Tabel Social Account
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
        $this->createIndex('idx-social_account-provider_client_id', '{{%social_account}}', ['provider', 'client_id'], true);
        $this->addForeignKey('fk-social_account-user', '{{%social_account}}', 'user_id', '{{%user}}', 'id', 'CASCADE');

        // Tabel-tabel RBAC
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
        $this->createIndex('idx-auth_item-type', '{{%auth_item}}', 'type');
        $this->addForeignKey('fk-auth_item-rule_name', '{{%auth_item}}', 'rule_name', '{{%auth_rule}}', 'name', 'SET NULL', 'CASCADE');

        $this->createTable('{{%auth_item_child}}', [
            'parent' => $this->string(64)->notNull(),
            'child' => $this->string(64)->notNull(),
            'PRIMARY KEY(parent, child)',
        ]);
        $this->addForeignKey('fk-auth_item_child-parent', '{{%auth_item_child}}', 'parent', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-auth_item_child-child', '{{%auth_item_child}}', 'child', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');

        $this->createTable('{{%auth_assignment}}', [
            'item_name' => $this->string(64)->notNull(),
            'user_id' => $this->string(64)->notNull(),
            'created_at' => $this->integer(),
            'PRIMARY KEY(item_name, user_id)',
        ]);
        $this->addForeignKey('fk-auth_assignment-item_name', '{{%auth_assignment}}', 'item_name', '{{%auth_item}}', 'name', 'CASCADE', 'CASCADE');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%auth_assignment}}');
        $this->dropTable('{{%auth_item_child}}');
        $this->dropTable('{{%auth_item}}');
        $this->dropTable('{{%auth_rule}}');
        $this->dropTable('{{%social_account}}');
        $this->dropTable('{{%profile}}');
        $this->dropTable('{{%user}}');
    }
}