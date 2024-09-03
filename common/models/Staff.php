<?php

namespace common\models;

use common\helper\UIHelper;
use common\models\base\Staff as BaseStaff;
use common\service\CacheService;
use Yii;
use yii\helpers\FileHelper;

/**
 * This is the model class for table "tx_staff".
 */
class Staff extends BaseStaff
{
    /**
     * @inheritdoc
     */
    const GENDER_MALE           = 1;
    const GENDER_FEMALE         = 2;

    const ACTIVE_STATUS_YES     = 1;
    const ACTIVE_STATUS_NO      = 2;

    //public $image;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //TAMBAHAN
            [['image'], 'file', 'extensions'=>'jpg, gif, png, jpeg','maxSize' => (500 * 1024), 'tooBig' => 'Limit is 500KB'],

            [['user_id', 'office_id', 'employment_id', 'gender_status', 'active_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['address', 'description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title', 'identity_number', 'email'], 'string', 'max' => 100],
            [['initial'], 'string', 'max' => 10],
            [['phone_number'], 'string', 'max' => 50],
            [['asset_name'], 'string', 'max' => 200],
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
            $this->active_status    = self::ACTIVE_STATUS_YES;
        }

        return true;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User'),
            'office_id' => Yii::t('app', 'Office'),
            'employment_id' => Yii::t('app', 'Employment'),
            'title' => Yii::t('app', 'Title'),
            'initial' => Yii::t('app', 'Initial'),
            'identity_number' => Yii::t('app', 'Identity Number'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'gender_status' => Yii::t('app', 'Gender Status'),
            'active_status' => Yii::t('app', 'Active Status'),
            'address' => Yii::t('app', 'Address'),
            'asset_name' => Yii::t('app', 'File Name'),
            'email' => Yii::t('app', 'Email'),
            'description' => Yii::t('app', 'Description'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    public static function getArrayGenderStatus()
    {
        return [
            //MASTER
            self::GENDER_MALE       => Yii::t('app', 'Male'),
            self::GENDER_FEMALE     => Yii::t('app', 'Female'),
        ];
    }

    public static function getOneGenderStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayGenderStatus();
            $returnValue = 'Unset';

            switch ($_module) {
                case ($_module == self::GENDER_MALE):
                    $returnValue = UIHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::GENDER_FEMALE):
                    $returnValue = UIHelper::getNo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = UIHelper::getDefault($returnValue);
            }

            return $returnValue;
        }
        else
            return;
    }

    public static function getArrayActiveStatus()
    {
        return [
            //MASTER
            self::ACTIVE_STATUS_YES  => Yii::t('app', 'Yes'),
            self::ACTIVE_STATUS_NO   => Yii::t('app', 'No'),
        ];
    }

    public static function getOneActiveStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayActiveStatus();
            $returnValue = 'Unset';

            switch ($_module) {
                case ($_module == self::ACTIVE_STATUS_YES):
                    $returnValue = UIHelper::getYes($arrayModule[$_module]);
                    break;
                case ($_module == self::ACTIVE_STATUS_NO):
                    $returnValue = UIHelper::getNo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = UIHelper::getDefault($returnValue);
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
    public function getAssetFile($isTemporary=false): string
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getPath();
        if ($isTemporary) :
            $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getTmpPath();
        endif;

        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($this->asset_name)) ? $directory.'/'. $this->asset_name : '';
    }


    public function getAssetUrl(): string
    {
        // return a default image placeholder if your source avatar is not found
        $defaultImage = '/images/if_skype2512x512_197582.png';
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
    * Process deletion of image
    *
    * @return boolean the status of deletion
    */
    public function deleteAsset($isTemporary=false): bool
    {
        $file = $this->getAssetFile($isTemporary);

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        }

        if(!$isTemporary):
            // if deletion successful, reset your file attributes
            $this->asset_name = null;
            $this->title = null;
        endif;

        return true;
    }

    public function getUrl()
    {
        return Yii::$app->getUrlManager()->createUrl(['staff/view', 'id' => $this->id, 'title' => $this->title]);
    }

    public static function getName($id){
        $model = Staff::find()->where(['id'=>$id])->one();
        return $model->title;
    }

    public function getPath() : string {
        $officeUniqueId = CacheService::getInstance()->getOfficeUniqueId();
        return '/uploads/staff/'.$officeUniqueId;
    }

    public function getTmpPath(): string{
        return '/uploads/tmp';
    }
}
