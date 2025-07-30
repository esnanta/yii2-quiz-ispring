<?php

namespace common\models;

use Yii;
use yii\bootstrap5\Html;
use common\helper\LabelHelper;
use common\models\base\Participant as BaseParticipant;

/**
 * This is the model class for table "tx_participant".
 */
class Participant extends BaseParticipant
{


    const STATUS_INACTIVE = 1;
    const STATUS_ACTIVE = 2;

    /**
     * @inheritdoc
     */
    public function rules(): array
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

    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User'),
            'office_id' => Yii::t('app', 'Office'),
            'group_id' => Yii::t('app', 'Group'),
            'user_type' => Yii::t('app', 'Type'),
            'name' => Yii::t('app', 'Name'),
            'identity_number' => Yii::t('app', 'Identity'),
            'public_email' => Yii::t('app', 'Email'),
            'gravatar_email' => Yii::t('app', 'Gravatar'),
            'gravatar_id' => Yii::t('app', 'Gravatar ID'),
            'location' => Yii::t('app', 'Location'),
            'website' => Yii::t('app', 'Website'),
            'timezone' => Yii::t('app', 'Timezone'),
            'bio' => Yii::t('app', 'Bio'),
            'asset_name' => Yii::t('app', 'Asset Name'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }

    public function beforeSave($insert): bool
    {
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

    public static function getArrayStatus(): array
    {
        return [
            //MASTER
            self::STATUS_INACTIVE  => Yii::t('app', 'Offline'),
            self::STATUS_ACTIVE  => Yii::t('app', 'Online'),
        ];
    }

    public static function getOneStatus($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayStatus();

            switch ($_module) {
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
            return '-';
    }

    public function getGroupTitle(): string
    {
        return $this->group->title;
    }

    public function getUrl(): string
    {
        return Html::a($this->title, ['participant/view', 'id' => $this->id,'title'=>$this->title]);
    }

    public function getIsButtonDisabled(): string
    {
        if($this->status == self::STATUS_ACTIVE){
            return '';
        }
        else {
            return 'disabled';
        }
    }
}
