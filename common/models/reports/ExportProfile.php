<?php
namespace common\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportProfile extends Model
{
    public $group_id;
    public $is_display_subject = false;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_id'], 'required'],
            [['is_display_subject'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'group_id'       => Yii::t('app', 'Group ID'),
            'is_display_subject' => Yii::t('app', 'Display Subject'),
        ];
    }
}
