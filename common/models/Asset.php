<?php

namespace common\models;

use common\domain\AssetUseCase;
use common\helper\LabelHelper;
use common\models\base\Asset as BaseAsset;
use common\service\CacheService;
use Yii;
use yii\base\Exception;
use yii\web\UploadedFile;

/**
 * This is the model class for table "tx_asset".
 */
class Asset extends BaseAsset
{
    public $asset;

    public $file;
    public $url;

    const IS_VISIBLE_PRIVATE          = 1;
    const IS_VISIBLE_PUBLIC           = 2;

    const ASSET_TYPE_WORD             = 1;
    const ASSET_TYPE_SPREADSHEET      = 2;
    const ASSET_TYPE_IMAGE            = 3;
    const ASSET_TYPE_COMPRESSION      = 4;
    const ASSET_TYPE_PDF              = 5;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['is_visible','asset_category_id'], 'required'],
            [['asset'], 'file', 'maxSize' => (1024 * 1024 * 20), 'tooBig' => 'Limit is 20MB'],

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

    public function beforeSave($insert): bool
    {
        if ($this->isNewRecord) {
            $this->download_counter     = 0;
            $this->view_counter         = 0;
        }

        return parent::beforeSave($insert);
    }

    public static function getArrayIsVisible(): array
    {
        return [
            //MASTER
            self::IS_VISIBLE_PRIVATE => Yii::t('app', 'Private'),
            self::IS_VISIBLE_PUBLIC  => Yii::t('app', 'Public'),
        ];
    }

    public static function getOneIsVisible($_module = null): string
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsVisible();

            switch ($_module) {
                case ($_module == self::IS_VISIBLE_PRIVATE):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                case ($_module == self::IS_VISIBLE_PUBLIC):
                    $returnValue = LabelHelper::getYes($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return '-';
    }

    public static function getArrayAssetType(): array
    {
        return [
            //MASTER
            self::ASSET_TYPE_WORD => Yii::t('app', 'Word'),
            self::ASSET_TYPE_SPREADSHEET  => Yii::t('app', 'Spreadsheet'),
            self::ASSET_TYPE_IMAGE  => Yii::t('app', 'Image'),
            self::ASSET_TYPE_COMPRESSION  => Yii::t('app', 'Compression'),
            self::ASSET_TYPE_PDF  => Yii::t('app', 'Pdf'),
        ];
    }
    public static function getOneAssetType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayAssetType();

            switch ($_module) {
                case ($_module == self::ASSET_TYPE_WORD):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_SPREADSHEET):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_IMAGE):
                    $returnValue = LabelHelper::getSecondary($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_COMPRESSION):
                    $returnValue = LabelHelper::getDanger($arrayModule[$_module]);
                    break;
                case ($_module == self::ASSET_TYPE_PDF):
                    $returnValue = LabelHelper::getInfo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault($arrayModule[$_module]);
            }

            return $returnValue;

        }
        else
            return;
    }

    // Public static method to return the file types array
    public static function getArrayFileExtension(): array
    {
        return [
            self::ASSET_TYPE_SPREADSHEET => ['xlsx', 'xls'],
            self::ASSET_TYPE_IMAGE       => ['jpg', 'jpeg', 'png', 'gif'],
            self::ASSET_TYPE_WORD        => ['doc', 'docx'],
            self::ASSET_TYPE_COMPRESSION => ['zip', 'rar'],
            self::ASSET_TYPE_PDF         => ['pdf'],
        ];
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

    public function getPath() : string {
        $officeUniqueId = CacheService::getInstance()->getOfficeUniqueId();
        return '/uploads/asset/'.$officeUniqueId;
    }

    /**
     * fetch stored asset file name with complete path
     * @return string
     * @throws Exception
     */
    public function getAssetFile(): ?string
    {
        return AssetUseCase::getFile($this->getPath(),$this->asset_name);
    }

    /**
     * Generates a URL pointing to a file on the server (image, PDF, etc.).
     * fetch stored asset url
     * @return string
     */
    public function getAssetUrl(): string
    {
        return AssetUseCase::getFileUrl($this->getPath(), $this->asset_name);
    }

    /**
     * Generates a URL pointing to a Yii controller action for routing requests
     * @return string
     */
    public function getUrl(): string
    {
        return Yii::$app->getUrlManager()->createUrl(['asset/view', 'id' => $this->id,
            'title' => $this->title]);
    }

    /**
    * Process upload of asset
    *
    * @return mixed the uploaded asset instance
    */
    public function uploadAsset() {
        // Get the uploaded file instance
        $asset = UploadedFile::getInstance($this, 'asset');

        // Abort if no asset is uploaded
        if (!$asset) {
            return false;
        }

        // Store the source file name as title if it's empty
        if (empty($this->title)) {
            $this->title = $asset->name;
        }

        // Generate a unique file name
        $baseTitle = preg_replace('/[.,\/\s]/', '_', pathinfo($this->title, PATHINFO_FILENAME));
        $ext = pathinfo($asset->name, PATHINFO_EXTENSION);
        $this->asset_name = "{$baseTitle}_" . uniqid() . ".{$ext}";

        // Return the uploaded asset instance
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

//    public function getProceedButton(): string
//    {
//        $button = Html::a(
//            IconHelper::getImport().' '.Yii::t('app', 'Import'),
//            ['import','id'=>$this->id,'title'=>$this->title],
//            ['class' => 'btn btn-sm btn-info pull-right']
//        );
//        $asset = $this->getAssetFile();
//        if(!file_exists($asset)){
//            $button = Html::a(
//                IconHelper::getAdd().' '.Yii::t('app', 'Upload'),
//                ['asset/update','id'=>$this->id,'title'=>$this->title],
//                ['class' => 'btn btn-sm btn-danger pull-right']
//            );
//        }
//        return $button;
//    }
//
//    public function getUpdateButton(): string
//    {
//        return Html::a(
//            IconHelper::getView(),
//            ['asset/view','id'=>$this->id,'title'=>$this->title],
//            ['class' => 'btn btn-sm btn-primary pull-right']
//        );
//    }
}
