<?php

namespace common\models;

use Yii;
use \common\models\base\Office as BaseOffice;

/**
 * This is the model class for table "tx_office".
 */
class Office extends BaseOffice
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['user_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['unique_id'], 'string', 'max' => 15],
            [['title', 'phone_number', 'fax_number', 'email', 'web', 'address', 'latitude', 'longitude', 'facebook', 'google_plus', 'instagram', 'twitter'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public function beforeSave($insert): bool
    {
        if ($this->isNewRecord) {
            $this->unique_id    = uniqid();
        }
        elseif ($this->unique_id == null){
            $this->unique_id    = uniqid();
        }
        return parent::beforeSave($insert);
    }
	
}
