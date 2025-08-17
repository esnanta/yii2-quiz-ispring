<?php

namespace common\service;

use common\models\Schedule;
use Yii;
use yii\helpers\Url;
use yii\web\Response;

class ScheduleService
{
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
            ->andWhere(['>=', 'date_end', date('Y-m-d H:i:s')]) // Starting from now
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

    public function getScheduleUpcomingByGroup(int $officeId, int $groupId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId, 'group_id' => $groupId])
            ->andWhere(['>=', 'date_end', date('Y-m-d H:i:s')]) // Starting from now
            ->orderBy(['date_start' => SORT_ASC]) // Sort by date in ascending order
            ->limit(6) // Limit to 6 records
            ->all();
    }

    public function getScheduleRecentByGroup(int $officeId, int $groupId): array
    {
        return Schedule::find()
            ->where(['office_id' => $officeId, 'group_id' => $groupId])
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
                'url' => Url::to(['schedule/index', 'id' => $schedule->id]), // URL for schedule view page
            ];
        }
        return $events;
    }
}