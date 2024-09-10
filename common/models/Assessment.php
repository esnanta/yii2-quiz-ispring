<?php

namespace common\models;

use common\helper\ExamTypeHelper;
use common\helper\LabelHelper;
use Yii;
use \common\models\base\Assessment as BaseAssessment;

/**
 * This is the model class for table "tx_assessment".
 */
class Assessment extends BaseAssessment
{
    const QUESTION_TYPE_GENERAL      = ScheduleDetail::QUESTION_TYPE_GENERAL;
    const QUESTION_TYPE_LITERACY     = ScheduleDetail::QUESTION_TYPE_LITERACY;
    const QUESTION_TYPE_NUMERATION   = ScheduleDetail::QUESTION_TYPE_NUMERATION;

    const WORK_STATUS_OFFLINE      = 1;
    const WORK_STATUS_ONGOING      = 2;
    const WORK_STATUS_SUBMITTED    = 3;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['evaluate_score'], 'safe'],

            [['office_id', 'schedule_id', 'schedule_detail_id', 'participant_id', 'period_id', 'group_id', 'subject_id', 'question_type', 'exam_type', 'work_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['earned_points', 'passing_score', 'passing_score_percent', 'gained_score'], 'number'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['app_version', 'quiz_title', 'quiz_type', 'username', 'time_limit', 'used_time', 'time_spent'], 'string', 'max' => 50],
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
            $this->work_status = $this::WORK_STATUS_ONGOING;
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
        return [
            //MASTER
            self::QUESTION_TYPE_GENERAL => Yii::t('app', 'General'),
            self::QUESTION_TYPE_LITERACY  => Yii::t('app', 'Literacy'),
            self::QUESTION_TYPE_NUMERATION  => Yii::t('app', 'Numeration'),
        ];
    }

    public static function getOneQuestionType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayQuestionTypes();

            switch ($_module) {
                case ($_module == self::QUESTION_TYPE_GENERAL):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_LITERACY):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_NUMERATION):
                    $returnValue = LabelHelper::getDanger($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
    }

    public static function getArrayWorkStatus()
    {
        return [
            //MASTER
            self::WORK_STATUS_OFFLINE => Yii::t('app', 'Offline'),
            self::WORK_STATUS_ONGOING => Yii::t('app', 'Ongoing'),
            self::WORK_STATUS_SUBMITTED  => Yii::t('app', 'Submitted'),
        ];
    }

    public static function getOneWorkStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayWorkStatus();

            switch ($_module) {
                case ($_module == self::WORK_STATUS_OFFLINE):
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
                    break;
                case ($_module == self::WORK_STATUS_ONGOING):
                    $returnValue = LabelHelper::getWarning($arrayModule[$_module]);
                    break;
                case ($_module == self::WORK_STATUS_SUBMITTED):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
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
