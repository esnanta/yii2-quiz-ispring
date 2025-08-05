<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\charts\ChartProfile;
use common\models\Profile;
use common\models\ProfileSearch;
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
     * Lists all Profile models.
     * @return mixed
     */
    public function actionProfile()
    {
        if(Yii::$app->user->can('index-profile')){
            $searchModel = new ProfileSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();

            return $this->render('profile/index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'groupList' => $groupList,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /*
     * $id is profile id
     */
    public function actionProfileChart($id,$title=null){
        if(Yii::$app->user->can('view-profile')){

            $model = new ChartProfile();
            $profile = Profile::findOne(['user_id' =>$id]);
            $officeId = DataIdService::getOfficeId();

            $periodList = DataListService::getPeriod();
            $groupList  = DataListService::getGroup();
            $subjectList = DataListService::getSubject();

            if ($model->load(Yii::$app->request->post())) {
                $assessmentData = AssessmentService::getChartByPeriod(
                    $officeId, $profile->user_id, $model->period_id, $model->subject_id);

                $categories = $assessmentData['categories'];
                $series = $assessmentData['series'];

                return $this->render('profile/chart', [
                    'model' => $model,
                    'profile' => $profile,
                    'periodList' => $periodList,
                    'groupList' => $groupList,
                    'subjectList' => $subjectList,
                    'series' => $series,
                    'categories'=>$categories
                ]);
            } else {
                return $this->render('profile/chart', [
                    'model' => $model,
                    'profile' => $profile,
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
     * @return Profile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Profile::findOne(['user_id' =>$id])) !== null) {
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
                        'office_id' => $officeId,
                        'period_id' => $period_id])
                    ->asArray()
                    ->all();

                if ($period_id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['id'], 'name' => $model['name']];
                    }
                    // Optionally, preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }
        }
        return ['output' => '', 'selected' => ''];
    }
}
