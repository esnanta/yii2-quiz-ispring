<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Assessment;
use common\models\Participant;
use common\models\Period;
use common\models\PeriodSearch;
use common\models\reports\ExportAssessment;
use common\models\reports\ExportParticipant;
use common\models\Schedule;
use common\service\CacheService;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

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
     * Lists all Period models.
     * @return mixed
     */
    public function actionParticipantCard()
    {
        $model      = new ExportParticipant();
        $file_name  = 'participant-card.xls';

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
