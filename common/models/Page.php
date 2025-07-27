<?php

namespace common\models;

use common\helper\ImageHelper;
use Yii;
use yii\base\Exception;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;

use common\models\base\Page as BaseThemeDetail;
use common\helper\LabelHelper;
use common\domain\AssetUseCase;

class Page extends BaseThemeDetail
{
    public $image;
    public static $path='/uploads/theme';

    const PAGE_TYPE_TEXT     = 1;
    const PAGE_TYPE_IMAGE    = 2;

    /**
     * @inheritdoc
     */ 
    public function rules(): array
    {
        return [
            //TAMBAHAN
            [['image'], 'file', 'extensions'=>'jpg, gif, png, jpeg','maxSize' => (500 * 1024 * 1024), 'tooBig' => 'Limit is 1MB'],

            [['page_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['content', 'description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['asset_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];        
        
    }

    public static function getArrayPageType(): array
    {
        return [
            //MASTER
            self::PAGE_TYPE_TEXT    => Yii::t('app', 'Text'),
            self::PAGE_TYPE_IMAGE   => Yii::t('app', 'Image'),
        ];
    }

    public static function getOnePageType($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayPageType();
            switch ($_module) {
                case ($_module == self::PAGE_TYPE_TEXT):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::PAGE_TYPE_IMAGE):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }
            return $returnValue;
        }
        else
            return 'null';
    }

    /**
     * fetch stored image file name with complete path
     * @return string
     * @throws Exception
     */
    public function getImageFile(): string
    {
        $directory = self::createBackendDirectory(self::$path);
        return (!empty($this->asset_name)) ? $directory.'/'. $this->asset_name : '';
    }

    public static function createBackendDirectory($path): string
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $path;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return $directory;
    }

    /**
     * fetch stored image url
     * @return string
     */
    public function getImageUrl(): string
    {

        // Set default image if fileName is empty
        $assetName = !empty($fileName) ? $fileName : self::getDefaultImage();
        $filePath = $this->getWebRoot() . self::$path . '/' . $assetName;

        // Check if the file exists
        if (file_exists($filePath)) {
            return Yii::$app->urlManager->baseUrl . self::$path . '/' . $assetName;
        }

        // Return default image if file doesn't exist
        return self::getDefaultImage();
    }

    public static function getDefaultImage(): string
    {
        return str_replace('frontend', 'backend', ImageHelper::getNotAvailable()) ;
    }

    public function getWebRoot() : String
    {
        return str_replace('frontend', 'backend', Yii::getAlias('@webroot'));
    }

    /**
    * Process upload of image
    *
    * @return mixed the uploaded image instance
    */
    public function uploadImage() {
        // get the uploaded file instance. for multiple file uploads
        // the following data will return an array (you may need to use
        // getInstances method)
        $image = UploadedFile::getInstance($this, 'image');

        // if no image was uploaded abort the upload
        if (empty($image)) {
            return false;
        }

        //generate a unique file name
        //$ext = end((explode(".", $image->name)));
        $tmp = explode('.', $image->name);
        $ext = end($tmp);  
        $this->asset_name = Yii::$app->security->generateRandomString().".{$ext}";

        // the uploaded image instance
        return $image;
    }    
    
    /**
    * Process deletion of image
    *
    * @return boolean the status of deletion
    */
    public function deleteImage() {
        $file = $this->getImageFile();

        if(self::deleteFile($file)){
            $this->asset_name = null;
            return true;
        }
        else{
            return false;
        }
    }

    private function deleteFile($file): bool
    {
        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }
        else{
            // check if uploaded file can be deleted on server
            if (!unlink($file)) {
                return false;
            }
            // can delete
            else{
                return true;
            }
        }
    }
}
