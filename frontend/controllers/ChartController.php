<?php

namespace frontend\controllers;

use common\models\Assessment;
use common\models\charts\ChartProfile;
use common\models\Profile;
use common\service\AssessmentService;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
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


    /*
     * $id is profile id
     */
    public function actionParticipantChart()
    {
        $profile = Profile::findone(['user_id' => Yii::$app->user->identity->id]);

        $model = new ChartProfile();
        $officeId = DataIdService::getOfficeId();

        $periodList = DataListService::getDistinctPeriodsByProfile($profile->user_id);
        $groupList = DataListService::getDistinctGroupsByProfile($profile->user_id);
        $subjectList = DataListService::getDistinctSubjectsByProfile($profile->user_id);

        if ($model->load(Yii::$app->request->post())) {
            $assessmentData = AssessmentService::getChartByPeriod(
                $officeId, $profile->id, $model->period_id, $model->subject_id);

            $categories = $assessmentData['categories'];
            $series = $assessmentData['series'];

            return $this->render('profile/chart', [
                'model' => $model,
                'profile' => $profile,
                'periodList' => $periodList,
                'groupList' => $groupList,
                'subjectList' => $subjectList,
                'series' => $series,
                'categories' => $categories
            ]);
        } else {
            return $this->render('profile/chart', [
                'model' => $model,
                'profile' => $profile,
                'periodList' => $periodList,
                'groupList' => $groupList,
                'subjectList' => $subjectList,
                'series' => null,
                'categories' => null,
            ]);
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
        if (($model = Profile::findOne($id)) !== null) {
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
                        'period_id' => $period_id
                    ])
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
