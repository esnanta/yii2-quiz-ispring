<?php

namespace common\service;

use common\models\Schedule;

class ScheduleService
{
    private $minutesTolerance = 15 * 60; // 15 minutes in seconds

    public function handleTokenAndCountdown(Schedule $model, $tokenStartTime, $timeStart, $timeOut, $currentTime): array
    {
        $tokenTime = strtotime($model->token_time);
        $countdownTime = $timeStart;
        $interval = (int)(abs(($currentTime - $timeStart) / 60));

        // Token has not started yet (before tokenStartTime)
        if ($currentTime < $tokenStartTime) {
            $tokenMessage = "Not yet started";
            return [$countdownTime, $interval, $tokenMessage];
        }

        // Token is valid and within the schedule period
        if ($currentTime <= $timeOut) {
            if ($currentTime < $tokenTime + $this->minutesTolerance) {
                // Token is still valid within its 15-minute lifetime
                $countdownTime = $tokenTime + $this->minutesTolerance;
                $tokenMessage = "Token is active";
            } else {
                // Token expired, generate a new token
                $this->generateNewToken($model);
                $countdownTime = strtotime($model->token_time) + $this->minutesTolerance;
                $tokenMessage = "New token generated";
            }
        } else {
            // Token is no longer valid as the time has passed `date_end`
            $tokenMessage = "Invalid";
        }

        return [$countdownTime, $interval, $tokenMessage];
    }

    public function generateNewToken(Schedule $model): void
    {
        $model->token_time = date(\Yii::$app->params['datetimeSaveFormat']);
        $model->token = substr(uniqid('', true), -6);
        $model->save();
    }
}