<?php

namespace common\helper;

use DateTime;
use Exception;
use Yii;

class DateHelper
{

    public static function getDateTimeDisplayFormat(): string
    {
        return 'php:d-M-Y H:i:s';
    }
    public static function getDateTimeSaveFormat(): string
    {
        return 'php:Y-m-d H:i:s';
    }
    /**
     * Formats the given datetime string based on application parameters.
     *
     * @param string $dateTime The datetime string from the database (Y-m-d H:i:s).
     * @return string The formatted date and time.
     * @throws Exception
     */
    public static function formatDateTime(string $dateTime): string
    {
        // Get the display formats from the application params
        $dateFormat = Yii::$app->params['datetimeDisplayFormat'];

        // Create DateTime object
        $date = new DateTime($dateTime);

        // Format and return the datetime based on the params
        return $date->format($dateFormat);
    }


    /**
     * Formats the given datetime string to a date based on application parameters.
     *
     * @param string $dateTime The datetime string from the database (Y-m-d H:i:s).
     * @return string The formatted date.
     * @throws Exception
     */
    public static function formatDate(string $dateTime): string
    {
        // Get the date format from the application params
        $dateFormat = Yii::$app->params['dateDisplayFormat'];

        // Create DateTime object
        $date = new DateTime($dateTime);

        // Format and return the date
        return $date->format($dateFormat);
    }

    /**
     * Formats the given datetime string to a time based on application parameters.
     *
     * @param string $dateTime The datetime string from the database (Y-m-d H:i:s).
     * @return string The formatted time.
     * @throws Exception
     */
    public static function formatTime(string $dateTime): string
    {
        // Get the time format from the application params
        $timeFormat = Yii::$app->params['timeDisplayFormat'];

        // Create DateTime object
        $date = new DateTime($dateTime);

        // Format and return the time
        return $date->format($timeFormat);
    }
}