<?php


use backend\models\Assessment;

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
        'version = '.$version.'/'.
        'earnedPoints = '.$earnedPoints.'/'.
        'passingScore = '.$passingScore.'/'.
        'passingScorePercent = '.$passingScorePercent.'/'.
        'gainedScore = '.$gainedScore.'/'.
        'quizTitle = '.$quizTitle.'/'.
        'quizType = '.$quizType.'/'.
        'userId = '.$userId.'/'.
        'timeLimit = '.$timeLimit.'/'.
        'usedTime = '.$usedTime.'/'.
        'timeSpent = '.$timeSpent;
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