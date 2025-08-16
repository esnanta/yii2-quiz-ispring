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
            [['office_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['token_time', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['token'], 'string', 'max' => 6],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
