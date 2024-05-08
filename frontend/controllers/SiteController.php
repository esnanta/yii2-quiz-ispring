<?php

namespace frontend\controllers;

use common\helper\LabelHelper;
use common\models\Assessment;
use common\models\AssessmentDetail;

use common\models\Participant;
use common\models\Schedule;
use common\models\ScheduleDetail;
use common\helper\ReadFilter;
use common\models\LoginParticipantForm;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use Yii;

use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use frontend\models\ContactForm;

/**
 * Site controller
 */
class SiteController extends Controller
{
    public $enableCsrfValidation = false;
    private $username = null;
    /**
     * {@inheritdoc}
     */
    public function behaviors()
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
                'class' => \yii\web\ErrorAction::class,
            ],
            'captcha' => [
                'class' => \yii\captcha\CaptchaAction::class,
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
            $participant = Participant::findone(['username'=>Yii::$app->user->identity->username]);
            $schedules = Schedule::find()
                ->where(['office_id'=>$participant->office_id])
                ->andWhere(['group_id'=>$participant->group_id])
                ->all();
            return $this->render('index',[
                'participant'=>$participant,
                'schedules' => $schedules
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
     * Logs out the current user.
     * $id = Schedule Detail Id
     *
     */
//    public function actionOpen($id){
//        $textLink = '';
//        $linkLabel = Yii::t('app', 'Closed');
//        $labelClass = LabelHelper::getButtonCssPlus() . ' btn-sm disabled';
//
//        if ($timeReference > $currentTime) :
//            //http://www.mywebsite.com/presentation/index.html?USER_NAME=John&USER_EMAIL=john@ispringsolutions.com&ADDRESS=NYC
//            $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username .
//                '&SCD=' . $scheduleDetailItem->id;
//            $textLink = Yii::$app->urlManager->baseUrl .
//                $scheduleDetailItem->asset_url . $userinfo;
//            $linkLabel = Yii::t('app', 'Open');
//            $labelClass = LabelHelper::getButtonCssPrint();
//        endif;
//    }

    public function actionRead()
    {
        header('Access-Control-Allow-Origin: *');
        if ($_SERVER['REQUEST_METHOD'] != 'POST')
        {
            echo "POST request expected";
            return;
        }
        error_reporting(E_ALL && E_WARNING && E_NOTICE);
        ini_set('display_errors', 0);
        ini_set('log_errors', 1);

        require_once Yii::getAlias('@common').'\quizresult\includes\common.inc.php';
//        require_once Yii::getAlias('@common').'\quizresult\classes\QuizResults.class.php';
//        require_once Yii::getAlias('@common').'\quizresult\classes\QuizReportGenerator.class.php';
//        require_once Yii::getAlias('@common').'\quizresult\classes\QuizDetails.class.php';

//        $requestParameters = RequestParametersParser::getRequestParameters($_POST, !empty($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : null);
//        $this->_log($requestParameters);

        try
        {
//            $quizResults = new QuizResults();
//            $quizResults->InitFromRequest($requestParameters);
//            $generator = QuizReportFactory::CreateGenerator($quizResults, $requestParameters);
//            $report = $generator->createReport();


            $username               = $_POST['USER_NAME']; //Quiz taker's username
            $pv                     = $_POST['pv']; //User variables
            $sa                     = $_POST['sa']; //Include user responses in quiz taker’s report
            $sc                     = $_POST['sc']; //Include user’s correct answers in quiz taker report
            $sf                     = $_POST['sf']; //Include feedback messages in quiz taker report
            $vt                     = $_POST['vt']; //Array of available user variables

            $scheduleDetailId       = $_POST['SCD']; //SCHEDULE DETAIL ID

            $scheduleDetail = ScheduleDetail::find()
                ->where(['id'=>$scheduleDetailId])
                ->one();

            $scheduleId = $scheduleDetail->schedule->id;
            $subjectId  = $scheduleDetail->subject_id;
            $officeId   = $scheduleDetail->office_id;

            $participant = Participant::find()
                ->select('id')
                ->where(['username' => $username])
                ->one();

            $assessment = Assessment::find()
                ->where([
                    'office_id'     => $officeId,
                    'schedule_id'   => $scheduleId,
                ])
                ->one();

            if(empty($assessment)){
                $assessment                 = new Assessment();
                $assessment->office_id      = $officeId;
                $assessment->schedule_id    = $scheduleId;
                $assessment->save();
            }

            $assessmentDetail = new AssessmentDetail();
            $assessmentDetail->assessment_id            = $assessment->id;
            $assessmentDetail->schedule_detail_id       = $scheduleDetailId;
            $assessmentDetail->subject_id               = $subjectId;
            $assessmentDetail->office_id                = $officeId;
            $assessmentDetail->participant_id           = $participant->id;
            $assessmentDetail->username                 = $username;
            $assessmentDetail->app_version              = $_POST['v'];
            $assessmentDetail->earned_points            = $_POST['sp'];
            $assessmentDetail->passing_score            = $_POST['ps'];
            $assessmentDetail->passing_score_percent    = $_POST['psp'];
            $assessmentDetail->gained_score             = $_POST['tp'];
            $assessmentDetail->quiz_title               = $_POST['qt'];
            $assessmentDetail->quiz_type                = $_POST['t'];
            $assessmentDetail->time_limit               = $_POST['tl'];// read = gmdate("H:i:s", $timeLimit)
            $assessmentDetail->used_time                = $_POST['ut'];
            $assessmentDetail->time_spent               = $_POST['fut'];
            $assessmentDetail->save();


//            $dateTime = date('Y-m-d_H-i-s');
//            $resultFilename = Yii::getAlias('@common') . "/quizresult/result/quiz_result_{$dateTime}.txt";
//            @file_put_contents($resultFilename, $report);

            //echo "OK";
        }
        catch (\Exception $e)
        {
            error_log($e);
            echo "Error: " . $e->getMessage();
        }

        //return $this->render('read');

    }

    private function _log($requestParameters)
    {
        $logFilename = dirname(__FILE__) . '/log/quiz_results.log';
        $event       = array('ts' => date('Y-m-d H:i:s'), 'request_parameters' => $requestParameters, 'ts_' => time());
        $logMessage  = json_encode($event);
        $logMessage .= ',' . PHP_EOL;
        @file_put_contents($logFilename, $logMessage, FILE_APPEND);
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
