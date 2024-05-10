<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_schedule".
 *
 * @property integer $id
 * @property integer $office_id
 * @property string $title
 * @property integer $period_id
 * @property integer $group_id
 * @property integer $room_id
 * @property integer $staff_id
 * @property string $date_start
 * @property string $date_end
 * @property string $token
 * @property string $token_time
 * @property integer $is_asset
 * @property string $description
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
 * @property \common\models\Assessment[] $assessments
 * @property \common\models\Group $group
 * @property \common\models\Office $office
 * @property \common\models\Period $period
 * @property \common\models\Room $room
 * @property \common\models\Staff $staff
 * @property \common\models\ScheduleDetail[] $scheduleDetails
 */
class Schedule extends \yii\db\ActiveRecord
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
            'assessments',
            'group',
            'office',
            'period',
            'room',
            'staff',
            'scheduleDetails'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['office_id', 'period_id', 'group_id', 'room_id', 'staff_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_start', 'date_end', 'token_time', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['token'], 'string', 'max' => 6],
            [['is_asset'], 'string', 'max' => 4],
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
        return 'tx_schedule';
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
            'title' => Yii::t('app', 'Title'),
            'period_id' => Yii::t('app', 'Period ID'),
            'group_id' => Yii::t('app', 'Group ID'),
            'room_id' => Yii::t('app', 'Room ID'),
            'staff_id' => Yii::t('app', 'Staff ID'),
            'date_start' => Yii::t('app', 'Date Start'),
            'date_end' => Yii::t('app', 'Date End'),
            'token' => Yii::t('app', 'Token'),
            'token_time' => Yii::t('app', 'Token Time'),
            'is_asset' => Yii::t('app', 'Is Asset'),
            'description' => Yii::t('app', 'Description'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAssessments()
    {
        return $this->hasMany(\common\models\Assessment::class, ['schedule_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroup()
    {
        return $this->hasOne(\common\models\Group::class, ['id' => 'group_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOffice()
    {
        return $this->hasOne(\common\models\Office::class, ['id' => 'office_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeriod()
    {
        return $this->hasOne(\common\models\Period::class, ['id' => 'period_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoom()
    {
        return $this->hasOne(\common\models\Room::class, ['id' => 'room_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStaff()
    {
        return $this->hasOne(\common\models\Staff::class, ['id' => 'staff_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getScheduleDetails()
    {
        return $this->hasMany(\common\models\ScheduleDetail::class, ['schedule_id' => 'id']);
    }
    
    /**
     * @inheritdoc
     * @return array mixed
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::class,
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => date('Y-m-d H:i:s'),
            ],
            'blameable' => [
                'class' => BlameableBehavior::class,
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
            'uuid' => [
                'class' => UUIDBehavior::class,
                'column' => 'uuid',
            ],
        ];
    }
}
