<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Office;
use common\models\Schedule;
use common\models\Staff;
use common\models\UserDektrium;
use common\service\CacheService;
use common\service\ScheduleService;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
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

            $countOfflineParticipant = 0;
//                Participant::find('id')
//                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_INACTIVE])
//                ->count();

            $countOnlineParticipant = 0;
//                Participant::find('id')
//                ->where(['office_id'=>$officeId,'status'=>Participant::STATUS_ACTIVE])
//                ->count();

            $dateStart = date(Yii::$app->params['datetimeSaveFormat'], strtotime('today midnight'));
            $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('today 23:59:59'));
            $now = date(Yii::$app->params['datetimeSaveFormat']);

            $countAllSchedule = Schedule::find('id')
                ->where(['office_id'=>$officeId])
                ->andWhere(['between', 'date_start', $dateStart, $dateEnd])
                ->count();

            $countUpcomingSchedule = Schedule::find('id')
                ->where(['office_id'=>$officeId])
                ->andWhere(['>', 'date_start', $now])
                ->count();


            $listUpcomingSchedule = $this->scheduleService->getScheduleUpcoming($officeId);
            $listRecentSchedule = $this->scheduleService->getScheduleRecent($officeId);

            return $this->render('index', [
                'office'=>$office,
                'staff'=>$staff,
                'authItemName'=>$authItemName,
                'countOfflineParticipant' => $countOfflineParticipant,
                'countOnlineParticipant' => $countOnlineParticipant,
                'countAllSchedule' => $countAllSchedule,
                'countUpcomingSchedule' => $countUpcomingSchedule,
                'listUpcomingSchedule' => $listUpcomingSchedule,
                'listRecentSchedule' => $listRecentSchedule
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
}
