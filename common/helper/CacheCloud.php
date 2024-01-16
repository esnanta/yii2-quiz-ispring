<?php
namespace common\helper;

use backend\models\AuthAssignment;
use backend\models\Office;
use backend\models\Staff;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use Yii;

class CacheCloud {

    private $cache;
    private $cacheOfficeId;
    private $cacheOfficeTitle;
    private $cacheStaffId;
    private $cacheStaffTitle;
    private $cacheAuthItemName;
    private $combineCache;
    
    private $userId;

    function __construct()
    {
        $this->userId               = Yii::$app->user->identity->id;
        $this->cacheOfficeId        = 'office_id';
        $this->cacheOfficeTitle     = 'office_title';
        $this->cacheStaffId         = 'staff_id';
        $this->cacheStaffTitle      = 'staff_title';
        $this->cacheAuthItemName    = 'auth_item_name';
        $this->combineCache         = Yii::$app->user->identity->id.Yii::$app->user->identity->username;
    }


    public function Flush(){
        Yii::$app->cache->flush();
        Yii::$app->getSession()->setFlash('success', [
            'message' => Yii::t('app', 'Cache Flushed'),
        ]);
    }

    public function getOfficeId(){
        return Yii::$app->cache->getOrSet($this->cacheOfficeId.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->office_id;
        });
    }

    public function getOfficeTitle(){
        return Yii::$app->cache->getOrSet($this->cacheOfficeTitle.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->office->title;
        });
    }

    public function getStaffId(){
        return Yii::$app->cache->getOrSet($this->cacheStaffId.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->id;
        });
    }

    public function getStaffTitle(){
        return Yii::$app->cache->getOrSet($this->cacheStaffTitle.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->title;
        });
    }
    
    public function getAuthItemName(){
        return Yii::$app->cache->getOrSet($this->cacheAuthItemName.$this->combineCache, function () {
            $model = AuthAssignment::find()->where(['user_id' => $this->userId])->one();
            return $model->item_name;
        });
    }
}
