<?php

namespace common\models;

use Yii;
use \common\models\base\Profile as BaseProfile;

/**
 * This is the model class for table "tx_profile".
 */
class Profile extends BaseProfile
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'group_id', 'user_type', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['bio'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['name', 'public_email', 'gravatar_email', 'location', 'website'], 'string', 'max' => 255],
            [['identity_number'], 'string', 'max' => 100],
            [['gravatar_id'], 'string', 'max' => 32],
            [['timezone'], 'string', 'max' => 40],
            [['asset_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
