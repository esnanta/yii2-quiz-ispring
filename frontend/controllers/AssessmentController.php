<?php

namespace frontend\controllers;

use backend\models\Office;
use backend\models\TestResult;
use common\helper\CacheCloud;
use common\models\LoginParticipantForm;
use Yii;
use backend\models\Assessment;
use backend\models\AssessmentSearch;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * AssessmentController implements the CRUD actions for Assessment model.
 */
class AssessmentController extends Controller
{
    public $enableCsrfValidation = false;
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
     * Lists all Assessment models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-assessment')){
            $searchModel = new AssessmentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList'=>$officeList
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Assessment model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-assessment')){
            $model = $this->findModel($id);
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Assessment model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-assessment')){
            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $model = new Assessment;
            $model->office_id = $officeId;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } 
                else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList' => $officeList
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Assessment model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-assessment')){
            try {
                $model = $this->findModel($id);
                $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $model->office_id])
                    ->asArray()->all(), 'id', 'title');

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeList' => $officeList
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Assessment model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-assessment')){
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Assessment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Assessment the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Assessment::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

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

            $version                = $_POST['v'];
            $earnedPoints           = $_POST['sp'];
            $passingScore           = $_POST['ps'];
            $passingScorePercent    = $_POST['psp'];
            $gainedScore            = $_POST['tp'];
            $quizTitle              = $_POST['qt'];
            $quizType               = $_POST['t'];
            $userId                 = $_POST['sid'];
            $timeLimit              = $_POST['tl'];
            $usedTime               = $_POST['ut'];
            $timeSpent              = $_POST['fut'];

            $assessment = new Assessment();
            $assessment->office_id = 1;
            $assessment->test1 =
                'version = '.$version.'/'.'<br>'.
                'earnedPoints = '.$earnedPoints.'/'.'<br>'.
                'passingScore = '.$passingScore.'/'.'<br>'.
                'passingScorePercent = '.$passingScorePercent.'/'.'<br>'.
                'gainedScore = '.$gainedScore.'/'.'<br>'.
                'quizTitle = '.$quizTitle.'/'.'<br>'.
                'quizType = '.$quizType.'/'.'<br>'.
                'userId = '.$userId.'/'.'<br>'.
                'timeLimit = '.gmdate("H:i:s", $timeLimit).'/'.'<br>'.
                'usedTime = '.gmdate("H:i:s", $usedTime).'/'.'<br>'.
                'timeSpent = '.gmdate("H:i:s", $timeSpent);
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
