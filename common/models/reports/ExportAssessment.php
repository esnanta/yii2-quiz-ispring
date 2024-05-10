<?php
namespace common\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportAssessment extends Model
{
    public $schedule_id;
    public $subject_id;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['schedule_id'], 'required'],
            [['subject_id'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'schedule_id'       => Yii::t('app', 'Schedule'),
            'subject_id'        => Yii::t('app', 'Subject'),
        ];
    }
}
