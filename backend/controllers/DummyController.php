<?php

namespace backend\controllers;

use common\domain\DataIdUseCase;
use common\models\Assessment;
use common\models\Group;
use common\models\Participant;
use common\models\Period;
use common\models\Room;
use common\models\Schedule;
use common\models\ScheduleDetail;
use common\models\Subject;
use Faker\Factory;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use common\models\Staff;
use common\helper\MessageHelper;

use yii\web\Response;

/**
 * Site controller
 */
class DummyController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
//            'access' => [
//                'class' => AccessControl::class,
//                'rules' => [
//                    [
//                        'actions' => ['view'],
//                        'allow' => true,
//                    ],
//                ],
//            ],
            'verbs' => [
                'class' => VerbFilter::class,
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionView()
    {
        $officeId = DataIdUseCase::getOfficeId();
        $assessments = Assessment::find()->where(['office_id' => $officeId])->count();
        $scheduleDetails = ScheduleDetail::find()->where(['office_id' => $officeId])->count();
        $schedules = Schedule::find()->where(['office_id' => $officeId])->count();
        $participants = Participant::find()->where(['office_id' => $officeId])->count();
        $subjects = Subject::find()->where(['office_id' => $officeId])->count();
        $groups = Group::find()->where(['office_id' => $officeId])->count();

        return $this->render('view', [
            'assessments' => $assessments,
            'scheduleDetails' => $scheduleDetails,
            'schedules' => $schedules,
            'participants' => $participants,
            'subjects' => $subjects,
            'groups' => $groups,
        ]);
    }

    public function actionDeleteAssessment(): Response
    {
        $officeId = DataIdUseCase::getOfficeId();
        Assessment::deleteAll(['office_id' => $officeId]);
        Assessment::deleteAll(['office_id' => $officeId]);
        MessageHelper::getFlashDeleteSuccess();
        return $this->redirect(['view']);
    }

    public function actionDeleteSchedule(): Response
    {
        $officeId = DataIdUseCase::getOfficeId();
        ScheduleDetail::deleteAll(['office_id' => $officeId]);
        Schedule::deleteAll(['office_id' => $officeId]);
        MessageHelper::getFlashDeleteSuccess();
        return $this->redirect(['view']);
    }

    public function actionDeleteParticipant(): Response
    {
        $officeId = DataIdUseCase::getOfficeId();
        Participant::deleteAll(['office_id' => $officeId]);
        MessageHelper::getFlashDeleteSuccess();
        return $this->redirect(['view']);
    }

    public function actionDeleteSubject(): Response
    {
        $officeId = DataIdUseCase::getOfficeId();
        Subject::deleteAll(['office_id' => $officeId]);
        MessageHelper::getFlashDeleteSuccess();
        return $this->redirect(['view']);
    }

    public function actionDeleteGroup(): Response
    {
        $officeId = DataIdUseCase::getOfficeId();
        Group::deleteAll(['office_id' => $officeId]);
        MessageHelper::getFlashDeleteSuccess();
        return $this->redirect(['view']);
    }

    public function actionCreateSubject()
    {
        $officeId = DataIdUseCase::getOfficeId();

        $subject = new Subject();
        $subject->office_id = $officeId;
        $subject->title = 'Matematika';
        $subject->sequence = '1';
        $subject->description = 'Matematika';
        $subject->save();

        $subject2 = new Subject();
        $subject2->office_id = $officeId;
        $subject2->title = 'Kimia Numerasi';
        $subject2->sequence = '2';
        $subject2->description = 'Kimia Numerasi';
        $subject2->save();

        $subject3 = new Subject();
        $subject3->office_id = $officeId;
        $subject3->title = 'Kimia Literasi';
        $subject3->sequence = '2';
        $subject3->description = 'Kimia Literasi';
        $subject3->save();

        $subject4 = new Subject();
        $subject4->office_id = $officeId;
        $subject4->title = 'Kimia Umum';
        $subject4->sequence = '3';
        $subject4->description = 'Kimia Umum';
        $subject4->save();

        $subject5 = new Subject();
        $subject5->office_id = $officeId;
        $subject5->title = 'Sejarah';
        $subject5->sequence = '3';
        $subject5->description = 'Sejarah';
        $subject5->save();

        MessageHelper::getFlashSaveSuccess();
        return $this->redirect(['view']);
    }


    public function actionCreateGroup()
    {
        $officeId = DataIdUseCase::getOfficeId();

        $group = new Group();
        $group->office_id = $officeId;
        $group->title = 'X1';
        $group->sequence = '1';
        $group->description = 'Kelas X1';
        $group->save();

        $group2 = new Group();
        $group2->office_id = $officeId;
        $group2->title = 'X3';
        $group2->sequence = '2';
        $group2->description = 'Kelas X3';
        $group2->save();

        $group3 = new Group();
        $group3->office_id = $officeId;
        $group3->title = 'XI 2';
        $group3->sequence = '3';
        $group3->description = 'Kelas XI 2';
        $group3->save();

        $group4 = new Group();
        $group4->office_id = $officeId;
        $group4->title = 'XI 3';
        $group4->sequence = '4';
        $group4->description = 'Kelas XI 3';
        $group4->save();

        $group5 = new Group();
        $group5->office_id = $officeId;
        $group5->title = 'XII-1';
        $group5->sequence = '5';
        $group5->description = 'Kelas XII-1';
        $group5->save();

        MessageHelper::getFlashSaveSuccess();
        return $this->redirect(['view']);
    }

    public function actionCreateParticipant(): Response
    {
        $faker = Factory::create();

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $officeId = 1;
            $groups = Group::find()->where(['office_id' => $officeId])->all();
            foreach ($groups as $group) {
                for ($i = 0; $i < 10; $i++) {
                    $participant = new Participant();
                    $participant->office_id = $officeId;
                    $participant->group_id = $group->id;
                    $participant->title = $faker->firstName . ' ' . $faker->lastName;
                    $participant->identity_number = $faker->email;
                    $participant->username = $faker->email;
                    $participant->email = $faker->email;
                    $participant->password = $faker->password;
                    $participant->save();
                }
            }

            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
        MessageHelper::getFlashSaveSuccess();
        return $this->redirect(['view']);
    }

    public function actionCreateSchedule(): Response
    {
        $faker = Factory::create();

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $officeId = 1;
            $groups = Group::find()->where(['office_id' => $officeId])->all();

            $dateStart = date(Yii::$app->params['datetimeSaveFormat']);
            $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+2 hours', strtotime($dateStart)));

            foreach ($groups as $groupItem) {

                $period = Period::findOne(['office_id' => $officeId]);
                $room = Room::findOne(['office_id' => $officeId]);
                $staff = Staff::findOne(['office_id' => $officeId]);

                $schedule = new Schedule();
                $schedule->office_id = $officeId;
                $schedule->group_id = $groupItem->id;
                $schedule->period_id = $period->id;
                $schedule->room_id = $room->id;
                $schedule->staff_id = $staff->id;
                $schedule->date_start = $dateStart;
                $schedule->date_end = $dateEnd;
                $schedule->save();

                $subjects = Subject::find()->where(['office_id' => $officeId])->all();
                foreach ($subjects as $subjectItem) {
                    $scheduleDetail = new ScheduleDetail();
                    $scheduleDetail->office_id = $officeId;
                    $scheduleDetail->schedule_id = $schedule->id;
                    $scheduleDetail->subject_id = $subjectItem->id;
                    $scheduleDetail->subject_type = '1';
                    $scheduleDetail->remark = $subjectItem->description;
                    $scheduleDetail->save();
                }

                $schedule->title = $schedule->title.$staff->title;
                $schedule->save();

                $dateStart = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+3 hours', strtotime($dateStart)));
                $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+2 hours', strtotime($dateStart)));
            }

            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
        MessageHelper::getFlashSaveSuccess();
        return $this->redirect(['view']);
    }

    public function actionCreateAssessment(): Response
    {
        $faker = Factory::create();

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $officeId = 1;
            $schedules = Schedule::find()->where(['office_id' => $officeId])->all();
            foreach ($schedules as $scheduleItem) {
                $assessment = new Assessment();
                $assessment->office_id = $officeId;
                $assessment->schedule_id = $scheduleItem->id;
                $assessment->period_id = $scheduleItem->period_id;
                $assessment->title = $scheduleItem->title;
                $assessment->description = $scheduleItem->description;
                $assessment->date_start = $scheduleItem->date_start;
                $assessment->date_end = $scheduleItem->date_end;
                $assessment->save();


                $participants = Participant::find()
                    ->where(['office_id'=>$officeId,'group_id'=>$scheduleItem->group_id])
                    ->all();

                foreach ($participants as $participantItem) {
                    $scheduleDetails = ScheduleDetail::find()
                        ->where(['office_id' => $officeId, 'schedule_id' => $scheduleItem->id])
                        ->all();




                }
            }




            $groups = Group::find()->where(['office_id' => $officeId])->all();

            $dateStart = date(Yii::$app->params['datetimeSaveFormat']);
            $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+2 hours', strtotime($dateStart)));

            foreach ($groups as $groupItem) {

                $period = Period::findOne(['office_id' => $officeId]);
                $room = Room::findOne(['office_id' => $officeId]);
                $staff = Staff::findOne(['office_id' => $officeId]);

                $schedule = new Schedule();
                $schedule->office_id = $officeId;
                $schedule->group_id = $groupItem->id;
                $schedule->period_id = $period->id;
                $schedule->room_id = $room->id;
                $schedule->staff_id = $staff->id;
                $schedule->date_start = $dateStart;
                $schedule->date_end = $dateEnd;
                $schedule->save();

                $subjects = Subject::find()->where(['office_id' => $officeId])->all();
                foreach ($subjects as $subjectItem) {
                    $scheduleDetail = new ScheduleDetail();
                    $scheduleDetail->office_id = $officeId;
                    $scheduleDetail->schedule_id = $schedule->id;
                    $scheduleDetail->subject_id = $subjectItem->id;
                    $scheduleDetail->remark = $subjectItem->description;
                    $scheduleDetail->save();
                }

                $schedule->title = $schedule->title.$staff->title;
                $schedule->save();

                $dateStart = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+3 hours', strtotime($dateStart)));
                $dateEnd = date(Yii::$app->params['datetimeSaveFormat'], strtotime('+2 hours', strtotime($dateStart)));
            }

            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
        MessageHelper::getFlashSaveSuccess();
        return $this->redirect(['view']);
    }
}
