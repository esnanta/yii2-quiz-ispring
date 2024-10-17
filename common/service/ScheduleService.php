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
        $timeStart = $model->getTimeStart();
        $timeOut = $model->getTimeOut();
        $tokenTime = $model->getTokenTime();
        $currentTime = time();

        // Token available in buffer minutes before start
        $tokenStartTime = $model->getTimeStart() - $model->getMinutesBuffer();

        // Calculate the reference time for the countdown
        $countdownTime = $this->getCountdownTime($timeStart, $timeOut, $currentTime);

        // Set interval to calculate how much time has passed since the start
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
                $tokenTime = $model->getTokenTime(); // Update after token generation
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
     * Helper function to get the countdown time reference.
     */
    public function getCountdownTime($timeStart, $timeOut, $currentTime): float
    {
        // Case: If the current time is before the start time
        if ($currentTime < $timeStart) {
            // Return the countdown time as the difference between the current time and start time
            return $timeStart;  // The countdown should aim at the start time
        }

        // Case: If the current time is within the valid token lifetime
        if ($currentTime >= $timeStart && $currentTime < $timeOut) {
            // Calculate the remaining time until the token expires
            $remainingTime = $timeOut - $currentTime;

            // If the remaining time is less than the tolerance (15 minutes)
            if ($remainingTime <= $this->minutesTolerance) {
                return $currentTime;
            }

            // Otherwise, return the timeStart plus 15-minute intervals until the end
            $interval = $this->minutesTolerance;
            $adjustedTime = $timeStart + ceil(($currentTime - $timeStart) / $interval) * $interval;
            return min($adjustedTime, $timeOut);
        }

        // Case: If the token has expired, return the timeOut
        return $timeOut;
    }



    /**
     * Generates a new token for the given schedule model.
     *
     * @throws Exception
     */
    public function generateNewToken(Schedule $model): void
    {
        $model->token_time = date(DateHelper::getDateTimeSaveFormat());
        $model->token = substr(uniqid('', true), -6); // Generate 6-character token
        $model->save();
    }

    /**
     * Returns the label class for the alert timer based on the current time.
     */
    public function getLabelAlertTimer(Schedule $model): string
    {
        $timeStart = strtotime($model->date_start);
        $timeEnd = strtotime($model->date_end);
        $currentTime = time();

        if ($currentTime >= $timeStart && $currentTime <= $timeEnd) {
            return 'badge bg-success text-white';
        }

        return 'badge bg-danger text-white';
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
            ->orderBy(['date_start' => SORT_ASC]) // Optional: Sort by date
            ->limit(12) // Limit to 6 records
            ->all();
    }

    public function getScheduleUpcoming(int $officeId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId])
            ->andWhere(['>=', 'date_start', date('Y-m-d H:i:s')]) // Starting from now
            ->orderBy(['date_start' => SORT_ASC]) // Sort by date in ascending order
            ->limit(6) // Limit to 6 records
            ->all();
    }
    public function getScheduleRecent(int $officeId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId])
            ->andWhere(['between', 'date_start', date('Y-m-d H:i:s', strtotime('-14 days')), date('Y-m-d H:i:s')]) // Between 14 days ago and now
            ->orderBy(['date_start' => SORT_DESC]) // Sort by date in descending order
            ->limit(6) // Limit to 6 records
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
            ->orderBy(['date_start' => SORT_ASC]) // Optional: Sort by date
            ->limit(6) // Limit to 6 records
            ->all();
    }
}