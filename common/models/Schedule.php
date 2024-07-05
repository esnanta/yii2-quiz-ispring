<?php

namespace common\models;

use common\helper\UIHelper;
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

            [['office_id', 'period_id', 'group_id', 'room_id', 'staff_id', 'is_asset', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
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
            $this->title = Counter::getDataNumber(Counter::CODE_OF_SCHEDULE).'-'.$this->title;
            $this->token = substr(uniqid('', true), -6);
        endif;

        if(empty($this->token_time)):
            $this->token_time = $this->date_start;
        endif;

        return true;
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
                    $returnValue = UIHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_ASSET_NOT_AVAILABLE):
                    $returnValue = UIHelper::getNo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = UIHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
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

    public function getMinutesDifference(): float
    {
        $timeReference = strtotime($this->date_start);
        $currentTime = strtotime("now");
        return round(abs(($timeReference - $currentTime) / 60));
    }

    public function getTimer(): float{
        $timeReference = strtotime($this->date_start);
        $currentTime = strtotime("now");
        if ($timeReference < $currentTime) :
            $timeReference = strtotime($this->date_end);
        endif;
        return $timeReference;
    }

    public function getLabelAlertTimer(): string
    {
        $minutesTolerance = 10; //minutes
        $minutesDifference = $this->getMinutesDifference();
        $labelAlertTimer = 'badge bg-warning text-white';
        if ($minutesDifference < $minutesTolerance) :
            $labelAlertTimer = 'badge bg-success text-white';
        endif;
        return $labelAlertTimer;
    }

    public function getUrl(){
        return Html::a($this->title, ['schedule/view', 'id' => $this->id,'title'=>$this->title]);
    }
}
