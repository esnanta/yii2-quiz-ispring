<?php

namespace common\models;

use Yii;
use \common\models\base\Schedule as BaseSchedule;

/**
 * This is the model class for table "tx_schedule".
 */
class Schedule extends BaseSchedule
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['group_id', 'room_id','date_start','date_end'], 'required'],

            [['office_id', 'period_id', 'group_id', 'room_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_start', 'date_end', 'token_time', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['token'], 'string', 'max' => 6],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }
    public function beforeSave($insert): bool
    {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) :
            $this->title = Counter::getDataNumber(Counter::CODE_OF_SCHEDULE);
            $this->token = substr(uniqid('', true), -6);
        endif;

        if(empty($this->token_time)):
            $this->token_time = $this->date_start;
        endif;

        return true;
    }

    public function getToken(){

    }
}
