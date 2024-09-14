<?php

namespace common\models;

use Yii;
use yii\base\Exception;
use yii\bootstrap5\Html;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;
use FilesystemIterator;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use ZipArchive;

use common\helper\LabelHelper;
use common\models\base\ScheduleDetail as BaseScheduleDetail;

/**
 * This is the model class for table "tx_schedule_detail".
 */
class ScheduleDetail extends BaseScheduleDetail
{
    public $asset;

    const QUESTION_TYPE_GENERAL      = 1;
    const QUESTION_TYPE_LITERACY     = 2;
    const QUESTION_TYPE_NUMERATION   = 3;

    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            //TAMBAHAN
            [['subject_id'], 'required'],
            [['asset'], 'file', 'maxSize' => (1024 * 1024 * 5),
                'skipOnEmpty' => true,
                'extensions' => 'zip, rar, gz',
                'tooBig' => 'Limit is 5MB'],

            [['office_id', 'schedule_id', 'subject_id', 'question_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['remark'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['asset_name'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @throws Exception
     */
    public function beforeSave($insert) {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) {
            $this->office_id    = $this->schedule->office_id;
        }

        return true;
    }

    public static function getArrayQuestionTypes(): array
    {
        return [
            //MASTER
            self::QUESTION_TYPE_GENERAL => Yii::t('app', 'General'),
            self::QUESTION_TYPE_LITERACY  => Yii::t('app', 'Literacy'),
            self::QUESTION_TYPE_NUMERATION  => Yii::t('app', 'Numeration'),
        ];
    }

    public static function getOneQuestionType($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayQuestionTypes();
            switch ($_module) {
                case ($_module == self::QUESTION_TYPE_GENERAL):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_LITERACY):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::QUESTION_TYPE_NUMERATION):
                    $returnValue = LabelHelper::getDanger($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }
            return $returnValue;
        }
        else
            return '-';
    }

//    private function getWebRoot() : String
//    {
//        return str_replace('frontend', 'backend', Yii::getAlias('@webroot'));
//    }

//    private function getWebRootExtract() : String
//    {
//        return str_replace('backend', 'frontend', Yii::getAlias('@webroot'));
//    }

    /**
     * fetch stored asset file name with complete path
     * @return string
     */
//    public function getAssetFile(): ?string
//    {
//        $directory  = $this->getWebRoot().$this->getPath();
//        if (!is_dir($directory)) {
//            FileHelper::createDirectory($directory, $mode = 0777);
//        }
//        return (!empty($this->asset_name)) ? $directory.'/'. $this->asset_name : null;
//    }

    /**
     * fetch stored asset url
     * @return string
     */
//    public function getAssetUrl(): string
//    {
//        // return a default image placeholder if your source avatar is not found
//        $defaultImage = '/images/no-picture-available-icon-1.jpg';
//        $asset_name = (!empty($this->asset_name)) ? $this->asset_name : $defaultImage;
//        $directory = $this->getWebRoot().$this->getPath();
//
//        if (file_exists($directory.'/'.$asset_name)) {
//            $file_parts = pathinfo($directory.'/'.$asset_name);
//            if($file_parts['extension']=='pdf'){
//                Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
//            }
//
//            return Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
//        }
//        else{
//            return Yii::$app->urlManager->baseUrl . $defaultImage;
//        }
//    }

    /**
     * Process upload of asset
     *
     * @return mixed the uploaded asset instance
     */
//    public function uploadAsset() {
//        // get the uploaded file instance. for multiple file uploads
//        // the following data will return an array (you may need to use
//        // getInstances method)
//        $asset = UploadedFile::getInstance($this,'asset');
//
//        // if no asset was uploaded abort the upload
//        if (empty($asset)) {
//            return false;
//        }
//
//        //generate a unique file name
//        $pattern        = '/[\s\/,.]/'; // Regular expression for spaces, slashes, commas, and dots
//        $title          = preg_replace($pattern, '_', substr($asset->name, 0, strpos($asset->name, ".")));
//        $tmp            = explode('.', $asset->name);
//        $ext            = end($tmp);
//        $asset->name    = $this->id.'_'.$title.'_'.".{$ext}";
//
//        return $asset;
//    }

    /**
     * Process deletion of asset
     *
     * @return boolean the status of deletion
     */
//    public function deleteAsset() {
//        $file = $this->getAssetFile();
//
//        // check if file exists on server
//        if (empty($file) || !file_exists($file)) {
//            return false;
//        }
//
//        // check if uploaded file can be deleted on server
//        if (!unlink($file)) {
//            return false;
//        } else {
//            // if deletion successful, reset your file attributes
//            $this->asset_name = null;
//        }
//
//        return true;
//    }

    /**
     * @throws Exception
     */
//    public function extract()
//    {
//        //Get the file then extract
//        //Source located at backend
//        $fileSource = $this->getAssetFile();
//        $extractDir = $this->getExtractDir();
//
//        $zip = new ZipArchive;
//        $zip->open($fileSource);
//        $zip->extractTo($extractDir);
//        $zip->close();
//    }

    /**
     * @throws Exception
     */
//    public function getExtractDir(): ?string
//    {
//        //Create extract directory -> PATH / DATE-SUBJECT TITLE
//        $combinedName = $this->getExtractFolderName();
//        $directory  = str_replace('backend', 'frontend', Yii::getAlias('@webroot')) .
//            $this->getPath() .'/'.$combinedName;
//        if (!is_dir($directory)) {
//            FileHelper::createDirectory($directory, $mode = 0777);
//        }
//        return $directory;
//    }

    /**
     * @throws Exception
     */
//    public function getExtractUrl(): string
//    {
//        $indexFile = $this->getPath() . '/' .$this->getExtractFolderName().'/index.html';
//        return Yii::$app->urlManager->baseUrl . $indexFile;
//    }

//    private function getExtractFolderName(): string
//    {
//        $scheduleTitle = $this->schedule->title;
//        $subjectTitle = str_replace('','-',$this->subject->title);
//        return $scheduleTitle.'_'.$subjectTitle.'_'.$this->id;
//    }

//    public function removeExtractFolder(string $dir): void {
//        $it = new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS);
//        $files = new RecursiveIteratorIterator($it,
//            RecursiveIteratorIterator::CHILD_FIRST);
//        foreach($files as $file) {
//            if ($file->isDir()){
//                rmdir($file->getPathname());
//            } else {
//                unlink($file->getPathname());
//            }
//        }
//        rmdir($dir);
//    }

    public function getUrl(): string
    {
        return Yii::$app->getUrlManager()->createUrl(['archive/view', 'id' => $this->id, 'title' => $this->title]);
    }

//    public function getPath() : string {
//        $officeUniqueId = $this->office->unique_id;
//        return '/uploads/schedule/'.$officeUniqueId;
//    }

//    public function getAssetButton($participantId): string
//    {
//        // Default message for no asset
//        $value = '<i>Asset not available</i>';
//
//        // Step 1: Check if the participant has submitted
//        if ($this->isParticipantSubmitted($participantId)) {
//            return $this->getSubmissionStatus($participantId);
//        }
//
//        // Step 2 & 3: Check if the asset file exists and show button based on timer
//        if (!empty($this->asset_name)) {
//            return $this->getButtonBasedOnTime();
//        }
//
//        // Return the default message if no conditions are met
//        return $value;
//    }

    /**
     * $participantId = 0 means admin level. will be accessed from backend
     * Check if the participant has submitted the assessment
     */
//    private function isParticipantSubmitted($participantId): bool
//    {
//        if ($participantId == 0) {
//            return false;
//        }
//
//        $assessment = Assessment::find()
//            ->where(['schedule_detail_id' => $this->id])
//            ->andWhere(['office_id' => $this->office_id])
//            ->andWhere(['participant_id' => $participantId])
//            ->one();
//
//        return !empty($assessment) && $assessment->submission_status == Assessment::SUBMISSION_STATUS_SUBMITTED;
//    }

    /**
     * Get submission status message
     */
//    private function getSubmissionStatus($participantId): string
//    {
//        $assessment = Assessment::find()
//            ->where(['schedule_detail_id' => $this->id])
//            ->andWhere(['office_id' => $this->office_id])
//            ->andWhere(['participant_id' => $participantId])
//            ->one();
//
//        return $assessment->getOneSubmissionStatus($assessment->submission_status);
//    }

    /**
     * Generate the button based on the current time
     */
//    private function getButtonBasedOnTime(): string
//    {
//        $currentTime = strtotime("now");
//        $timeStart = $this->schedule->getTimeStart();
//        $timeEnd = $this->schedule->getTimeEnd();
//
//        // Default: "Closed" button
//        $linkLabel = Yii::t('app', 'Closed');
//        $labelClass = LabelHelper::getButtonCssPlus() . ' btn-sm disabled';
//
//        // Show "Open" button if the current time is between start and end
//        if ($currentTime > $timeStart && $currentTime < $timeEnd) {
//            $linkLabel = Yii::t('app', 'Open');
//            $labelClass = LabelHelper::getButtonCssPrint();
//        }
//
//        return Html::a($linkLabel, ['schedule/open', 'id' => $this->id, 'title' => $this->schedule->title], ['class' => $labelClass]);
//    }

    /**
     * Generates the text link for a schedule detail based on the current time and schedule timer.
     *
     * @return string The generated text link or an empty string if conditions are not met.
     * @throws Exception
     */
//    public function generateTextLink(): string
//    {
//        // Get the current time and the schedule timer
//        $currentTime = strtotime("now");
//        $timer = $this->schedule->getTimeReference();
//
//        // Initialize the text link as an empty string
//        $textLink = '';
//
//        // If the timer is greater than the current time, generate the user info and the link
//        if ($timer > $currentTime) {
//            $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username .
//                '&SCD=' . $this->id;
//            $textLink = $this->getExtractUrl() . $userinfo;
//        }
//
//        return $textLink;
//    }
}
