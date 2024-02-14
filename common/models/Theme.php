<?php

namespace common\models;

use Yii;
use yii\helpers\FileHelper;
use \common\models\base\Theme as BaseTheme;

/**
 * This is the model class for table "tx_theme".
 */
class Theme extends BaseTheme
{
    
    public $image;
    public static $path='/uploads/theme';  
    
    const LOGO_FRONTEND_HEADER  = 1;
    const LOGO_FRONTEND_FOOTER  = 2;
    
    const LOGO_BACKEND_HEADER   = 3;
    const LOGO_BACKEND_FOOTER   = 4;

    const LOGO_HEADER_REPORT    = 5;
    const LOGO_HEADER_INVOICE   = 6;
    
    const CONTENT_TITLE         = 7;
    const CONTENT_TEXT          = 8;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['office_id'], 'required'],
            [['image'], 'file', 'extensions'=>'jpg, gif, png, jpeg','maxSize' => (500 * 1024 * 1024), 'tooBig' => 'Limit is 1MB'],                        
            
            [['office_id', 'theme_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['content', 'description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['asset_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']      
        ]; 
    }
    
    public static function getArrayThemeType()
    {
        return [
            self::LOGO_FRONTEND_HEADER  => 'Logo Frontend Header',
            self::LOGO_FRONTEND_FOOTER  => 'Logo Frontend Footer',
            self::LOGO_BACKEND_HEADER   => 'Logo Backend Header',
            self::LOGO_BACKEND_FOOTER   => 'Logo Backend Footer',
            self::LOGO_HEADER_REPORT    => 'Logo Report',
            self::LOGO_HEADER_INVOICE   => 'Logo Invoice',
            self::CONTENT_TITLE         => 'Title',
            self::CONTENT_TEXT          => 'Content',
        ];
    }
    
    public static function getOneThemeType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayThemeType();
            $returnValue = 'NULL';

            switch ($_module) {

                default:
                    $returnValue = $arrayModule[$_module];
            }

            return $returnValue;

        }
        else
            return;
    }
    
    
    public static function getArraySocMed()
    {
        return [
            //MASTER
            self::SOCMED_ICONS_1  => 'Fecebook',
            self::SOCMED_ICONS_2  => 'Twitter',
            self::SOCMED_ICONS_3  => 'Youtube',
            self::SOCMED_ICONS_4  => 'Instagram',
            self::SOCMED_ICONS_5  => 'Github',
        ];
    }
    
    public static function getOneSocMed($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsVisible();
            $returnValue = 'NULL';

            switch ($_module) {
                
                default:
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }
    
    /**
     * fetch stored image file name with complete path 
     * @return string
     */
    public function getImageFile() 
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . self::$path;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);      
        }

        return (!empty($this->asset_name)) ? $directory.'/'. $this->asset_name : '';
    }   
    
    /**
     * fetch stored image url
     * @return string
     */
    public function getImageUrl() 
    {
        // return a default image placeholder if your source avatar is not found';
        $defaultPicture = 'NULL';
        $_module        = $this->theme_type;
        
        if(!isset($this->asset_name)){
            switch ($_module) {
                case ($_module == self::LOGO_FRONTEND_HEADER):
                        $defaultPicture = Yii::$app->urlManager->baseUrl .'/images/unify263-marketing/logo.png';
                        break;
                case ($_module == self::LOGO_FRONTEND_FOOTER):
                        $defaultPicture = Yii::$app->urlManager->baseUrl .'/images/unify263-marketing/logo-white.png';
                        break;
                case ($_module == self::LOGO_BACKEND_HEADER):
                    $defaultPicture = Yii::$app->urlManager->baseUrl .'/images/unify263-admin/logo.png';
                    break;
                case ($_module == self::LOGO_BACKEND_FOOTER):
                    $defaultPicture = Yii::$app->urlManager->baseUrl .'/images/unify263-admin/logo-light.png';
                    break;
                default:
                    $defaultPicture = '';
            }
            return $defaultPicture;
        }
        else{
            return Yii::$app->urlManager->baseUrl .self::$path.'/'.$this->asset_name;
        }
        
//        $asset_name = isset($this->asset_name) ? 
//            Yii::$app->urlManager->baseUrl .self::$path.'/'.$this->asset_name : 
//            Yii::$app->urlManager->baseUrl .'/images/no-picture-available-icon-1.jpg';
//        return $asset_name;
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

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        }

        // if deletion successful, reset your file attributes
        $this->asset_name = null;
        //$this->title = null;

        return true;
    }        
}
