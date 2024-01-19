<?php

namespace frontend\controllers;

use backend\models\TestResult;
use common\helper\CacheCloud;
use common\helper\ReadFilter;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use QuizReportFactory;
use QuizResults;
use RequestParametersParser;
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
                'class' => VerbFilter::className(),
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
//    public function beforeAction($action): bool
//    {
//        $this->enableCsrfValidation = false;
//        return parent::beforeAction($action);
//    }
    
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

            //$officeId   = CacheCloud::getInstance()->getOfficeId();
            return $this->render('index');
        }
    }


    public function actionRead()
    {
        header('Access-Control-Allow-Origin: *');
        error_reporting(E_ALL && E_WARNING && E_NOTICE);
        ini_set('display_errors', 0);
        ini_set('log_errors', 1);

//        $testResult = new TestResult();
//        $testResult->office_id = 1;
//        $testResult->test1 = 'test';
//        $testResult->save();

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



            $version = $_POST['v'];
            $points = $_POST['sp'];
            $passing_percent = $_POST['psp'];
            $gained_score = $_POST['tp'];
            $quiz_title = $_POST['qt'];

            $testResult = new TestResult();
            $testResult->office_id = 1;
            $testResult->test1 = $version.'/'.$points.'/'.$passing_percent.'/'.$gained_score.'/'.$quiz_title;
            $testResult->save();

//            $dateTime = date('Y-m-d_H-i-s');
//            $resultFilename = Yii::getAlias('@common') . "/quizresult/result/quiz_result_{$dateTime}.txt";
//            @file_put_contents($resultFilename, $report);

            echo "OK";







        }
        catch (\Exception $e)
        {
            error_log($e);

            echo "Error: " . $e->getMessage();
        }

        return $this->redirect('index');

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

    /**
     * @throws Exception
     * @throws \PhpOffice\PhpSpreadsheet\Exception
     */
    public function actionImport(){

        //$inputFileName  = 'https://localhost/application/yii2-cbt-ispring/admin/uploads/archive/65a7fb0e28f7b/_65a80ac0ce7e2.xlsx';
        $inputFileName  = Yii::getAlias('@backend').'\web\uploads\archive\65a7fb0e28f7b\_65a80ac0ce7e2.xlsx';
        $sheetName = 'Foto';
        $filterSubset = new ReadFilter();

        $helper = new Sample();

        $inputFileType = IOFactory::identify($inputFileName);
        $reader = IOFactory::createReader($inputFileType);
        $reader->setReadDataOnly(true); //THIS WILL IGNORE FORMATTING
        $reader->setLoadSheetsOnly($sheetName);
        $reader->setReadFilter($filterSubset);
        $spreadsheet = $reader->load($inputFileName);

        $activeRange = $spreadsheet->getActiveSheet()->calculateWorksheetDataDimension();
        $sheetData = $spreadsheet->getActiveSheet()->rangeToArray($activeRange, null, true, true, true);
        $data = $spreadsheet->getActiveSheet();

        $helper->displayGrid($sheetData);

        foreach ($data->getRowIterator() as $row) {
            $cellIterator = $row->getCellIterator();

            /*
             * setIterateOnlyExistingCells
             * Default value is 'false'
             * FALSE = This loops through all cells, even if a cell value is not set.
             * TRUE = Loop through cells only when their value is set.
             */
            $cellIterator->setIterateOnlyExistingCells(FALSE);

            foreach ($cellIterator as $i=>$cell) {
                $helper->log('Cell "' . $i.' '.$cell->getValue());
            }
        }


    }
}
