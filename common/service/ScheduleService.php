<?php

namespace common\service;

use common\helper\DateHelper;
use common\models\Schedule;
use Yii;
use yii\db\Exception;

class ScheduleService
{
    private int $minutesTolerance = 15 * 60; // 15 minutes in seconds

    /**
     * @throws Exception
     */
    public function handleTokenAndCountdown(Schedule $model): array
    {
        $timeStart = strtotime($model->date_start);
        $timeOut = strtotime($model->date_end);
        $tokenTime = strtotime($model->token_time);
        $currentTime = strtotime("now");
        $tokenStartTime = $timeStart - (2 * 60);

        $countdownTime = $timeStart;
        $interval = (int)(abs(($currentTime - $timeStart) / 60));

        // Token has not started yet (before tokenStartTime)
        if ($currentTime < $tokenStartTime) {
            $tokenMessage = Yii::t('app', 'Not yet started');
            return [$countdownTime, $interval, $tokenMessage];
        }

        // Token is valid and within the schedule period
        if ($currentTime <= $timeOut) {
            if ($currentTime < $tokenTime + $this->minutesTolerance) {
                // Token is still valid within its 15-minute lifetime
                $countdownTime = $tokenTime + $this->minutesTolerance;
                $tokenMessage = Yii::t('app', 'Token is active');
            } else {
                // Token expired, generate a new token
                $this->generateNewToken($model);
                $countdownTime = strtotime($model->token_time) + $this->minutesTolerance;
                $tokenMessage = Yii::t('app', 'New token generated');
            }
        } else {
            // Token is no longer valid as the time has passed `date_end`
            $tokenMessage = Yii::t('app', 'Time has passed');
        }

        return [$countdownTime, $interval, $tokenMessage];
    }

    /**
     * @throws Exception
     */
    public function generateNewToken(Schedule $model): void
    {
        $model->token_time = date(DateHelper::getDateTimeSaveFormat());
        $model->token = substr(uniqid('', true), -6);
        $model->save();
    }

    public function getMinutesTolerance(): int
    {
        return $this->minutesTolerance;
    }
}