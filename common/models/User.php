<?php

namespace common\models;

use Yii;
use \common\models\base\User as BaseUser;

/**
 * This is the model class for table "tx_user".
 */
class User extends BaseUser
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['username', 'email', 'password_hash', 'auth_key', 'created_at', 'updated_at'], 'required'],
            [['flags', 'confirmed_at', 'blocked_at', 'created_at', 'updated_at', 'created_by', 'updated_by', 'last_login_at', 'deleted_by', 'verlock'], 'integer'],
            [['deleted_at'], 'safe'],
            [['username', 'email', 'unconfirmed_email'], 'string', 'max' => 255],
            [['password_hash'], 'string', 'max' => 60],
            [['auth_key'], 'string', 'max' => 32],
            [['registration_ip'], 'string', 'max' => 45],
            [['auth_tf_key'], 'string', 'max' => 16],
            [['auth_tf_enabled'], 'string', 'max' => 1],
            [['uuid'], 'string', 'max' => 36],
            [['email'], 'unique'],
            [['username'], 'unique'],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
    public static function getName($_id){ 
        //https://www.yiiframework.com/doc/guide/2.0/en/caching-data
        //$db = Yii::$app->db;// or Category::getDb()
        $value = User::getDb()->cache(function () use ($_id) {
            $model = User::find()->where(['id' => $_id])->one();
            return $model->username;
        });       

       return $value;           
        
    } 
}
