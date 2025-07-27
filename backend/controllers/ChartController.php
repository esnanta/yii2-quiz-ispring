<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\charts\ChartParticipant;
use common\models\Participant;
use common\models\ParticipantSearch;
use common\service\AssessmentService;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * ChartController implements the CRUD actions for Participant model.
 */
class ChartController extends Controller
{
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
     * Lists all Participant models.
     * @return mixed
     */
    public function actionParticipant()
    {
        if(Yii::$app->user->can('index-participant')){
            $searchModel = new ParticipantSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();
            $statusList = Participant::getArrayStatus();

            return $this->render('participant/index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'groupList' => $groupList,
                'statusList' => $statusList
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /*
     * $id is participant id
     */
    public function actionParticipantChart($id,$title=null){
        if(Yii::$app->user->can('view-participant')){

            $model = new ChartParticipant();
            $participant = Participant::findOne($id);
            $officeId = DataIdService::getOfficeId();

            $periodList = DataListService::getPeriod();
            $groupList  = DataListService::getGroup();
            $subjectList = DataListService::getSubject();

            if ($model->load(Yii::$app->request->post())) {
                $assessmentData = AssessmentService::getChartByPeriod(
                    $officeId, $participant->id, $model->period_id, $model->subject_id);

                $categories = $assessmentData['categories'];
                $series = $assessmentData['series'];

                return $this->render('participant/chart', [
                    'model' => $model,
                    'participant' => $participant,
                    'periodList' => $periodList,
                    'groupList' => $groupList,
                    'subjectList' => $subjectList,
                    'series' => $series,
                    'categories'=>$categories
                ]);
            } else {
                return $this->render('participant/chart', [
                    'model' => $model,
                    'participant' => $participant,
                    'periodList' => $periodList,
                    'groupList' => $groupList,
                    'subjectList' => $subjectList,
                    'series' => null,
                    'categories'=> null,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Participant model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Participant the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Participant::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionGetGroupInAssessment()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            $period_id = $parents[0];

            if ($period_id != '') {
                $officeId = DataIdService::getOfficeId();
                $list = Assessment::find()
                    ->where([
                        'office_id' => $officeId, 'period_id' => $period_id,
                        'participant'])
                    ->asArray()
                    ->all();

                if ($period_id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['id'], 'name' => $model['title']];
                    }
                    // Optionally, preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }
        }
        return ['output' => '', 'selected' => ''];
    }
}
