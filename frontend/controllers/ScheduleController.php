<?php

namespace frontend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\Participant;
use common\models\Schedule;
use common\models\ScheduleDetail;
use common\service\CacheService;
use common\service\ScheduleDetailService;
use common\service\ScheduleService;
use frontend\models\TokenForm;
use Yii;
use yii\base\Exception;
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

            $participant = Participant::findone(['username'=>Yii::$app->user->identity->username]);
            $listSchedules = $this->scheduleService->getScheduleOneMonthByParticipant(
                $participant->office_id,$participant->group_id);

            if ($this->tokenForm->load(Yii::$app->request->post())) {
                $this->token = $this->tokenForm->token;
            }

            return $this->render('index',[
                'token' => $this->token,
                'tokenForm' => $this->tokenForm,
                'participant' => $participant,
                'listSchedules' => $listSchedules,
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
     * Logs out the current user.
     * $id = Schedule Detail Id
     * Example link :
     * http://www.mywebsite.com/presentation/index.html?USER_NAME=John&USER_EMAIL=john@ispringsolutions.com&ADDRESS=NYC
     * @throws Exception
     */
//    public function actionOpen($id, $title=null)
//    {
//        $scheduleDetail = ScheduleDetail::findOne($id);
//        $scheduleDetailService = new ScheduleDetailService();
//        $participant = Participant::findone([
//            'office_id' => $scheduleDetail->office_id,
//            'username'=>Yii::$app->user->identity->username]);
//
//        $assessment = new Assessment();
//        $assessment->schedule_detail_id = $scheduleDetail->id;
//        $assessment->office_id = $scheduleDetail->office_id;
//        $assessment->schedule_id = $scheduleDetail->schedule_id;
//        $assessment->participant_id = $participant->id;
//        $assessment->period_id = $scheduleDetail->schedule->period_id;
//        $assessment->group_id = $scheduleDetail->schedule->group_id;
//        $assessment->subject_id = $scheduleDetail->subject_id;
//        $assessment->question_type = $scheduleDetail->question_type;
//        $assessment->exam_type = $scheduleDetail->schedule->exam_type;
//        $assessment->save();
//
//        $textLink = $scheduleDetailService->generateTextLink($scheduleDetail,$this->scheduleService);
//        $this->redirect($textLink);
//    }

    public function actionOpen($id, $title = null)
    {
        // Initialize cache
        $cache = Yii::$app->cache;
        $scheduleDetailKey = CacheService::getInstance()->getScheduleDetailKey();
        $participantKey = CacheService::getInstance()->getParticipantKey();
        $assessmentKey = CacheService::getInstance()->getAssessmentKey();

        // Use the helper function to generate cache keys
        $scheduleDetailCacheKey = CacheService::getInstance()->generateCacheKey($scheduleDetailKey, $id);
        $participantCacheKey = CacheService::getInstance()->generateCacheKey($participantKey, $id);
        $assessmentCacheKey = CacheService::getInstance()->generateCacheKey($assessmentKey, $id);

        // ScheduleDetail cache handling
        $scheduleDetail = $cache->get($scheduleDetailCacheKey);
        if ($scheduleDetail === false) {
            // Cache miss, fetch data and store in cache
            $scheduleDetail = ScheduleDetail::findOne($id);
            $cache->set($scheduleDetailCacheKey, $scheduleDetail);
        }

        // ScheduleDetailService
        $scheduleDetailService = new ScheduleDetailService();

        // Participant cache handling
        $participant = $cache->get($participantCacheKey);
        if ($participant === false) {
            // Cache miss, fetch data and store in cache
            $participant = Participant::findOne([
                'office_id' => $scheduleDetail->office_id,
                'username' => Yii::$app->user->identity->username,
            ]);
            $cache->set($participantCacheKey, $participant);
        }

        // Assessment cache handling
        $assessment = $cache->get($assessmentCacheKey);
        if ($assessment === false) {
            $assessment = new Assessment();
            $assessment->schedule_detail_id = $scheduleDetail->id;
            $assessment->office_id = $scheduleDetail->office_id;
            $assessment->schedule_id = $scheduleDetail->schedule_id;
            $assessment->participant_id = $participant->id;
            $assessment->period_id = $scheduleDetail->schedule->period_id;
            $assessment->group_id = $scheduleDetail->schedule->group_id;
            $assessment->subject_id = $scheduleDetail->subject_id;
            $assessment->question_type = $scheduleDetail->question_type;
            $assessment->exam_type = $scheduleDetail->schedule->exam_type;
            $assessment->save();

            // Cache the assessment after saving
            $cache->set($assessmentCacheKey, $assessment);
        }

        // Redirect to the generated text link
        $textLink = $scheduleDetailService->generateTextLink($scheduleDetail, $this->scheduleService);
        return $this->redirect($textLink);
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
