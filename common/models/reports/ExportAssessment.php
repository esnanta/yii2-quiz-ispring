<?php
namespace common\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportAssessment extends Model
{
    public $assessment_id;
    public $subject_id;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['assessment_id'], 'required'],
            [['subject_id'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'assessment_id'       => Yii::t('app', 'Assessment'),
            'subject_id'        => Yii::t('app', 'Subject'),
        ];
    }
}
