<?php
namespace common\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportParticipant extends Model
{
    public $group_id;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_id'], 'required'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'group_id'       => Yii::t('app', 'Group ID'),
        ];
    }
}
