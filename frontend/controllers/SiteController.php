<?php

namespace frontend\controllers;

use common\models\Participant;
use common\service\CacheService;
use common\service\ScheduleDetailService;
use common\service\ScheduleService;
use frontend\models\ContactForm;
use frontend\models\LoginParticipantForm;
use frontend\models\TokenForm;
use Yii;
use yii\captcha\CaptchaAction;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\ErrorAction;

/**
 * Site controller
 */
class SiteController extends Controller
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

    /**
     * {@inheritdoc}
     */
    public function behaviors(): array
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout','get-schedules'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions(): array
    {
        return [
            'error' => [
                'class' => ErrorAction::class,
            ],
            'captcha' => [
                'class' => CaptchaAction::class,
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * @throws BadRequestHttpException
     */
    public function beforeAction($action): bool
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }
    
    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['user/login']);
        } else {
            // Check if current user is admin, redirect to admin site index if true
            if (Yii::$app->user->identity->isAdmin ?? false) {
                return $this->redirect(['/admin/site/index']);
            }
            
            $officeId = CacheService::getInstance()->getOfficeIdByProfile();
            $listUpcomingSchedule = $this->scheduleService->getScheduleUpcoming($officeId);
            $listRecentSchedule = $this->scheduleService->getScheduleRecent($officeId);

            return $this->render('index',[
                'listUpcomingSchedule' => $listUpcomingSchedule,
                'listRecentSchedule' => $listRecentSchedule
            ]);
        }
    }

    public function actionGetSchedules(): array
    {
        $officeId = CacheService::getInstance()->getOfficeId();
        return $this->scheduleService->getScheduleAsJson($officeId);
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        }

        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
