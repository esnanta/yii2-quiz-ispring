<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\Participant;
use common\models\Period;
use common\models\reports\ExportAssessment;
use common\models\reports\ExportParticipant;
use common\models\Schedule;
use common\models\Subject;
use common\service\CacheService;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\Response;
use yii2tech\spreadsheet\Spreadsheet;

/**
 * PeriodController implements the CRUD actions for Period model.
 */
class ReportController extends Controller
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
     * @throws ForbiddenHttpException
     */
    public function actionAssessmentScore()
    {
        $model      = new ExportAssessment();
        $file_name  = 'assessment.xls';

        $periodList = DataListService::getPeriod();
        $scheduleList = DataListService::getSchedule();
        $subjectList = DataListService::getSubject();

        if (Yii::$app->user->can('report-assessment')) {
            if ($model->load(Yii::$app->request->post())) {

                $query = Assessment::find()
                    ->where(['schedule_id' => $model->schedule_id])
                    ->orderBy(['id' => SORT_ASC]);

                if (!empty($model->subject_id)) {
                    $query->andWhere(['subject_id' => $model->subject_id]);

                    $subject = Subject::find('title')
                        ->where(['id' => $model->subject_id])
                        ->one();

                    $file_name = $subject->title.'-'.$file_name;
                }

                if (!empty($model->schedule_id)) {
                    $query->andWhere(['schedule_id' => $model->schedule_id]);

                    $schedule = Schedule::find('title')
                        ->where(['id' => $model->schedule_id])
                        ->one();

                    $file_name = $schedule->title.'-'.$file_name;
                }

                if (!empty($model->period_id)) {
                    $query->andWhere(['period_id' => $model->period_id]);
                    $period = Period::find('title')
                        ->where(['id' => $model->period_id])
                        ->one();
                    $file_name = $period->title.'-'.$file_name;
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
                            'attribute' => 'question_type',
                            'value' => function ($model, $key, $index, $widget) {
                                return strip_tags($model->getOneQuestionType($model->question_type));
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
                return $this->render('report_assessment', [
                    'model' => $model,
                    'periodList' => $periodList,
                    'scheduleList' => $scheduleList,
                    'subjectList' => $subjectList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionGetSchedules()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            $period_id = $parents[0];

            if ($period_id != '') {
                $officeId = DataIdService::getOfficeId();
                $list = Schedule::find()
                    ->where(['office_id' => $officeId, 'period_id' => $period_id])
                    ->asArray()
                    ->all();

                if ($period_id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['id'], 'name' => $model['title'].' - '.$model['description']];
                    }
                    // Optionally, preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }
        }
        return ['output' => '', 'selected' => ''];
    }

    /**
     * Lists all Group models.
     * @return mixed
     */
    public function actionParticipantCard()
    {
        $model      = new ExportParticipant();
        $groupList  = DataListService::getGroup();
        $officeId   = CacheService::getInstance()->getOfficeId();

        $activePeriod = Period::find()
            ->where([
                'office_id' => $officeId,
                'is_active' => Period::IS_ACTIVE_YES
            ])
            ->one();

        if(empty($activePeriod)):
            MessageHelper::getFlashNoActivePeriod();
            return $this->render('report_participant', [
                'model' => $model,
                'groupList' => $groupList
            ]);
        endif;

        if (Yii::$app->user->can('view-participant')) {
            if ($model->load(Yii::$app->request->post())) {

                $officeId = CacheService::getInstance()->getOfficeId();

                $listParticipant = Participant::find()
                    ->where(['office_id'=>$officeId, 'group_id' => $model->group_id])
                    ->orderBy(['id' => SORT_ASC])
                    ->all();

                return $this->render('view_participant_card', [
                    'model' => $model,
                    'listParticipant' => $listParticipant,
                    'activePeriod' => $activePeriod,
                ]);

            } else {
                return $this->render('report_participant', [
                    'model' => $model,
                    'groupList' => $groupList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
