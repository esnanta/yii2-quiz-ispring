<?php

namespace common\models;

use Yii;
use yii\base\Exception;

use common\helper\LabelHelper;
use common\models\base\ScheduleDetail as BaseScheduleDetail;

/**
 * This is the model class for table "tx_schedule_detail".
 */
class ScheduleDetail extends BaseScheduleDetail
{
    const QUESTION_TYPE_GENERAL      = 1;
    const QUESTION_TYPE_LITERACY     = 2;
    const QUESTION_TYPE_NUMERATION   = 3;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            //TAMBAHAN
            [['subject_id'], 'required'],

            [['office_id', 'schedule_id', 'subject_id', 'asset_id', 'question_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['remark'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @throws Exception
     */
    public function beforeSave($insert) {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) {
            $this->office_id    = $this->schedule->office_id;
        }

        return true;
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

    public static function getOneQuestionType($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayQuestionTypes();
            switch ($_module) {
                case ($_module == self::QUESTION_TYPE_GENERAL):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_LITERACY):
                    $returnValue = LabelHelper::getWarning($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_NUMERATION):
                    $returnValue = LabelHelper::getDark($arrayModule[$_module]);
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
