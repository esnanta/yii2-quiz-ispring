<?php

use yii\db\Migration;

/**
 * Class m250807_121504_insert_initial_data
 * Handles inserting initial "seed" data into the database.
 * This should be run after all table structures are created.
 */
class m250807_200103_insert_initial_data extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        // Variabel untuk menyimpan waktu eksekusi skrip
        $nowDateTime = date('Y-m-d H:i:s');
        $nowTimestamp = time();

        // ======================================================================
        // INSERTING INITIAL DATA
        // ======================================================================

        // -- Data for office
        $this->insert('{{%office}}', [
            'id' => 1,
            'unique_id' => '65a7fb0e28f7b',
            'title' => 'Daraspace',
            'phone_number' => '-',
            'email' => 'ombakrinai@gmail.com',
            'web' => 'https://daraspace.com',
            'address' => '-',
            'description' => '-',
            'created_at' => $nowDateTime,
            'updated_at' => $nowDateTime,
            'created_by' => 1,
            'updated_by' => 1,
            'verlock' => 0,
        ]);

        // -- Data for user
        $this->insert('{{%user}}', [
            'id' => 1,
            'username' => 'admin',
            'email' => 'ombakrinai@gmail.com',
            'password_hash' => '$2y$12$1OrcfbmLlEy1lFwPTNVqZ.8mdXzEZboHOM1DWaT4/8GXe5jcwR5pG',
            'auth_key' => 'e0ee8dwDplLVaGlKGZteMSqPp1ikJFQm',
            'registration_ip' => null,
            'confirmed_at' => null,
            'created_at' => $nowTimestamp,
            'updated_at' => $nowTimestamp,
            'last_login_at' => $nowTimestamp,
        ]);

        // -- Data for profile
        $this->insert('{{%profile}}', [
            'user_id' => 1,
            'name' => 'Nanta Es',
            'office_id' => null,
            'group_id' => null,
            'created_at' => $nowDateTime,
            'updated_at' => $nowDateTime,
        ]);

        // -- Data for employment
        $this->insert('{{%employment}}', [
            'id' => 1,
            'office_id' => 1,
            'title' => 'Programmer',
            'description' => '-',
            'sequence' => 1,
            'created_at' => $nowDateTime,
            'updated_at' => $nowDateTime,
            'created_by' => 1,
            'updated_by' => 1,
            'verlock' => 0,
        ]);

        // -- Data for staff
        $this->insert('{{%staff}}', [
            'id' => 1,
            'user_id' => 1,
            'office_id' => 1,
            'employment_id' => 1,
            'title' => 'Nanta Es',
            'initial' => 'Es',
            'identity_number' => '123',
            'phone_number' => '123',
            'gender_status' => 1,
            'active_status' => 1,
            'address' => '-',
            'asset_name' => '662a80f98ab73.jpg',
            'email' => 'asdf',
            'description' => '-',
            'created_at' => $nowDateTime,
            'updated_at' => $nowDateTime,
            'created_by' => 1,
            'updated_by' => 1,
            'verlock' => 0,
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        // Menghapus data secara terbalik untuk menghindari error foreign key
        $this->delete('{{%staff}}', ['id' => 1]);
        $this->delete('{{%employment}}', ['id' => 1]);
        $this->delete('{{%profile}}', ['user_id' => 1]);
        $this->delete('{{%user}}', ['id' => 1]);
        $this->delete('{{%office}}', ['id' => 1]);

        echo "m250807_121504_insert_initial_data reverted.\n";

        return true;
    }
}