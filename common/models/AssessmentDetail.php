<?php

namespace common\models;

use Yii;
use \common\models\base\AssessmentDetail as BaseAssessmentDetail;

/**
 * This is the model class for table "tx_assessment_detail".
 */
class AssessmentDetail extends BaseAssessmentDetail
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['office_id', 'assessment_id', 'schedule_detail_id', 'participant_id', 'subject_id', 'period_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['earned_points', 'passing_score', 'passing_score_percent', 'gained_score'], 'number'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['app_version', 'quiz_title', 'quiz_type', 'username', 'time_limit', 'used_time', 'time_spent'], 'string', 'max' => 50],
            [['is_completed'], 'string', 'max' => 4],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }
    public function beforeSave($insert) {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) {
            $this->office_id   = $this->assessment->office_id;
            $this->period_id   = $this->assessment->period_id;
        }

        return true;
    }
}
