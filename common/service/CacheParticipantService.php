<?php
namespace common\service;

use common\models\AuthAssignment;
use common\models\Staff;
use Yii;
use yii\web\ForbiddenHttpException;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//SINGLETON CLASS
class CacheParticipantService {

    private static ?CacheParticipantService $instance = null;
    private string $cacheOfficeId;
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
        $this->combineCache         = Yii::$app->user->identity->id.Yii::$app->user->identity->username;
    }

    public static function getInstance(): ?CacheParticipantService
    {
        if (self::$instance === null) {
            self::$instance = new CacheParticipantService();
        }
        return self::$instance;
    }

    public function getOfficeId(){
        return Yii::$app->cache->getOrSet($this->cacheOfficeId.$this->combineCache, function () {
            $model = Staff::find()->where(['user_id' => $this->userId])->one();
            return $model->office_id;
        });
    }

}
