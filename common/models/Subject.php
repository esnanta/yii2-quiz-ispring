<?php

namespace common\models;

use common\helper\LabelHelper;
use Yii;
use \common\models\base\Subject as BaseSubject;

/**
 * This is the model class for table "tx_subject".
 */
class Subject extends BaseSubject
{
    const SUBJECT_TYPE_GENERAL      = 1;
    const SUBJECT_TYPE_LITERACY     = 2;
    const SUBJECT_TYPE_NUMERATION   = 3;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'subject_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['sequence'], 'string', 'max' => 4],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public static function getArraySubjectTypes()
    {
        return [
            //MASTER
            self::SUBJECT_TYPE_GENERAL => Yii::t('app', 'General'),
            self::SUBJECT_TYPE_LITERACY  => Yii::t('app', 'Literacy'),
            self::SUBJECT_TYPE_NUMERATION  => Yii::t('app', 'Numeration'),
        ];
    }

    public static function getOneSubjectType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArraySubjectTypes();

            switch ($_module) {
                case ($_module == self::SUBJECT_TYPE_GENERAL):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::SUBJECT_TYPE_LITERACY):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::SUBJECT_TYPE_NUMERATION):
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
	
}
