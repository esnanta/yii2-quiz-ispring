<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_assessment_detail".
 *
 * @property integer $id
 * @property integer $office_id
 * @property integer $assessment_id
 * @property integer $schedule_detail_id
 * @property integer $participant_id
 * @property integer $subject_id
 * @property integer $period_id
 * @property string $app_version
 * @property string $earned_points
 * @property string $passing_score
 * @property string $passing_score_percent
 * @property string $gained_score
 * @property string $quiz_title
 * @property string $quiz_type
 * @property string $username
 * @property string $time_limit
 * @property string $used_time
 * @property string $time_spent
 * @property integer $is_completed
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $is_deleted
 * @property string $deleted_at
 * @property integer $deleted_by
 * @property integer $verlock
 * @property string $uuid
 *
 * @property \common\models\Assessment $assessment
 * @property \common\models\Office $office
 * @property \common\models\Participant $participant
 * @property \common\models\Period $period
 * @property \common\models\ScheduleDetail $scheduleDetail
 * @property \common\models\Subject $subject
 */
class AssessmentDetail extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;

    private $_rt_softdelete;
    private $_rt_softrestore;

    public function __construct(){
        parent::__construct();
        $this->_rt_softdelete = [
            'deleted_by' => \Yii::$app->user->id,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
        $this->_rt_softrestore = [
            'deleted_by' => 0,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
    }

    /**
    * This function helps \mootensai\relation\RelationTrait runs faster
    * @return array relation names of this model
    */
    public function relationNames()
    {
        return [
            'assessment',
            'office',
            'participant',
            'period',
            'scheduleDetail',
            'subject'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['office_id', 'assessment_id', 'schedule_detail_id', 'participant_id', 'subject_id', 'period_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['earned_points', 'passing_score', 'passing_score_percent', 'gained_score'], 'number'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['app_version', 'quiz_title', 'quiz_type', 'username', 'time_limit', 'used_time', 'time_spent'], 'string', 'max' => 50],
            [['is_completed'], 'string', 'max' => 4],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tx_assessment_detail';
    }

    /**
     *
     * @return string
     * overwrite function optimisticLock
     * return string name of field are used to stored optimistic lock
     *
     */
    public function optimisticLock() {
        return 'verlock';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'office_id' => Yii::t('app', 'Office ID'),
            'assessment_id' => Yii::t('app', 'Assessment ID'),
            'schedule_detail_id' => Yii::t('app', 'Schedule Detail ID'),
            'participant_id' => Yii::t('app', 'Participant ID'),
            'subject_id' => Yii::t('app', 'Subject ID'),
            'period_id' => Yii::t('app', 'Period ID'),
            'app_version' => Yii::t('app', 'App Version'),
            'earned_points' => Yii::t('app', 'Earned Points'),
            'passing_score' => Yii::t('app', 'Passing Score'),
            'passing_score_percent' => Yii::t('app', 'Passing Score Percent'),
            'gained_score' => Yii::t('app', 'Gained Score'),
            'quiz_title' => Yii::t('app', 'Quiz Title'),
            'quiz_type' => Yii::t('app', 'Quiz Type'),
            'username' => Yii::t('app', 'Username'),
            'time_limit' => Yii::t('app', 'Time Limit'),
            'used_time' => Yii::t('app', 'Used Time'),
            'time_spent' => Yii::t('app', 'Time Spent'),
            'is_completed' => Yii::t('app', 'Is Completed'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAssessment()
    {
        return $this->hasOne(\common\models\Assessment::className(), ['id' => 'assessment_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOffice()
    {
        return $this->hasOne(\common\models\Office::className(), ['id' => 'office_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParticipant()
    {
        return $this->hasOne(\common\models\Participant::className(), ['id' => 'participant_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeriod()
    {
        return $this->hasOne(\common\models\Period::className(), ['id' => 'period_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getScheduleDetail()
    {
        return $this->hasOne(\common\models\ScheduleDetail::className(), ['id' => 'schedule_detail_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubject()
    {
        return $this->hasOne(\common\models\Subject::className(), ['id' => 'subject_id']);
    }
    
    /**
     * @inheritdoc
     * @return array mixed
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => date('Y-m-d H:i:s'),
            ],
            'blameable' => [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
            'uuid' => [
                'class' => UUIDBehavior::className(),
                'column' => 'uuid',
            ],
        ];
    }
}
