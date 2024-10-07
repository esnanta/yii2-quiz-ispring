<?php

namespace common\service;

use common\helper\LabelHelper;
use common\models\Assessment;
use Yii;
use yii\bootstrap5\Html;
use yii\db\ActiveRecord;

use common\models\ScheduleDetail;

class ScheduleDetailService
{
    const ADMIN_IS_TRUE = TRUE;
    const ADMIN_IS_FALSE = FALSE;

    /**
     * Generate the asset button based on participant status and time
     * @param ScheduleDetail $scheduleDetail
     * @param int $participantId
     * @return string
     */
    public function getAssetButton(ScheduleDetail $scheduleDetail,
                                   bool $isSubmitted,
                                   int $participantId): string
    {
        //ADMIN FROM BACKEND WILL ALWAYS $isSubmitted = FALSE
        if ($isSubmitted) {
            return LabelHelper::getDefault('<i class="fas fa-check-circle"></i>');
        }

        $value = Yii::t('app', 'Asset not available');

        if (!empty($scheduleDetail->asset_id)) {
            $isAdmin = self::ADMIN_IS_FALSE;
            if($participantId == 0){
                $isAdmin = self::ADMIN_IS_TRUE;
            }
            return $this->getButtonBasedOnTime($scheduleDetail, $isAdmin);
        }

        return $value;
    }

    /**
     * Check if participant has submitted assessment
     * @param ?Assessment $assessment
     * @param int $participantId
     * @return bool
     */
    public function isParticipantSubmitted(?Assessment $assessment, int $participantId): bool
    {
        if ($participantId == 0) {
            return false;
        }

        return !empty($assessment) && $assessment->submission_status == Assessment::SUBMISSION_STATUS_SUBMITTED;
    }

    /**
     * Get submission status message
     * @param ?Assessment $assessment
     * @return string
     */
    public function getSubmissionStatus(?Assessment $assessment): string
    {
        if(empty($assessment)){
            return LabelHelper::getWarning('<i class="fas fa-exclamation-triangle"></i>');
        } else {
            return $assessment->getOneSubmissionStatus($assessment->submission_status);
        }
    }

    public function getAssessment(ScheduleDetail $scheduleDetail, int $participantId): array|ActiveRecord|null
    {
        return Assessment::find()
            ->where(['schedule_detail_id' => $scheduleDetail->id])
            ->andWhere(['office_id' => $scheduleDetail->office_id])
            ->andWhere(['participant_id' => $participantId])
            ->one();
    }

    /**
     * Generate button based on time for assets
     * @param ScheduleDetail $scheduleDetail
     * @return string
     */
    private function getButtonBasedOnTime(ScheduleDetail $scheduleDetail, bool $isAdmin): string
    {
        $currentTime = strtotime("now");
        $timeStart = $scheduleDetail->schedule->getTimeStart();
        $timeEnd = $scheduleDetail->schedule->getTimeOut();

        // Default: "Closed" button
        $linkLabel = Yii::t('app', 'Closed');
        $labelClass = LabelHelper::getButtonCssPlus() . ' btn-sm disabled';

        // Show "Open" button if the current time is between start and end
        // or if $isAdmin is true
        if ($currentTime > $timeStart && $currentTime < $timeEnd
            || $isAdmin == self::ADMIN_IS_TRUE) {

            $linkLabel = Yii::t('app', 'Open');
            $labelClass = LabelHelper::getButtonCssPrint();
        }

        return Html::a($linkLabel, ['schedule/open',
                'id' => $scheduleDetail->id,
                'title' => $scheduleDetail->schedule->title],
            ['class' => $labelClass]);
    }

    public function generateTextLink(
        ScheduleDetail $scheduleDetail,
        ScheduleService $scheduleService): string
    {
        // Get the current time and the schedule timer
        $timeStart = $scheduleDetail->schedule->getTimeStart();
        $timeOut = $scheduleDetail->schedule->getTimeOut();
        $currentTime = time();

        $timer = $scheduleService->getCountdownTime($timeStart,$timeOut,$currentTime);

        // Initialize the text link as an empty string
        $textLink = '';

        // If the timer is greater than the current time, generate the user info and the link
        $assetService = new AssetService();
        if ($timer > $currentTime) {
            $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username .
                '&SCD=' . $scheduleDetail->id;
            $textLink = $assetService->getExtractUrl($scheduleDetail->asset) . $userinfo;
        }

        return $textLink;
    }
}