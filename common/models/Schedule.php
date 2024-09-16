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
    const IS_ASSET_AVAILABLE        = 1;
    const IS_ASSET_NOT_AVAILABLE    = 2;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['group_id', 'room_id','staff_id','date_start','date_end'], 'required'],

            [['office_id', 'period_id', 'group_id', 'room_id', 'staff_id', 'exam_type', 'is_asset', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_start', 'date_end', 'token_time', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['token'], 'string', 'max' => 6],
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
            $this->token = substr(uniqid('', true), -6);
        endif;

        if(empty($this->token_time)):
            $this->token_time = $this->date_start;
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
            self::IS_ASSET_AVAILABLE => Yii::t('app', 'OK'),
            self::IS_ASSET_NOT_AVAILABLE  => Yii::t('app', 'NA'),
        ];
    }

    public static function getOneIsAsset($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsAsset();

            switch ($_module) {
                case ($_module == self::IS_ASSET_AVAILABLE):
                    $returnValue = LabelHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_ASSET_NOT_AVAILABLE):
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
        $isAsset = self::IS_ASSET_AVAILABLE;
        $nullAsset = ScheduleDetail::find('asset_name')
            ->where([
                'schedule_id' => $this->id,
                'office_id'=>$this->office,
                'asset_name'=>null])
            ->count();

        if($nullAsset > 0):
            $isAsset = self::IS_ASSET_NOT_AVAILABLE;
        endif;

        $this->is_asset = $isAsset;
        $this->save();
        return $isAsset;
    }

    private function getMinutesBuffer(): int
    {
        //2 minutes
        return 120;
    }

    public function getTimeStart(): int
    {
        return strtotime($this->date_start) - $this->getMinutesBuffer();
    }
    public function getTimeEnd(): int
    {
        return strtotime($this->date_end);
    }


    public function getTimeReference(): float {
        // Get the current time
        $currentTime = time();

        // Get the date_start and date_end timestamps
        $timeStart = strtotime($this->date_start);
        $timeEnd = strtotime($this->date_end);

        // Check if the current time is within the valid token lifetime
        if ($currentTime >= $timeStart && $currentTime < $timeEnd) {
            // Calculate the remaining time until the token expires
            $remainingTime = $timeEnd - $currentTime;

            // If the remaining time is less than 15 minutes, return the current time
            if ($remainingTime <= 15 * 60) {
                return $currentTime;
            }

            // Otherwise, return the timeStart plus 15-minute intervals until the end
            $interval = 15 * 60;
            $adjustedTime = $timeStart + ceil(($currentTime - $timeStart) / $interval) * $interval;
            return min($adjustedTime, $timeEnd);
        }

        // If the token has expired, return the date_end
        return $timeEnd;
    }

    public function getLabelAlertTimer(): string
    {
        $timeStart      = $this->getTimeStart();
        $timeEnd        = $this->getTimeEnd();
        $currentTime    = strtotime("now");

        $labelAlertTimer = 'badge bg-danger text-white';
        if($currentTime >= $timeStart && $currentTime <= $timeEnd):
            $labelAlertTimer = 'badge bg-success text-white';
        endif;
        return $labelAlertTimer;
    }

    public function getUrl(): string
    {
        return Html::a($this->title, ['schedule/view', 'id' => $this->id,'title'=>$this->title]);
    }
}
