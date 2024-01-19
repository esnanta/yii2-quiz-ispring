<?php

namespace backend\models;

use Yii;
use \backend\models\base\ScheduleDetail as BaseScheduleDetail;

/**
 * This is the model class for table "tx_schedule_detail".
 */
class ScheduleDetail extends BaseScheduleDetail
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'schedule_id', 'participant_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['remark'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
