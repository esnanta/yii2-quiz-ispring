<?php

namespace frontend\controllers;

use common\models\Profile;
use common\models\Schedule;
use common\service\CacheService;
use common\service\ScheduleDetailService;
use common\service\ScheduleService;
use frontend\models\TokenForm;
use Yii;
use yii\data\ArrayDataProvider;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * ScheduleController implements the CRUD actions for Schedule model.
 */
class ScheduleController extends Controller
{

    public $enableCsrfValidation = false;
    private string $token = '';
    private ScheduleService $scheduleService;
    private ScheduleDetailService $scheduleDetailService;
    private TokenForm $tokenForm;
    public function __construct($id, $module,
                                ScheduleService $scheduleService,
                                ScheduleDetailService $scheduleDetailService,
                                TokenForm $tokenForm,
        $config = [])
    {
        $this->scheduleService = $scheduleService;
        $this->scheduleDetailService = $scheduleDetailService;
        $this->tokenForm = $tokenForm;
        parent::__construct($id, $module, $config);
    }

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['site/login']);
        } else {

            $officeId = CacheService::getInstance()->getOfficeId();
            $profile = Profile::findone([
                'office_id' => $officeId,
                'user_id'=>Yii::$app->user->identity->id
            ]);

            $listUpcomingSchedule = $this->scheduleService
                ->getScheduleUpcomingByGroup($officeId,$profile->group_id);
            $listRecentSchedule = $this->scheduleService
                ->getScheduleRecentByGroup($officeId,$profile->group_id);

            if ($this->tokenForm->load(Yii::$app->request->post())) {
                $this->token = $this->tokenForm->token;
            }

            return $this->render('index',[
                'token' => $this->token,
                'tokenForm' => $this->tokenForm,
                'profile' => $profile,
                'listUpcomingSchedule' => $listUpcomingSchedule,
                'listRecentSchedule' => $listRecentSchedule,
                'scheduleDetailService' => $this->scheduleDetailService
            ]);
        }
    }

    /**
     * Displays a single Schedule model.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException|NotFoundHttpException
     * @throws \yii\db\Exception
     */
    public function actionView($id, $title = null)
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['site/login']);
        } else {

            $model = $this->findModel($id);
            $scheduleDetailService = new ScheduleDetailService();

            $providerScheduleDetail = new ArrayDataProvider([
                'allModels' => $model->scheduleDetails,
            ]);
            $providerAssessment = new ArrayDataProvider([
                'allModels' => $model->assessments,
            ]);

            $participantList = Participant::find()
                ->where(['office_id' => $model->office_id, 'group_id' => $model->group_id])
                ->all();

            // Use ScheduleService for token and countdown logic
            list($countdownTime, $interval, $tokenMessage) =
                $this->scheduleService->handleTokenAndCountdown($model);

            return $this->render('view', [
                'model' => $model,
                'providerScheduleDetail' => $providerScheduleDetail,
                'providerAssessment' => $providerAssessment,
                'participantList' => $participantList,
                'countdownTime' => $countdownTime,
                'interval' => $interval,
                'tokenMessage' => $tokenMessage,  // Pass token status message
                'minutesTolerance' => $this->scheduleService->getMinutesTolerance(),
                'scheduleDetailService' => $scheduleDetailService
            ]);
        }
    }

    /**
     * Finds the Schedule model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Schedule the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id): Schedule
    {
        if (($model = Schedule::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
