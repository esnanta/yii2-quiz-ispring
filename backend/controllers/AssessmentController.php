<?php

namespace backend\controllers;


use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\AssessmentSearch;
use common\service\AssessmentService;
use common\service\DataListService;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * AssessmentDetailController implements the CRUD actions for AssessmentDetail model.
 */
class AssessmentController extends Controller
{
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
     * Lists all AssessmentDetail models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-assessment')) {
            $searchModel = new AssessmentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $scheduleList = DataListService::getSchedule();
            $profileList  = DataListService::getProfile();
            $periodList = DataListService::getPeriod();
            $groupList = DataListService::getGroup();
            $subjectList = DataListService::getSubject();
            $questionTypeList = Assessment::getArrayQuestionTypes();
            $submissionStatusList = Assessment::getArraySubmissionStatus();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'scheduleList' => $scheduleList,
                'profileList' => $profileList,
                'periodList' => $periodList,
                'groupList' => $groupList,
                'subjectList' => $subjectList,
                'questionTypeList' => $questionTypeList,
                'submissionStatusList' => $submissionStatusList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single AssessmentDetail model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id,$title=null)
    {
        if (Yii::$app->user->can('view-assessment')) {
            $model = $this->findModel($id);

            $scheduleList = DataListService::getAssessment();
            $profileList  = DataListService::getProfile();
            $groupList = DataListService::getGroup();
            $questionTypeList = Assessment::getArrayQuestionTypes();
            $examTypeList = Assessment::getArrayExamType();

            $assessmentData = AssessmentService::getChartByPeriod(
                $model->office_id, $model->participant_id,
                $model->period_id, $model->subject_id);

            $categories = $assessmentData['categories'];
            $series = $assessmentData['series'];

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'profileList' => $profileList,
                    'groupList' => $groupList,
                    'questionTypeList' => $questionTypeList,
                    'examTypeList' => $examTypeList,
                    'categories' => $categories,
                    'series' => $series,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new AssessmentDetail model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        MessageHelper::getFlashFeatureDisabled();
        throw new ForbiddenHttpException;
//        if (Yii::$app->user->can('create-assessment')) {
//            $model = new Assessment;
//            $scheduleList = DataListService::getAssessment();
//            $profileList  = DataListService::getParticipant();
//            $questionTypeList = Assessment::getArrayQuestionTypes();
//
//            try {
//                if ($model->load(Yii::$app->request->post()) && $model->save()) {
//                    return $this->redirect(['view', 'id' => $model->id]);
//                } else {
//                    return $this->render('create', [
//                        'model' => $model,
//                        'scheduleList' => $scheduleList,
//                        'profileList' => $profileList,
//                        'questionTypeList' => $questionTypeList
//                    ]);
//                }
//            } catch (StaleObjectException $e) {
//                throw new StaleObjectException('The object being updated is outdated.');
//            }
//        } else {
//            MessageHelper::getFlashAccessDenied();
//            throw new ForbiddenHttpException;
//        }
    }

    /**
     * Updates an existing AssessmentDetail model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-assessment')) {
            try {
                $model = $this->findModel($id);
                $scheduleList = DataListService::getAssessment();
                $profileList  = DataListService::getProfile();
                $questionTypeList = Assessment::getArrayQuestionTypes();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'scheduleList' => $scheduleList,
                        'profileList' => $profileList,
                        'questionTypeList' => $questionTypeList
                    ]);
                }
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing AssessmentDetail model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-assessment')) {
            $model = $this->findModel($id);
            $scheduleId = $model->schedule->id;
            $model->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['/schedule/view', 'id' => $scheduleId]);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the AssessmentDetail model based on its primary key value.
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

}
