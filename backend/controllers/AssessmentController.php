<?php

namespace backend\controllers;

use common\domain\DataListUseCase;
use common\models\reports\ExportAssessment;
use common\models\Schedule;
use Yii;
use common\models\Assessment;
use common\models\AssessmentSearch;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
use yii2tech\spreadsheet\Spreadsheet;

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

            $scheduleList = DataListUseCase::getSchedule();
            $participantList  = DataListUseCase::getParticipant();
            $periodList = DataListUseCase::getPeriod();
            $subjectList = DataListUseCase::getSubject();
            $subjectTypeList = Assessment::getArraySubjectTypes();
            $workStatusList = Assessment::getArrayWorkStatus();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'scheduleList' => $scheduleList,
                'participantList' => $participantList,
                'periodList' => $periodList,
                'subjectList' => $subjectList,
                'subjectTypeList' => $subjectTypeList,
                'workStatusList' => $workStatusList,
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
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-assessment')) {
            $model = $this->findModel($id);

            $scheduleList = DataListUseCase::getAssessment();
            $participantList  = DataListUseCase::getParticipant();
            $subjectTypeList = Assessment::getArraySubjectTypes();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'participantList' => $participantList,
                    'subjectTypeList' => $subjectTypeList
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
        if (Yii::$app->user->can('create-assessment')) {
            $model = new Assessment;
            $scheduleList = DataListUseCase::getAssessment();
            $participantList  = DataListUseCase::getParticipant();
            $subjectTypeList = Assessment::getArraySubjectTypes();

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'scheduleList' => $scheduleList,
                        'participantList' => $participantList,
                        'subjectTypeList' => $subjectTypeList
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
                $scheduleList = DataListUseCase::getAssessment();
                $participantList  = DataListUseCase::getParticipant();
                $subjectTypeList = Assessment::getArraySubjectTypes();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'scheduleList' => $scheduleList,
                        'participantList' => $participantList,
                        'subjectTypeList' => $subjectTypeList
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
            $this->findModel($id)->delete();
            return $this->redirect(['index']);
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

    /**
     * @throws ForbiddenHttpException
     */
    public function actionReport()
    {
        $model      = new ExportAssessment();
        $file_name  = 'assessment.xls';

        $scheduleList = DataListUseCase::getSchedule();
        $subjectList = DataListUseCase::getSubject();

        if (Yii::$app->user->can('report-assessment')) {
            if ($model->load(Yii::$app->request->post())) {

                $query = Assessment::find()
                    ->where(['schedule_id' => $model->schedule_id])
                    ->orderBy(['id' => SORT_ASC]);

                if (!empty($model->subject_id)) {
                    $query->andWhere(['subject_id' => $model->subject_id]);
                }

                $schedule = Schedule::find('title')
                    ->where(['id' => $model->schedule_id])
                    ->one();

                $file_name = $schedule->title.'-'.$file_name;

                $exporter = (new Spreadsheet([
                    'title' => 'Sheet1',
                    'dataProvider' => new ActiveDataProvider([
                        'query' => $query,
                        'pagination' => [
                            'pageSize' => 20, // export batch size
                        ],
                    ]),
                    'columns' => [
                        [
                            'attribute' => 'date_start',
                            'header' => Yii::t('app', 'Date Start'),
                            'contentOptions' => [
                                'alignment' => [
                                    'horizontal' => 'center',
                                    'vertical' => 'center',
                                ],
                            ],
                        ],
                        [
                            'attribute' => 'participant.title',
                            'header' => Yii::t('app', 'Participant'),
                        ],
                        [
                            'attribute' => 'subject.title',
                            'header' => Yii::t('app', 'Subject'),
                        ],
                        [
                            'attribute' => 'subject_type',
                            'value' => function ($model, $key, $index, $widget) {
                                return strip_tags($model->getOneSubjectType($model->subject_type));
                            },
                            'header' => Yii::t('app', 'Subject Type'),
                        ],
                        [
                            'attribute' => 'earned_points',
                            'header' => Yii::t('app', 'Earned Points'),
                        ],
                        [
                            'attribute' => 'passing_score',
                            'header' => Yii::t('app', 'Passing Score'),
                        ],
                        [
                            'attribute' => 'gained_score',
                            'header' => Yii::t('app', 'Gained Score'),
                        ],
                        [
                            'attribute' => 'evaluate_score',
                            'header' => Yii::t('app', 'Evaluate Score'),
                        ],
                        [
                            'attribute' => 'quiz_title',
                            'header' => Yii::t('app', 'Quiz Title'),
                        ],
                        [
                            'attribute' => 'quiz_type',
                            'header' => Yii::t('app', 'Quiz Type'),
                        ],
                        [
                            'attribute' => 'time_limit',
                            'value' => function ($model, $key, $index, $widget) {
                                return gmdate("H:i:s", $model->time_limit);
                            },
                            'header' => Yii::t('app', 'Time Limit'),
                        ],
                        [
                            'attribute' => 'used_time',
                            'value' => function ($model, $key, $index, $widget) {
                                return gmdate("H:i:s", $model->used_time);
                            },
                            'header' => Yii::t('app', 'Used Time'),
                        ],
                    ],
                ]))
                    ->render(); // call `render()` to create a single worksheet


                return $exporter->send($file_name);
            } else {
                return $this->render('report', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'subjectList' => $subjectList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
