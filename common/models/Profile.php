<?php

namespace common\models;

use common\helper\LabelHelper;
use Yii;
use \common\models\base\Profile as BaseProfile;

/**
 * This is the model class for table "tx_profile".
 */
class Profile extends BaseProfile
{

    const USER_TYPE_ADMIN = 1;
    const USER_TYPE_REGULAR = 2;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['office_id', 'group_id', 'user_type', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['bio'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['name', 'public_email', 'gravatar_email', 'location', 'website'], 'string', 'max' => 255],
            [['password'], 'string', 'max' => 100],
            [['gravatar_id'], 'string', 'max' => 32],
            [['timezone'], 'string', 'max' => 40],
            [['asset_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    public static function getArrayUserType(): array
    {
        return [
            //MASTER
            self::USER_TYPE_ADMIN  => Yii::t('app', 'Administrator'),
            self::USER_TYPE_REGULAR  => Yii::t('app', 'Regular'),
        ];
    }

    public static function getOneUserType($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayUserType();

            switch ($_module) {
                case ($_module == self::USER_TYPE_ADMIN):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                case ($_module == self::USER_TYPE_REGULAR):
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
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
