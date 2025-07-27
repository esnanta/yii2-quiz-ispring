<?php
namespace common\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportAssessment extends Model
{
    public $period_id;
    public $schedule_id;
    public $subject_id;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            [['period_id','schedule_id'], 'required'],
            [['subject_id'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'period_id'       => Yii::t('app', 'Period'),
            'schedule_id'       => Yii::t('app', 'Schedule'),
            'subject_id'        => Yii::t('app', 'Subject'),
        ];
    }
}
