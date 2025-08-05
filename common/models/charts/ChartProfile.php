<?php

namespace common\models\charts;

use Yii;
use yii\base\Model;

class ChartProfile extends Model
{
    public $period_id;
    public $group_id;
    public $subject_id;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            [['period_id','group_id'], 'required'],
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