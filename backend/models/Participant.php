<?php

namespace backend\models;

use common\helper\LabelHelper;
use Yii;
use \backend\models\base\Participant as BaseParticipant;
use yii\helpers\FileHelper;

/**
 * This is the model class for table "tx_participant".
 */
class Participant extends BaseParticipant
{


    const STATUS_DELETED = 1;
    const STATUS_INACTIVE = 2;
    const STATUS_ACTIVE = 3;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'group_id', 'status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['last_login_at', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title', 'identity_number', 'email'], 'string', 'max' => 100],
            [['username'], 'string', 'max' => 50],
            [['password'], 'string', 'max' => 10],
            [['auth_key'], 'string', 'max' => 32],
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
            $this->username     = 'U'.$this->identity_number;
            $this->status       = self::STATUS_INACTIVE;
            $this->password     = substr(str_shuffle(MD5(microtime())), 0, 5);
        }

        return true;
    }

    public static function getArrayStatus()
    {
        return [
            //MASTER
            self::STATUS_DELETED => Yii::t('app', 'Deleted'),
            self::STATUS_INACTIVE  => Yii::t('app', 'Inactive'),
            self::STATUS_ACTIVE  => Yii::t('app', 'Active'),
        ];
    }

    public static function getOneStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayStatus();

            switch ($_module) {
                case ($_module == self::STATUS_DELETED):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                case ($_module == self::STATUS_ACTIVE):
                    $returnValue = LabelHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::STATUS_INACTIVE):
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
    }

    public function getGroupTitle(): string
    {
        return $this->group->title;
    }
}
