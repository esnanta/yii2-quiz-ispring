<?php

namespace common\models;

use Yii;
use \common\models\base\ScheduleToken as BaseScheduleToken;

/**
 * This is the model class for table "tx_schedule_token".
 */
class ScheduleToken extends BaseScheduleToken
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['schedule_id', 'user_id', 'office_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['token_time', 'date_start', 'date_end', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['token'], 'string', 'max' => 6],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
    public function beforeSave($insert): bool
    {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) :
            $this->token_time = $this->date_start;
        endif;

        return true;
    }
}
