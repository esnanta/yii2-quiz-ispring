<?php

namespace backend\controllers;

use common\models\Assessment;
use common\models\Group;
use common\models\Participant;
use common\models\Schedule;
use common\models\Subject;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;

use common\models\Employment;
use common\models\Office;
use common\models\Staff;
use common\models\Theme;

use common\helper\CacheCloud;
use common\helper\MessageHelper;
use common\models\UserDektrium;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'rules' => [
                    [
                        'actions' => ['login', 'error','create-owner','create-reguler'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index','chart','message','flush','summary'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                    'flush' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $authItemName   = CacheCloud::getInstance()->getAuthItemName();

        if ($authItemName == Yii::$app->params['userRoleReguler']) :
            $this->redirect(str_replace('admin/site', '', 'site/index'));
        endif;
        
        if (!Yii::$app->user->isGuest) {
            $officeId       = CacheCloud::getInstance()->getOfficeId();
            $staffId        = CacheCloud::getInstance()->getStaffId();
            $authItemName   = CacheCloud::getInstance()->getAuthItemName();

            $office     = Office::find()->where(['id' => $officeId])->one();
            $staff      = Staff::find()->where(['id' => $staffId])->one();

            $countOfflineParticipant = Participant::find('id')
                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_INACTIVE])
                ->count();

            $countOnlineParticipant = Participant::find('id')
                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_ACTIVE])
                ->count();

            $countSchedule = Schedule::find('id')
                ->where(['office_id'=>$officeId])
                ->count();

            $countAssessment = Assessment::find('id')
                ->where(['office_id'=>$officeId])
                ->count();

            return $this->render('index', [
                'office'=>$office,
                'staff'=>$staff,
                'authItemName'=>$authItemName,
                'countOfflineParticipant' => $countOfflineParticipant,
                'countOnlineParticipant' => $countOnlineParticipant,
                'countSchedule' => $countSchedule,
                'countAssessment' => $countAssessment
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionFlush()
    {
        if (Yii::$app->user->identity->isAdmin) {
            CacheCloud::getInstance()->Flush();
            $this->redirect('index');
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
    
    
    public function actionCreateOwner()
    {
        if (Yii::$app->user->identity->isAdmin) {
            $model          = new UserDektrium;
            $userTypeList[] = [Yii::$app->params['userRoleOwner'] => 'Owner'];

            $transaction    = Yii::$app->db->beginTransaction();
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                        'item_name'         => $model->user_type,
                        'user_id'           => $model->id,
                        'created_at'        => time(),
                    ])->execute();

                    $office = new Office;
                    $office->user_id        = $model->id;
                    $office->title          = $model->office_title;
                    $office->email          = $model->email;
                    $office->save();

                    $employment = new Employment;
                    $employment->office_id  = $office->id; //OFFICE
                    $employment->title      = 'Manager';
                    $employment->sequence   = '1';
                    $employment->save();

                    $staff = new Staff;
                    $staff->office_id       = $office->id; //OFFICE
                    $staff->user_id         = $model->id; //USER
                    $staff->employment_id   = $employment->id; //EMPLOYMENT
                    $staff->title           = $model->staff_title;
                    $staff->save();

                    $themTypeList   = Theme::getArrayThemeType();
                    foreach ($themTypeList as $i => $themeType) {
                        $theme = new Theme();
                        $theme->office_id = $office->id;
                        $theme->theme_type = $i;
                        $theme->title = $themeType;
                        $theme->description = $themeType;
                        $theme->save();
                    }

                    $transaction->commit();

                    return $this->redirect(['/user/admin/index']);
                } else {
                    return $this->render('create_user_owner', [
                        'model' => $model,
                        'userTypeList'=>$userTypeList
                    ]);
                }
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            } catch (\Throwable $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
    
    
    public function actionCreateReguler()
    {
        $officeId   = CacheCloud::getInstance()->getOfficeId();
        $authItemName   = CacheCloud::getInstance()->getAuthItemName();
        
        $canCreateReguler = false;
        if ($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']) {
            $canCreateReguler = true;
        }

        if ($canCreateReguler==true) {
            $model          = new UserDektrium;
            $userTypeList[] = [Yii::$app->params['userRoleReguler'] => 'Staff'];

            $employmentList = ArrayHelper::map(Employment::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');
            
            $transaction    = Yii::$app->db->beginTransaction();
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                        'item_name'         => $model->user_type,
                        'user_id'           => $model->id,
                        'created_at'        => time(),
                    ])->execute();

                    $staff = new Staff;
                    $staff->office_id       = $officeId; //OFFICE
                    $staff->user_id         = $model->id; //USER
                    $staff->employment_id   = $model->employment_id; //EMPLOYMENT
                    $staff->title           = $model->staff_title;
                    $staff->save();

                    $transaction->commit();

                    return $this->redirect(['/staff/index']);
                } else {
                    return $this->render('create_user_reguler', [
                        'model' => $model,
                        'employmentList' => $employmentList,
                        'userTypeList' => $userTypeList,
                    ]);
                }
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            } catch (\Throwable $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
