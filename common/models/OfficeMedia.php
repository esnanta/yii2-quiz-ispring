<?php

namespace common\models;

use Yii;
use common\models\base\OfficeMedia as BaseOfficeMedia;
use common\helper\LabelHelper;

/**
 * This is the model class for table "tx_office_media".
 */
class OfficeMedia extends BaseOfficeMedia
{
    const MEDIA_TYPE_LOGO_LEFT  = 1;
    const MEDIA_TYPE_LOGO_RIGHT = 2;
    const MEDIA_TYPE_SOCIAL     = 11;
    const MEDIA_TYPE_LINK       = 12;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'media_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public static function getArrayMediaType(): array
    {
        return [
            //MASTER
            self::MEDIA_TYPE_LOGO_LEFT  => Yii::t('app', 'Left Logo') ,
            self::MEDIA_TYPE_LOGO_RIGHT => Yii::t('app', 'Right Logo'),
            self::MEDIA_TYPE_SOCIAL     => Yii::t('app', 'Social'),
            self::MEDIA_TYPE_LINK       => Yii::t('app', 'Link'),
        ];
    }

    public static function getOneMediaType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayMediaType();

            switch ($_module) {
                case ($_module == self::MEDIA_TYPE_LOGO_LEFT):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::MEDIA_TYPE_LOGO_RIGHT):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::MEDIA_TYPE_SOCIAL):
                    $returnValue = LabelHelper::getDanger($arrayModule[$_module]);
                    break;
                case ($_module == self::MEDIA_TYPE_LINK):
                    $returnValue = LabelHelper::getWarning($arrayModule[$_module]);
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
