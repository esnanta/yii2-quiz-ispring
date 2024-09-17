<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\Participant;
use common\models\reports\ExportAssessment;
use common\models\reports\ExportParticipant;
use common\models\Schedule;
use common\service\CacheService;
use common\service\DataListService;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
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

        $scheduleList = DataListService::getSchedule();
        $subjectList = DataListService::getSubject();

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
                    'scheduleList' => $scheduleList,
                    'subjectList' => $subjectList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }


    /**
     * Lists all Group models.
     * @return mixed
     */
    public function actionParticipantCard()
    {
        $model      = new ExportParticipant();

        $groupList  = DataListService::getGroup();

        if (Yii::$app->user->can('view-participant')) {
            if ($model->load(Yii::$app->request->post())) {

                $officeId = CacheService::getInstance()->getOfficeId();

                $participants = Participant::find()
                    ->where(['office_id'=>$officeId, 'group_id' => $model->group_id])
                    ->orderBy(['id' => SORT_ASC])
                    ->all();


                return $this->render('view_participant_card', [
                    'participants' => $participants,
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
