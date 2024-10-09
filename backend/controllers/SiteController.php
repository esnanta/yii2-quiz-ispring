<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Employment;
use common\models\Office;
use common\models\Participant;
use common\models\Schedule;
use common\models\ScheduleDetail;
use common\models\Staff;
use common\models\UserDektrium;
use common\service\CacheService;
use common\service\ScheduleService;
use Exception;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;

/**
 * Site controller
 */
class SiteController extends Controller
{

    private $scheduleService;

    public function __construct($id, $module, ScheduleService $scheduleService, $config = [])
    {
        $this->scheduleService = $scheduleService;
        parent::__construct($id, $module, $config);
    }

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
                        'actions' => ['login', 'error','get-schedules'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index','chart','message','flush','summary',
										'create-owner','create-regular'],
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
        $authItemName   = CacheService::getInstance()->getAuthItemName();

        if ($authItemName == Yii::$app->params['userRoleRegular']) :
            $this->redirect(str_replace('admin/site', '', 'site/index'));
        endif;
        
        if (!Yii::$app->user->isGuest) {
            $officeId       = CacheService::getInstance()->getOfficeId();
            $staffId        = CacheService::getInstance()->getStaffId();
            $authItemName   = CacheService::getInstance()->getAuthItemName();

            $office     = Office::find()->where(['id' => $officeId])->one();
            $staff      = Staff::find()->where(['id' => $staffId])->one();

            $countOfflineParticipant = Participant::find('id')
                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_INACTIVE])
                ->count();

            $countOnlineParticipant = Participant::find('id')
                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_ACTIVE])
                ->count();

            $dateStart = date(Yii::$app->params['datetimeSaveFormat'], strtotime('today midnight'));
            $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('today 23:59:59'));
            $now = date(Yii::$app->params['datetimeSaveFormat']);

            $countAllSchedule = Schedule::find('id')
                ->where(['office_id'=>$officeId])
                ->andWhere(['between', 'date_start', $dateStart, $dateEnd])
                ->count();

            $countNotStartSchedule = Schedule::find('id')
                ->where(['office_id'=>$officeId])
                ->andWhere(['>', 'date_start', $now])
                ->count();


            $schedules = $this->scheduleService->getScheduleOneMonth($officeId);

            return $this->render('index', [
                'office'=>$office,
                'staff'=>$staff,
                'authItemName'=>$authItemName,
                'countOfflineParticipant' => $countOfflineParticipant,
                'countOnlineParticipant' => $countOnlineParticipant,
                'countAllSchedule' => $countAllSchedule,
                'countNotStartSchedule' => $countNotStartSchedule,
                'schedules' => $schedules
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionGetSchedules(): array
    {
        $officeId = CacheService::getInstance()->getOfficeId();
        return $this->scheduleService->getScheduleAsJson($officeId);
    }

    public function actionFlush()
    {
        if (Yii::$app->user->identity->isAdmin) {
            CacheService::getInstance()->Flush();
            $this->redirect('index');
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
    
    
    public function actionCreateOwner()
    {
        if (Yii::$app->user->can('create-user-owner')) {
            $model          = new UserDektrium();
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


    /**
     * @throws Exception
     * @throws Throwable
     * @throws ForbiddenHttpException
     */
    public function actionCreateRegular()
    {
        if (Yii::$app->user->can('create-user-regular')) {
            $officeId   = CacheService::getInstance()->getOfficeId();
            $authItemName   = CacheService::getInstance()->getAuthItemName();

            $canCreateRegular = false;
            if ($authItemName == Yii::$app->params['userRoleAdmin'] ||
                $authItemName == Yii::$app->params['userRoleOwner']) {
                $canCreateRegular = true;
            }

            if ($canCreateRegular) {
                $model          = new UserDektrium;
                $userTypeList[] = [Yii::$app->params['userRoleRegular'] => 'Staff'];

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
                        return $this->render('create_user_regular', [
                            'model' => $model,
                            'employmentList' => $employmentList,
                            'userTypeList' => $userTypeList,
                        ]);
                    }
                } catch (\Exception|\Throwable $e) {
                    $transaction->rollBack();
                    throw $e;
                }
            } else {
                MessageHelper::getFlashAccessDenied();
                throw new ForbiddenHttpException;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }


    }
}
