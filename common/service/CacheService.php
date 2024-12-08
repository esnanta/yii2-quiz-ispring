<?php
namespace common\service;

use common\models\AuthAssignment;
use common\models\Participant;
use common\models\Staff;
use Yii;
use yii\base\Exception;
use yii\web\ForbiddenHttpException;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


class CacheService {

    private static ?CacheService $instance = null;
    private string $cacheOfficeId;
    private string $cacheOfficeTitle;
    private string $cacheOfficeUniqueId;
    private string $cacheStaffId;
    private string $cacheStaffTitle;
    private string $cacheAuthItemName;
    private string $combineCache;
    
    private $userId;

    /**
     * @throws ForbiddenHttpException
     */
    function __construct()
    {
        if(empty(Yii::$app->user->identity->id)):
            throw new ForbiddenHttpException;
        endif;
        $this->userId               = Yii::$app->user->identity->id;
        $this->cacheOfficeId        = 'office_id';
        $this->cacheOfficeTitle     = 'office_title';
        $this->cacheOfficeUniqueId  = 'office_unique_id';
        $this->cacheStaffId         = 'staff_id';
        $this->cacheStaffTitle      = 'staff_title';
        $this->cacheAuthItemName    = 'auth_item_name';
        $this->combineCache         = Yii::$app->user->identity->id.Yii::$app->user->identity->username;
    }

    public static function getInstance(): ?CacheService
    {
        if (self::$instance === null) {
            self::$instance = new CacheService();
        }
        return self::$instance;
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

    public function getOfficeUniqueId(){
        return Yii::$app->cache->getOrSet($this->cacheOfficeUniqueId.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->office->unique_id;
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

    public function getOfficeIdByParticipant(){
        return Yii::$app->cache->getOrSet($this->cacheOfficeId.$this->combineCache, function () {
            $model = Participant::find()->where(['id' => $this->userId])->one();
            return $model->office_id;
        });
    }

    public function generateCacheKey($type, $id): string
    {
        switch ($type) {
            case $this->getScheduleDetailKey():
                return $this->getScheduleDetailKey().'_' . $id;
            case $this->getParticipantKey():
                // Assuming Yii::$app->user->identity is available
                return $this->getParticipantKey().'_' . $id . '_' . Yii::$app->user->identity->username;
            case 'assessment':
                return $this->getAssessmentKey().'_' . $id;
            default:
                throw new Exception('Invalid cache type provided.');
        }
    }

    /**
     * @throws Exception
     */
    public function destroyCache($id): void
    {
        $cache = Yii::$app->cache;

        // Generate cache keys and delete them
        $cache->delete($this->generateCacheKey($this->getScheduleDetailKey(), $id));
        $cache->delete($this->generateCacheKey($this->getParticipantKey(), $id));
        $cache->delete($this->generateCacheKey($this->getAssessmentKey(), $id));
    }

    public function getScheduleDetailKey(): string
    {
        return 'scheduleDetail';
    }
    public function getParticipantKey(): string
    {
        return 'participant';
    }
    public function getAssessmentKey(): string
    {
        return 'assessment';
    }
}
