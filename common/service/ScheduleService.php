<?php

namespace common\service;

use common\helper\DateHelper;
use common\models\Schedule;
use Yii;
use yii\db\Exception;
use yii\helpers\Url;
use yii\web\Response;

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
        $currentTime = time();
        $tokenStartTime = $timeStart - (2 * 60); // Token available 2 minutes before start

        $countdownTime = $timeStart;
        $interval = (int)(($currentTime - $timeStart) / 60);

        // Case 1: Token has not started yet (before tokenStartTime)
        if ($currentTime < $tokenStartTime) {
            $tokenMessage = Yii::t('app', 'Not yet started');
            return [$countdownTime, $interval, $tokenMessage];
        }

        // Case 2: Token is valid and within the schedule period
        if ($currentTime <= $timeOut) {
            if (!empty($model->token_time) && $currentTime < ($tokenTime + $this->minutesTolerance)) {
                // Token is still valid within its 15-minute lifetime
                $countdownTime = $tokenTime + $this->minutesTolerance;
                $tokenMessage = Yii::t('app', 'Token is active');
            } else {
                // Token expired or missing, generate a new token
                $this->generateNewToken($model);
                $tokenTime = strtotime($model->token_time); // Update after token generation
                $countdownTime = $tokenTime + $this->minutesTolerance;
                $tokenMessage = Yii::t('app', 'New token generated');
            }
        } else {
            // Case 3: Time has passed `date_end`
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
        $model->token = substr(uniqid('', true), -6); // Generate 6-character token
        $model->save();
    }

    public function getMinutesTolerance(): int
    {
        return $this->minutesTolerance;
    }

    public function getScheduleOneMonth(int $officeId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId])
            ->andWhere(['between', 'date_start',
                date('Y-m-d H:i:s', strtotime('-14 days')), // 14 days ago
                date('Y-m-d H:i:s', strtotime('+14 days'))  // 14 days ahead
            ])
            ->orderBy(['date_start' => SORT_DESC]) // Optional: Sort by date
            ->limit(12) // Limit to 6 records
            ->all();
    }

    public function getScheduleAsJson(int $officeId): array
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $schedules = $this->getScheduleOneMonth($officeId);

        $events = [];
        foreach ($schedules as $schedule) {
            $events[] = [
                'id' => $schedule->id,
                'title' => $schedule->room->title, // The event title
                'start' => $schedule->date_start, // The event start time
                'end' => $schedule->date_end, // The event end time
                'url' => Url::to(['schedule/view', 'id' => $schedule->id]), // URL for schedule view page
            ];
        }

        return $events;
    }

    public function getScheduleOneMonthByParticipant(int $officeId, int $participantId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId])
            ->andWhere(['group_id' => $participantId])
            ->andWhere(['between', 'date_start',
                date('Y-m-d H:i:s', strtotime('-14 days')), // 14 days ago
                date('Y-m-d H:i:s', strtotime('+14 days'))  // 14 days ahead
            ])
            ->orderBy(['date_start' => SORT_DESC]) // Optional: Sort by date
            ->limit(6) // Limit to 6 records
            ->all();
    }
}