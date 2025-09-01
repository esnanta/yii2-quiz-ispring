<?php

namespace common\service;

use common\helper\LabelHelper;
use common\models\Assessment;
use common\models\Participant;
use Yii;
use yii\base\Exception;
use yii\bootstrap5\Html;
use yii\db\ActiveRecord;

use common\models\ScheduleDetail;

class ScheduleDetailService
{
    const EXECUTE_ASSESSMENT_TRUE = TRUE;
    const EXECUTE_ASSESSMENT_FALSE = FALSE;

    /**
     * Generate the asset button based on profile status and time.
     * Executes additional scripts if needed.
     *      (This script will handle if user click  more than one time)
     * @param ScheduleDetail $scheduleDetail
     * @param bool $isSubmitted
     * @param int $participantId
     * @param bool $executeScriptAfterClick
     * @return string
     * @throws Exception
     */
    public function getAssetButton(ScheduleDetail $scheduleDetail,
                                   bool $isSubmitted,
                                   int $participantId,
                                   bool $executeScriptAfterClick = false): string
    {
        if ($isSubmitted) {
            return LabelHelper::getDefault('<i class="fas fa-check-circle"></i>');
        }

        if (empty($scheduleDetail->asset_id)) {
            return Yii::t('app', 'Asset not available');
        }

        $isAdmin = $participantId === 0;

        // Execute any script or cache preparation as needed
        if ($executeScriptAfterClick) {
            $this->prepareAssessmentAndCache($scheduleDetail, $participantId);
        }

        return $this->createButton($scheduleDetail, $isAdmin);
    }

    /**
     * Generate button link and set its active status based on time or admin role.
     * @param ScheduleDetail $scheduleDetail
     * @param bool $isAdmin
     * @return string
     */
    private function createButton(ScheduleDetail $scheduleDetail, bool $isAdmin): string
    {
        $isButtonActive = $this->isButtonActive($scheduleDetail, $isAdmin);
        $linkLabel = $isButtonActive ? Yii::t('app', 'Open') : Yii::t('app', 'Closed');
        $labelClass = $isButtonActive ? LabelHelper::getButtonCssPrint() : LabelHelper::getButtonCssPlus() . ' btn-sm disabled';

        return Html::a(
            $linkLabel,
            $this->generateLink($scheduleDetail),
            ['class' => $labelClass]
        );
    }

    /**
     * Determines if the button should be active based on time or admin status.
     * @param ScheduleDetail $scheduleDetail
     * @param bool $isAdmin
     * @return bool
     */
    private function isButtonActive(ScheduleDetail $scheduleDetail, bool $isAdmin): bool
    {
        $currentTime = time();
        $timeStart = $scheduleDetail->schedule->getTimeStart();
        $timeEnd = $scheduleDetail->schedule->getTimeOut();

        return $currentTime > $timeStart && $currentTime < $timeEnd;
    }

    /**
     * Generate a text link for assets.
     * @param ScheduleDetail $scheduleDetail
     * @return string
     */
    private function generateLink(ScheduleDetail $scheduleDetail): string
    {
        $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username . '&SCD=' . $scheduleDetail->id;
        $assetService = new AssetService();
        return str_replace(
            'admin/',
            '',
            $assetService->getExtractUrl($scheduleDetail->asset) . $userinfo
        );
    }

    /**
     * Handles cache and assessment creation or retrieval for the schedule detail.
     * @param ScheduleDetail $scheduleDetail
     * @param int $participantId
     * @throws Exception
     */
    private function prepareAssessmentAndCache(ScheduleDetail $scheduleDetail, int $participantId): void
    {
        $cache = Yii::$app->cache;
        $scheduleDetailKey = CacheService::getInstance()->getScheduleDetailKey();
        $participantKey = CacheService::getInstance()->getParticipantKey();
        $assessmentKey = CacheService::getInstance()->getAssessmentKey();

        // Generate cache keys
        $scheduleDetailCacheKey = CacheService::getInstance()->generateCacheKey($scheduleDetailKey, $scheduleDetail->id);
        $participantCacheKey = CacheService::getInstance()->generateCacheKey($participantKey, $scheduleDetail->id);
        $assessmentCacheKey = CacheService::getInstance()->generateCacheKey($assessmentKey, $scheduleDetail->id);

        // Handle ScheduleDetail cache
        if (!$cache->get($scheduleDetailCacheKey)) {
            $cache->set($scheduleDetailCacheKey, $scheduleDetail);
        }

        // Handle Participant cache
        if (!$cache->get($participantCacheKey)) {
            $participant = Participant::findOne(['office_id' => $scheduleDetail->office_id, 'username' => Yii::$app->user->identity->username]);
            $cache->set($participantCacheKey, $participant);
        }

        // Handle Assessment cache
        if (!$cache->get($assessmentCacheKey)) {
            $assessment = new Assessment();
            $assessment->schedule_detail_id = $scheduleDetail->id;
            $assessment->office_id = $scheduleDetail->office_id;
            $assessment->schedule_id = $scheduleDetail->schedule_id;
            $assessment->participant_id = $participantId;
            $assessment->period_id = $scheduleDetail->schedule->period_id;
            $assessment->group_id = $scheduleDetail->schedule->group_id;
            $assessment->subject_id = $scheduleDetail->subject_id;
            $assessment->question_type = $scheduleDetail->question_type;
            $assessment->exam_type = $scheduleDetail->schedule->exam_type;
            $assessment->submission_status = Assessment::SUBMISSION_STATUS_ONGOING;
            $assessment->save();
            $cache->set($assessmentCacheKey, $assessment);
        }
    }

    /**
     * Check if profile has submitted assessment
     * @param ?Assessment $assessment
     * @param int $userId
     * @return bool
     */
    public function isUserSubmitted(?Assessment $assessment, int $userId): bool
    {
        if ($userId == 0) {
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

    public function getAssessment(ScheduleDetail $scheduleDetail, int $userId): array|ActiveRecord|null
    {
        return Assessment::find()
            ->where(['schedule_detail_id' => $scheduleDetail->id])
            ->andWhere(['office_id' => $scheduleDetail->office_id])
            ->andWhere(['user_id' => $userId])
            ->one();
    }
}