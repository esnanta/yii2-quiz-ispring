<?php

namespace common\service;

use common\helper\LabelHelper;
use common\models\Assessment;
use Yii;
use yii\base\Exception;
use yii\bootstrap5\Html;
use yii\db\ActiveRecord;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;
use FilesystemIterator;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use ZipArchive;

use common\models\ScheduleDetail;

class ScheduleDetailService
{
    const ADMIN_IS_TRUE = TRUE;
    const ADMIN_IS_FALSE = FALSE;

    /**
     * Upload asset file
     * @param ScheduleDetail $scheduleDetail
     * @return UploadedFile|false
     */
    public function uploadAsset(ScheduleDetail $scheduleDetail)
    {
        $asset = UploadedFile::getInstance($scheduleDetail, 'asset');

        if (empty($asset)) {
            return false;
        }

        $pattern = '/[\s\/,.]/';
        $title = preg_replace($pattern, '_', substr($asset->name, 0, strpos($asset->name, ".")));
        $tmp = explode('.', $asset->name);
        $ext = end($tmp);
        $asset->name = $scheduleDetail->id . '_' . $title . '_' . ".{$ext}";

        return $asset;
    }

    /**
     * Delete asset file from server
     * @param ScheduleDetail $scheduleDetail
     * @return bool
     */
    public function deleteAsset(ScheduleDetail $scheduleDetail): bool
    {
        $file = $this->getAssetFile($scheduleDetail);

        if (empty($file) || !file_exists($file)) {
            return false;
        }

        if (!unlink($file)) {
            return false;
        } else {
            $scheduleDetail->asset_id = null;
        }

        return true;
    }

    /**
     * Get asset file path
     * @param ScheduleDetail $scheduleDetail
     * @return string|null
     */
    public function getAssetFile(ScheduleDetail $scheduleDetail): ?string
    {
        $directory = $this->getWebRoot() . $this->getPath($scheduleDetail);
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($scheduleDetail->asset_id)) ? $directory . '/' . $scheduleDetail->asset_id : null;
    }

    /**
     * Extract asset file
     * @param ScheduleDetail $scheduleDetail
     * @throws Exception
     */
    public function extract(ScheduleDetail $scheduleDetail)
    {
        $fileSource = $this->getAssetFile($scheduleDetail);
        $extractDir = $this->getExtractDir($scheduleDetail);

        $zip = new ZipArchive;
        $zip->open($fileSource);
        $zip->extractTo($extractDir);
        $zip->close();
    }

    /**
     * Get extract directory
     * @param ScheduleDetail $scheduleDetail
     * @return string|null
     * @throws Exception
     */
    public function getExtractDir(ScheduleDetail $scheduleDetail): ?string
    {
        $combinedName = $this->getExtractFolderName($scheduleDetail);
        $directory = str_replace('backend', 'frontend', Yii::getAlias('@webroot')) . $this->getPath($scheduleDetail) . '/' . $combinedName;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return $directory;
    }

    /**
     * Remove extract folder recursively
     * @param string $dir
     */
    public function removeExtractFolder(string $dir): void
    {
        $it = new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS);
        $files = new RecursiveIteratorIterator($it, RecursiveIteratorIterator::CHILD_FIRST);
        foreach ($files as $file) {
            if ($file->isDir()) {
                rmdir($file->getPathname());
            } else {
                unlink($file->getPathname());
            }
        }
        rmdir($dir);
    }

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

    // Utility methods for asset paths
    private function getWebRoot(): string
    {
        return str_replace('frontend', 'backend', Yii::getAlias('@webroot'));
    }

    private function getPath(ScheduleDetail $scheduleDetail): string
    {
        $officeUniqueId = $scheduleDetail->office->unique_id;
        return '/uploads/schedule/' . $officeUniqueId;
    }

    private function getExtractFolderName(ScheduleDetail $scheduleDetail): string
    {
        $scheduleTitle = $scheduleDetail->schedule->title;
        $subjectTitle = str_replace('', '-', $scheduleDetail->subject->title);
        return $scheduleTitle . '_' . $subjectTitle . '_' . $scheduleDetail->id;
    }

    public function generateTextLink(
        ScheduleDetail $scheduleDetail,
        ScheduleService $scheduleService): string
    {
        // Get the current time and the schedule timer
        $timeStart = $scheduleDetail->schedule->getTimeStart();
        $timeOut = $scheduleDetail->schedule->getTimeOut();
        $currentTime = time();

        //$timer = $scheduleDetail->schedule->getTimeReference();
        $timer = $scheduleService->getCountdownTime($timeStart,$timeOut,$currentTime);

        // Initialize the text link as an empty string
        $textLink = '';

        // If the timer is greater than the current time, generate the user info and the link
        if ($timer > $currentTime) {
            $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username .
                '&SCD=' . $scheduleDetail->id;
            $textLink = $this->getExtractUrl($scheduleDetail) . $userinfo;
        }

        return $textLink;
    }

    public function getExtractUrl(ScheduleDetail $scheduleDetail): string
    {
        $indexFile = $this->getPath($scheduleDetail) . '/' .
            $this->getExtractFolderName($scheduleDetail).'/index.html';
        return Yii::$app->urlManager->baseUrl . $indexFile;
    }
}