<?php

namespace common\models;

use Yii;
use common\helper\ExamTypeHelper;
use common\helper\LabelHelper;
use common\models\base\Assessment as BaseAssessment;

/**
 * This is the model class for table "tx_assessment".
 */
class Assessment extends BaseAssessment
{
    const SUBMISSION_STATUS_ONGOING      = 1;
    const SUBMISSION_STATUS_SUBMITTED    = 2;
    const SUBMISSION_STATUS_CANCELLED    = 3;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['evaluate_score'], 'safe'],

            [['office_id', 'schedule_id', 'schedule_detail_id', 'user_id', 'period_id', 'group_id', 'subject_id', 'question_type', 'exam_type', 'submission_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['earned_points', 'passing_score', 'passing_score_percent', 'gained_score', 'evaluate_score'], 'number'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['app_version', 'quiz_title', 'quiz_type', 'username', 'time_limit', 'used_time', 'time_spent'], 'string', 'max' => 50],
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

        if($this->gained_score > 0) {
            $this->evaluate_score = ceil(($this->earned_points / $this->gained_score) * 100);
        } else {
            $this->evaluate_score = 0;
        }

        return true;
    }

    public static function getArrayExamType(): array
    {
        return ExamTypeHelper::getArrayExamType();
    }

    public static function getOneExamType($_module = null): string
    {
        if($_module)
        {
            return ExamTypeHelper::getOneExamType($_module);
        }
        else
            return '-';
    }

    public static function getArrayQuestionTypes(): array
    {
        return ScheduleDetail::getArrayQuestionTypes();
    }

    public static function getOneQuestionType($_module = null): ?string
    {
        if($_module)
        {
            return ScheduleDetail::getOneQuestionType($_module);
        }
        else
            return '-';
    }

    public static function getArraySubmissionStatus(): array
    {
        return [
            //MASTER
            self::SUBMISSION_STATUS_ONGOING => Yii::t('app', 'Ongoing'),
            self::SUBMISSION_STATUS_SUBMITTED  => Yii::t('app', 'Submitted'),
            self::SUBMISSION_STATUS_CANCELLED => Yii::t('app', 'Ongoing'),
        ];
    }

    public static function getOneSubmissionStatus($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArraySubmissionStatus();

            switch ($_module) {
                case ($_module == self::SUBMISSION_STATUS_ONGOING):
                    $returnValue = LabelHelper::getWarning($arrayModule[$_module]);
                    break;
                case ($_module == self::SUBMISSION_STATUS_SUBMITTED):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::SUBMISSION_STATUS_CANCELLED):
                    $returnValue = LabelHelper::getDanger($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }
            return $returnValue;
        }
        else
            return '-';
    }
}
