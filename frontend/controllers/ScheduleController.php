<?php

namespace frontend\controllers;

use common\models\Assessment;
use common\models\Participant;
use common\models\ScheduleDetail;
use common\service\ScheduleDetailService;
use Yii;
use yii\base\Exception;
use yii\filters\VerbFilter;
use yii\web\Controller;

/**
 * ScheduleController implements the CRUD actions for Schedule model.
 */
class ScheduleController extends Controller
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
     * Logs out the current user.
     * $id = Schedule Detail Id
     * Example link :
     * http://www.mywebsite.com/presentation/index.html?USER_NAME=John&USER_EMAIL=john@ispringsolutions.com&ADDRESS=NYC
     * @throws Exception
     */
    public function actionOpen($id, $title=null)
    {
        $scheduleDetail = ScheduleDetail::findOne($id);
        $scheduleDetailService = new ScheduleDetailService();
        $participant = Participant::findone([
            'office_id' => $scheduleDetail->office_id,
            'username'=>Yii::$app->user->identity->username]);

        $assessment = new Assessment();
        $assessment->schedule_detail_id = $scheduleDetail->id;
        $assessment->office_id = $scheduleDetail->office_id;
        $assessment->schedule_id = $scheduleDetail->schedule_id;
        $assessment->participant_id = $participant->id;
        $assessment->period_id = $scheduleDetail->schedule->period_id;
        $assessment->group_id = $scheduleDetail->schedule->group_id;
        $assessment->subject_id = $scheduleDetail->subject_id;
        $assessment->question_type = $scheduleDetail->question_type;
        $assessment->save();

        $textLink = $scheduleDetailService->generateTextLink($scheduleDetail);
        $this->redirect($textLink);
    }
}
