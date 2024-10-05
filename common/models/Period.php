<?php

namespace common\models;

use common\helper\LabelHelper;
use Yii;
use \common\models\base\Period as BasePeriod;

/**
 * This is the model class for table "tx_period".
 */
class Period extends BasePeriod
{

    const IS_ACTIVE_NO      = 1;
    const IS_ACTIVE_YES     = 2;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'is_active', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public static function getArrayIsActive(): array
    {
        return [
            //MASTER
            self::IS_ACTIVE_NO => Yii::t('app', 'No'),
            self::IS_ACTIVE_YES  => Yii::t('app', 'Yes'),
        ];
    }

    public static function getOneIsActive($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsActive();

            switch ($_module) {
                case ($_module == self::IS_ACTIVE_NO):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_ACTIVE_YES):
                    $returnValue = LabelHelper::getYes($arrayModule[$_module]);
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
