<?php

namespace frontend\controllers;

use common\models\Assessment;
use common\models\Participant;
use common\models\Period;
use common\models\Schedule;
use common\models\ScheduleDetail;
use common\models\Subject;
use common\service\CacheService;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use frontend\models\AssessmentSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;



/**
 * AssessmentDetailController implements the CRUD actions for AssessmentDetail model.
 */
class AssessmentController extends Controller
{
    public $enableCsrfValidation = false;

    public function behaviors(): array
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
     * Lists all AssessmentDetail models.
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionIndex($user=null)
    {
        try {
            $participant = Participant::findone(['username' => Yii::$app->user->identity->username]);
            $searchModel = new AssessmentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $dataProvider->query->andWhere(['participant_id' => $participant->id]);

            $officeId = $participant->office_id;

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $periodList = ArrayHelper::map(Period::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $subjectList = ArrayHelper::map(Subject::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $subjectTypeList = Assessment::getArraySubjectTypes();

            //ONLY DISPLAY 1 PARTICIPANT
            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $participant->office_id])
                ->andWhere(['id' => $participant->id])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'scheduleList' => $scheduleList,
                'participantList' => $participantList,
                'periodList' => $periodList,
                'subjectList' => $subjectList,
                'subjectTypeList' => $subjectTypeList
            ]);
        } catch (\Exception $e){
            throw new NotFoundHttpException($e->getMessage());
        }
    }

    /**
     * Displays a single AssessmentDetail model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionView($id)
    {
        try {
            $officeId = CacheService::getInstance()->getOfficeIdByParticipant();
            $model = Assessment::find()
                ->where(['id'=>$id,'office_id' => $officeId])
                ->one();

            $scheduleList       = DataListService::getSchedule();
            $periodList         = DataListService::getPeriod();
            $subjectList        = DataListService::getSubject();
            $subjectTypeList    = Assessment::getArraySubjectTypes();

            //ONLY DISPLAY 1 PARTICIPANT
            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $model->office_id])
                ->andWhere(['id' => $model->participant_id])
                ->asArray()->all(), 'id', 'title');

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'periodList' => $periodList,
                    'subjectList' => $subjectList,
                    'subjectTypeList' => $subjectTypeList,
                    'participantList' => $participantList
                ]);
            }
        } catch (\Exception $e){
            throw new NotFoundHttpException($e->getMessage());
        }
    }

    public function actionSubmit()
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

            $officeId = CacheService::getInstance()->getOfficeIdByParticipant();
            $scheduleDetail = ScheduleDetail::find()
                ->where(['id'=>$scheduleDetailId,'office_id' => $officeId])
                ->one();

            $participant = Participant::find()
                ->select('id')
                ->where(['username' => $username,'office_id' => $officeId])
                ->one();

            $scheduleId         = $scheduleDetail->schedule->id;
            $periodId           = $scheduleDetail->schedule->period_id;
            $groupId            = $scheduleDetail->schedule->group_id;
            $subjectId          = $scheduleDetail->subject_id;
            $subjectType        = $scheduleDetail->subject_type;
            $participantId      = $participant->id;

            $assessment = Assessment::find()
                ->where(['office_id' => $officeId,
                    'schedule_detail_id'  => $scheduleDetailId,
                    'participant_id' => $participantId
                ])->one();

            if(empty($assessment)):
                $assessment = new Assessment();
            endif;

            $assessment->office_id                = $officeId;
            $assessment->period_id                = $periodId;
            $assessment->group_id                 = $groupId;
            $assessment->schedule_id              = $scheduleId;
            $assessment->schedule_detail_id       = $scheduleDetailId;
            $assessment->subject_type             = $subjectType;
            $assessment->subject_id               = $subjectId;
            $assessment->participant_id           = $participantId;
            $assessment->username                 = $username;
            $assessment->app_version              = $_POST['v'];
            $assessment->earned_points            = $_POST['sp'];
            $assessment->passing_score            = $_POST['ps'];
            $assessment->passing_score_percent    = $_POST['psp'];
            $assessment->gained_score             = $_POST['tp'];
            $assessment->quiz_title               = $_POST['qt'];
            $assessment->quiz_type                = $_POST['t'];
            $assessment->time_limit               = $_POST['tl'];// read = gmdate("H:i:s", $timeLimit)
            $assessment->used_time                = $_POST['ut'];
            $assessment->time_spent               = $_POST['fut'];
            $assessment->work_status              = Assessment::WORK_STATUS_ONGOING;
            $assessment->save();


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

}
