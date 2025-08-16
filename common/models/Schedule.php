<?php

namespace common\models;

use common\helper\ExamTypeHelper;
use common\helper\LabelHelper;
use Yii;
use \common\models\base\Schedule as BaseSchedule;
use yii\bootstrap5\Html;

/**
 * This is the model class for table "tx_schedule".
 */
class Schedule extends BaseSchedule
{
    const IS_ASSET_AVAILABLE_NO    = 1;
    const IS_ASSET_AVAILABLE_YES   = 2;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['period_id','group_id', 'room_id','staff_id','date_start','date_end'], 'required'],

            [['office_id', 'period_id', 'group_id', 'room_id', 'staff_id', 'exam_type', 'is_asset_available', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_start', 'date_end', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }
    public function beforeSave($insert): bool
    {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) :
            $this->title = Counter::getDataNumber(Counter::CODE_OF_SCHEDULE);
        endif;

        return true;
    }

    public static function getArrayExamType(): array
    {
        return ExamTypeHelper::getArrayExamType();
    }

    public static function getOneExamType($_module = null): string
    {
        if($_module)
        {
            return ExamTypeHelper::getOneExamType($_module);
        }
        else
            return '-';
    }

    public static function getArrayIsAsset()
    {
        return [
            //MASTER
            self::IS_ASSET_AVAILABLE_YES => Yii::t('app', 'Yes'),
            self::IS_ASSET_AVAILABLE_NO  => Yii::t('app', 'No'),
        ];
    }

    public static function getOneIsAsset($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsAsset();

            switch ($_module) {
                case ($_module == self::IS_ASSET_AVAILABLE_YES):
                    $returnValue = LabelHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_ASSET_AVAILABLE_NO):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return '-';
    }

    public function updateIsAsset(): int
    {
        $isAssetAvailable = self::IS_ASSET_AVAILABLE_YES;
        $nullAsset = ScheduleDetail::find('asset_id')
            ->where([
                'schedule_id' => $this->id,
                'office_id'=>$this->office,
                'asset_id'=>null])
            ->count();

        if($nullAsset > 0):
            $isAssetAvailable = self::IS_ASSET_AVAILABLE_NO;
        endif;

        $this->is_asset_available = $isAssetAvailable;
        $this->save();
        return $isAssetAvailable;
    }

    public function getMinutesBuffer(): int
    {
        //2 minutes
        return 120;
    }

    public function getTimeStart(): int
    {
        return strtotime($this->date_start);
    }
    public function getTimeOut(): int
    {
        return strtotime($this->date_end);
    }

    public function getTokenTime(): int
    {
        return strtotime($this->token_time);
    }

    public function getUrl(): string
    {
        return Html::a($this->title, ['schedule/view', 'id' => $this->id,'title'=>$this->title]);
    }

    public function getSubjectsTitle(){
        $listScheduleDetails = $this->scheduleDetails;
        $subjects = '';
        foreach ($listScheduleDetails as $scheduleDetail) {
            $subjects .= $scheduleDetail->subject->title . ', ';
        }
        return rtrim($subjects, ', ');
    }
}
