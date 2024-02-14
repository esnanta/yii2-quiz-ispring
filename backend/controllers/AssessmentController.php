<?php

namespace backend\controllers;

use common\models\AssessmentDetail;

use common\models\Period;
use common\models\reports\ExportAssessment;
use common\models\Schedule;
use common\models\Subject;
use common\helper\CacheCloud;
use Yii;
use common\models\Assessment;
use common\models\AssessmentSearch;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\web\Controller;

use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;

use yii2tech\spreadsheet\Spreadsheet;
use yii\data\ArrayDataProvider;

/**
 * AssessmentController implements the CRUD actions for Assessment model.
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
     * Lists all Assessment models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-assessment')) {
            $searchModel = new AssessmentSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $officeId = CacheCloud::getInstance()->getOfficeId();
            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $periodList = ArrayHelper::map(Period::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'scheduleList' => $scheduleList,
                'periodList' => $periodList
            ]);
        } else {
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
        if (Yii::$app->user->can('view-assessment')) {
            $model = $this->findModel($id);
            $providerAssessmentDetail = new \yii\data\ArrayDataProvider([
                'allModels' => $model->assessmentDetails,
            ]);

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            return $this->render('view', [
                'model' => $this->findModel($id),
                'providerAssessmentDetail' => $providerAssessmentDetail,
                'scheduleList' => $scheduleList,
            ]);
        } else {
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
        if (Yii::$app->user->can('create-assessment')) {
            $model = new Assessment();

            $officeId = CacheCloud::getInstance()->getOfficeId();

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $periodList = ArrayHelper::map(Period::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'periodList' => $periodList
                ]);
            }
        } else {
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
        if (Yii::$app->user->can('update-assessment')) {
            $model = $this->findModel($id);

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            $periodList = ArrayHelper::map(Period::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                    'periodList' => $periodList
                ]);
            }
        } else {
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
        if (Yii::$app->user->can('delete-assessment')) {
            $model = $this->findModel($id);
            $modelDetails = $model->assessmentDetails;

            $transaction = \Yii::$app->db->beginTransaction();
            try {
                foreach ($modelDetails as $modelDetailItem) {
                    $modelDetailItem->delete();
                }
                $model->delete();
                $transaction->commit();
                MessageHelper::getFlashDeleteSuccess();
                return $this->redirect(['index']);
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
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
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }

    /**
     * Action to load a tabular form grid
     * for AssessmentDetail
     * @return mixed
     * @author Jiwantoro Ndaru <jiwanndaru@gmail.com>
     *
     * @author Yohanes Candrajaya <moo.tensai@gmail.com>
     */
    public function actionAddAssessmentDetail()
    {
        if (Yii::$app->request->isAjax) {
            $row = Yii::$app->request->post('AssessmentDetail');
            if (!empty($row)) {
                $row = array_values($row);
            }
            if ((Yii::$app->request->post('isNewRecord') && Yii::$app->request->post('_action') == 'load' && empty($row)) || Yii::$app->request->post('_action') == 'add')
                $row[] = [];
            return $this->renderAjax('_formAssessmentDetail', ['row' => $row]);
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }


    public function actionReport()
    {
        $model      = new ExportAssessment();
        $file_name  = 'assessment.xls';
        $officeId   = CacheCloud::getInstance()->getOfficeId();

        $assessmentList = ArrayHelper::map(Assessment::find()
            ->asArray(['office_id' => $officeId])
            ->all(), 'id', 'title');

        $subjectList = ArrayHelper::map(Subject::find()
            ->asArray(['office_id' => $officeId])
            ->all(), 'id', 'title');

        if (Yii::$app->user->can('report-assessment')) {
            if ($model->load(Yii::$app->request->post())) {

                $query = AssessmentDetail::find()
                    ->where(['assessment_id' => $model->assessment_id])
                    ->orderBy(['id' => SORT_ASC]);

                $assessment = Assessment::find('title')
                    ->where(['id' => $model->assessment_id])
                    ->one();

                $file_name = $assessment->title.'-'.$file_name;

                if (!empty($model->subject_id)) {
                    $query->andWhere(['subject_id' => $model->subject_id]);
                }

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
                            'attribute' => 'assessment.date_start',
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
                    'assessmentList' => $assessmentList,
                    'subjectList' => $subjectList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
