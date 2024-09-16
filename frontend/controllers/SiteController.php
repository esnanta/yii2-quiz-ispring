<?php

namespace frontend\controllers;

use common\models\Assessment;
use common\models\Participant;
use common\models\Schedule;
use common\service\ScheduleDetailService;
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

    private ScheduleDetailService $scheduleDetailService;

    public function __construct($id, $module,
                                ScheduleDetailService $scheduleDetailService, $config = [])
    {
        $this->scheduleDetailService = $scheduleDetailService;
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
                        'actions' => ['logout'],
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
            return $this->redirect(['site/login']);
        } else {
            $tokenForm = new TokenForm();
            $participant = Participant::findone(['username'=>Yii::$app->user->identity->username]);
            $schedules = Schedule::find()
                ->where(['office_id'=>$participant->office_id])
                ->andWhere(['group_id'=>$participant->group_id])
                ->all();

            if ($tokenForm->load(Yii::$app->request->post())) {
                $this->token = $tokenForm->token;
            }

            return $this->render('index',[
                'token' => $this->token,
                'tokenForm' => $tokenForm,
                'participant' => $participant,
                'schedules' => $schedules,
                'scheduleDetailService' => $this->scheduleDetailService
            ]);
        }
    }
    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        $model = new LoginParticipantForm();

        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect('index');
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        try {
            $participant = Participant::findone(['username'=>Yii::$app->user->identity->username]);
            $participant->status = Participant::STATUS_INACTIVE;
            $participant->save();
            Yii::$app->user->logout();
            return $this->goHome();
        } catch (\Exception $e)
        {
            error_log($e);
            echo "Error: " . $e->getMessage();
            return $this->goHome();
        }
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
