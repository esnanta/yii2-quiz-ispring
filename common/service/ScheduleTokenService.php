<?php

namespace common\service;

use common\helper\DateHelper;
use common\models\ScheduleToken;
use Yii;
use yii\db\Exception;

class ScheduleTokenService
{
    private int $intervalMinutes = 15; // 15 minutes interval
    private int $intervalSeconds = 900; // 15 minutes in seconds

    /**
     * Handle token generation and countdown logic
     * @throws Exception
     */
    public function handleTokenAndCountdown(ScheduleToken $model): array
    {
        $dateStart = strtotime($model->date_start);
        $dateEnd = strtotime($model->date_end);
        $currentTime = time();

        // Case 1: Before start time - countdown to start
        if ($currentTime < $dateStart) {
            $countdownTime = $dateStart;
            $tokenMessage = Yii::t('app', 'Token will start at') . ' ' . date('H:i:s', $dateStart);
            return [$countdownTime, 0, $tokenMessage, 'waiting'];
        }

        // Case 2: After end time - expired
        if ($currentTime > $dateEnd) {
            $countdownTime = $currentTime;
            $tokenMessage = Yii::t('app', 'Token expired');
            return [$countdownTime, 0, $tokenMessage, 'expired'];
        }

        // Case 3: Within active period
        $this->generateTokenIfNeeded($model, $currentTime, $dateStart);

        // Calculate next token time
        $nextTokenTime = $this->getNextTokenTime($model, $currentTime, $dateStart, $dateEnd);
        $tokenMessage = Yii::t('app', 'Token active') . ' - ' . Yii::t('app', 'Next change in');

        return [$nextTokenTime, $this->getCurrentInterval($currentTime, $dateStart), $tokenMessage, 'active'];
    }

    /**
     * Generate token if needed based on 15-minute intervals
     * @throws Exception
     */
    private function generateTokenIfNeeded(ScheduleToken $model, int $currentTime, int $dateStart): void
    {
        $currentInterval = $this->getCurrentInterval($currentTime, $dateStart);
        $lastTokenTime = $model->token_interval ? strtotime($model->token_interval) : null;

        // Check if we need to generate a new token
        if (!$lastTokenTime || $this->getCurrentInterval($lastTokenTime, $dateStart) < $currentInterval) {
            $this->generateNewToken($model, $currentTime, $dateStart);
        }
    }

    /**
     * Get current 15-minute interval number since start
     */
    private function getCurrentInterval(int $currentTime, int $dateStart): int
    {
        return (int) floor(($currentTime - $dateStart) / $this->intervalSeconds);
    }

    /**
     * Get the next token generation time
     */
    private function getNextTokenTime(ScheduleToken $model, int $currentTime, int $dateStart, int $dateEnd): int
    {
        $currentInterval = $this->getCurrentInterval($currentTime, $dateStart);
        $nextIntervalStart = $dateStart + (($currentInterval + 1) * $this->intervalSeconds);

        // Don't go beyond end time
        return min($nextIntervalStart, $dateEnd);
    }

    /**
     * Generate new token
     * @throws Exception
     */
    private function generateNewToken(ScheduleToken $model, int $currentTime, int $dateStart): void
    {
        $currentInterval = $this->getCurrentInterval($currentTime, $dateStart);
        $intervalStartTime = $dateStart + ($currentInterval * $this->intervalSeconds);

        $model->token = $this->generateTokenString();
        $model->token_interval = date('Y-m-d H:i:s', $intervalStartTime);

        if (!$model->save()) {
            throw new Exception('Failed to save token');
        }
    }

    /**
     * Generate random 6-character token
     */
    private function generateTokenString(): string
    {
        return substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 0, 6);
    }

    /**
     * Get label class for timer display
     */
    public function getLabelAlertTimer(ScheduleToken $model): string
    {
        $dateStart = strtotime($model->date_start);
        $dateEnd = strtotime($model->date_end);
        $currentTime = time();

        if ($currentTime < $dateStart) {
            return 'badge bg-warning text-dark'; // Waiting
        } elseif ($currentTime >= $dateStart && $currentTime <= $dateEnd) {
            return 'badge bg-success text-white'; // Active
        } else {
            return 'badge bg-danger text-white'; // Expired
        }
    }
}