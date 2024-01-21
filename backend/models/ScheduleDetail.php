<?php

namespace backend\models;

use common\helper\CacheCloud;
use FilesystemIterator;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use Yii;
use \backend\models\base\ScheduleDetail as BaseScheduleDetail;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;

/**
 * This is the model class for table "tx_schedule_detail".
 */
class ScheduleDetail extends BaseScheduleDetail
{
    public $asset;
    /**
     * @var mixed|null
     */

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['subject_id', 'remark'], 'required'],
            [['asset'], 'file', 'maxSize' => (1024 * 1024 * 3),
                'skipOnEmpty' => true,
                'extensions' => 'zip, rar, gz',
                'tooBig' => 'Limit is 3MB'],

            [['office_id', 'schedule_id', 'subject_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['remark'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['asset_name'], 'string', 'max' => 100],
            [['asset_url'], 'string', 'max' => 500],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    public function beforeSave($insert) {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        if ($this->isNewRecord) {
            $this->office_id    = $this->schedule->office_id;
        }

        return true;
    }

    /**
     * fetch stored asset file name with complete path
     * @return string
     */
    public function getAssetFile(): ?string
    {
        $directory  = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) .
            $this->getPath();
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($this->asset_name)) ? $directory.'/'. $this->asset_name : null;
    }

    /**
     * fetch stored asset url
     * @return string
     */
    public function getAssetUrl(): string
    {
        // return a default image placeholder if your source avatar is not found
        $defaultImage = '/images/no-picture-available-icon-1.jpg';
        $asset_name = (!empty($this->asset_name)) ? $this->asset_name : $defaultImage;
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getPath();

        if (file_exists($directory.'/'.$asset_name)) {
            $file_parts = pathinfo($directory.'/'.$asset_name);
            if($file_parts['extension']=='pdf'){
                Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
            }

            return Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
        }
        else{
            return Yii::$app->urlManager->baseUrl . $defaultImage;
        }
    }

    /**
     * Process upload of asset
     *
     * @return mixed the uploaded asset instance
     */
    public function uploadAsset() {
        // get the uploaded file instance. for multiple file uploads
        // the following data will return an array (you may need to use
        // getInstances method)
        $asset = UploadedFile::getInstance($this,'asset');

        // if no asset was uploaded abort the upload
        if (empty($asset)) {
            return false;
        }

        //generate a unique file name
        //$ext = end((explode(".", $asset->name)));
        $deleteExt          = substr($asset->name, 0, strpos($asset->name, "."));
        $replaceSpace       = str_replace(' ','_', $deleteExt);
        $replaceSlash       = str_replace('/','_', $replaceSpace);
        $replaceComma       = str_replace(',','_', $replaceSlash);
        $replaceDot         = str_replace('.','_', $replaceComma);
        $title              = $replaceDot;
        $tmp                = explode('.', $asset->name);
        $ext                = end($tmp);
        $asset->name        = $title.".{$ext}";

        // the uploaded asset instance
        return $asset;
    }

    /**
     * Process deletion of asset
     *
     * @return boolean the status of deletion
     */
    public function deleteAsset() {
        $file = $this->getAssetFile();

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        } else {
            // if deletion successful, reset your file attributes
            $this->asset_name = null;
            $this->asset_url = null;
        }

        return true;
    }

    private function removeDir(string $dir): void {
        $it = new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS);
        $files = new RecursiveIteratorIterator($it,
            RecursiveIteratorIterator::CHILD_FIRST);
        foreach($files as $file) {
            if ($file->isDir()){
                rmdir($file->getPathname());
            } else {
                unlink($file->getPathname());
            }
        }
        rmdir($dir);
    }

    public function getUrl(): string
    {
        return Yii::$app->getUrlManager()->createUrl(['archive/view', 'id' => $this->id, 'title' => $this->title]);
    }

    public function getPath() : string {
        $officeUniqueId = CacheCloud::getInstance()->getOfficeUniqueId();
        return '/uploads/schedule/'.$officeUniqueId;
    }
}
