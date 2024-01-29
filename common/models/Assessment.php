<?php

namespace common\models;

use Yii;
use \common\models\base\Assessment as BaseAssessment;

/**
 * This is the model class for table "tx_assessment".
 */
class Assessment extends BaseAssessment
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'schedule_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_start', 'date_end', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 15],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
    public function beforeSave($insert) {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) {
            $this->date_start = Counter::getDataNumber(Counter::CODE_OF_SCHEDULE);
        }

        return true;
    }
}
