<?php

namespace common\models;

use common\helper\CacheCloud;
use common\helper\UIHelper;
use Yii;
use yii\bootstrap5\Html;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;

use \common\models\base\Asset as BaseAsset;

/**
 * This is the model class for table "tx_asset".
 */
class Asset extends BaseAsset
{
    public $asset;

    //HANYA UNTUK INFO DI VIEW BACKEND
    public $file;
    public $url;
    //END HANYA UNTUK INFO DI VIEW BACKEND


    const IS_VISIBLE_PRIVATE            = 1;
    const IS_VISIBLE_PUBLIC             = 2;

    const ASSET_TYPE_DOCUMENT         = 1;
    const ASSET_TYPE_SPREADSHEET      = 2;
    const ASSET_TYPE_IMAGE            = 3;
    const ASSET_TYPE_COMPRESSION      = 4;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['is_visible','asset_category_id'], 'required'],
            [['asset'], 'file', 'maxSize' => (1024 * 1024 * 2), 'tooBig' => 'Limit is 2MB'],

            [['office_id', 'is_visible', 'asset_type', 'asset_category_id', 'size', 'view_counter', 'download_counter', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['date_issued', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title', 'asset_name'], 'string', 'max' => 200],
            [['asset_url'], 'string', 'max' => 500],
            [['mime_type'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }
    
    
    
    public function beforeSave($insert) {
        if ($this->isNewRecord) {
            $this->download_counter     = 0;
            $this->view_counter         = 0;
        }

        return parent::beforeSave($insert);
    }

    public static function getArrayIsVisible()
    {
        return [
            //MASTER
            self::IS_VISIBLE_PRIVATE => Yii::t('app', 'Private'),
            self::IS_VISIBLE_PUBLIC  => Yii::t('app', 'Public'),
        ];
    }

    public static function getOneIsVisible($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsVisible();

            switch ($_module) {
                case ($_module == self::IS_VISIBLE_PRIVATE):
                    $returnValue = UIHelper::getNo($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_VISIBLE_PUBLIC):
                    $returnValue = UIHelper::getYes($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = UIHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
    }

    public static function getArrayAssetType(): array
    {
        return [
            //MASTER
            self::ASSET_TYPE_DOCUMENT => Yii::t('app', 'Word'),
            self::ASSET_TYPE_SPREADSHEET  => Yii::t('app', 'Spreadsheet'),
            self::ASSET_TYPE_IMAGE  => Yii::t('app', 'Image'),
            self::ASSET_TYPE_COMPRESSION  => Yii::t('app', 'Compression'),
        ];
    }
    public static function getOneAssetType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayAssetType();

            switch ($_module) {
                case ($_module == self::ASSET_TYPE_DOCUMENT):
                    $returnValue = UIHelper::getAssetTypeDocument($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_SPREADSHEET):
                    $returnValue = UIHelper::getAssetTypeSpreadsheet($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_IMAGE):
                    $returnValue = UIHelper::getAssetTypeImage($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_COMPRESSION):
                    $returnValue = UIHelper::getAssetTypeCompression($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = UIHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
    }

    public function downloadFile($path) {
        if (!empty($path)) {
            //header("Content-type:application/pdf"); //for pdf file

            header('Content-Type:text/plain; charset=ISO-8859-15');
            //if you want to read text file using text/plain header
            header('Content-Disposition: attachment; filename="' . basename($path) . '"');
            header('Content-Length: ' . filesize($path));
            readfile($path);

            $this->download_counter = $this->download_counter+1;
            $this->save();

            Yii::app()->end();
        }
    }

    private function getWebRoot() : String
    {
        return str_replace('frontend', 'backend', Yii::getAlias('@webroot'));
    }

    /**
     * fetch stored asset file name with complete path
     * @return string
     */
    public function getAssetFile(): ?string
    {
        $directory  = $this->getWebRoot() . $this->getPath();
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
        $directory = $this->getWebRoot() . $this->getPath();

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
        $asset = UploadedFile::getInstance($this, 'asset');

        // if no asset was uploaded abort the upload
        if (empty($asset)) {
            return false;
        }

        // store the source file name
        if($this->title==''){
            $this->title = $asset->name;
        }

        //generate a unique file name
        //$ext = end((explode(".", $asset->name)));
        $deleteExt          = substr($this->title, 0, strpos($this->title, "."));
        $replaceSpace       = str_replace(' ','_', $deleteExt);
        $replaceSlash       = str_replace('/','_', $replaceSpace);
        $replaceComma       = str_replace(',','_', $replaceSlash);
        $replaceDot         = str_replace('.','_', $replaceComma);
        $title              = $replaceDot;
        $tmp                = explode('.', $asset->name);
        $ext                = end($tmp);          
        $this->asset_name    = $title.'_'.uniqid().".{$ext}";
        
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

    public function getUrl(): string
    {
        return Yii::$app->getUrlManager()->createUrl(['asset/view', 'id' => $this->id, 'title' => $this->title]);
    }

    public function getPath() : string {
        $officeUniqueId = CacheCloud::getInstance()->getOfficeUniqueId();
        return '/uploads/asset/'.$officeUniqueId;
    }

    public function getProceedButton(): string
    {
        $button = Html::a(
            '<i class="fas fa-file-import"></i> '.Yii::t('app', 'Import'),
            ['import','id'=>$this->id,'title'=>$this->title],
            ['class' => 'btn btn-sm btn-info pull-right']
        );
        $asset = $this->getAssetFile();
        if(!file_exists($asset)){
            $button = Html::a(
                '<i class="fas fa-plus"></i> '.Yii::t('app', 'Upload'),
                ['asset/update','id'=>$this->id,'title'=>$this->title],
                ['class' => 'btn btn-sm btn-danger pull-right']
            );
        }
        return $button;
    }

    public function getUpdateButton(): string
    {
        return Html::a(
            '<i class="fas fa-eye"></i>',
            ['asset/view','id'=>$this->id,'title'=>$this->title],
            ['class' => 'btn btn-sm btn-primary pull-right']
        );
    }
}
