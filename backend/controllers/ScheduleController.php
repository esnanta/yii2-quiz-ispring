<?php

namespace backend\controllers;

use common\domain\DataIdUseCase;
use common\domain\DataListUseCase;
use common\models\Archive;
use Yii;
use common\models\Schedule;
use common\models\ScheduleSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;

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
     * Lists all Schedule models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-schedule')) {
            $searchModel = new ScheduleSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $periodList = DataListUseCase::getPeriod();
            $roomList = DataListUseCase::getRoom();
            $groupList = DataListUseCase::getGroup();
            $isAssetList = Schedule::getArrayIsAsset();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'periodList' => $periodList,
                'roomList' => $roomList,
                'groupList' => $groupList,
                'isAssetList' => $isAssetList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Schedule model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id, $title = null)
    {
        if (Yii::$app->user->can('view-schedule')) {
            $model = $this->findModel($id);
            $providerScheduleDetail = new \yii\data\ArrayDataProvider([
                'allModels' => $model->scheduleDetails,
            ]);

            $timeStart          = strtotime($model->date_start);
            $timeOut            = strtotime($model->date_end);
            $tokenTime          = strtotime($model->token_time);
            $countdownTime      = strtotime($model->date_start);
            $currentTime        = strtotime("now");
            $interval           = (int)(abs(($currentTime-$timeStart) / 60));
            $minutesTolerance   = 15; //minutes

            //FIRST TOKEN START 2 MINUTES EARLY FROM DATE_START
            if($currentTime <= $timeStart) {
                // Decrease 2 minutes from current time
                $countdownTime      = $timeStart - (2 * 60);
                $interval           = (int)(abs(($timeStart - $countdownTime) / 60));
                $model->token_time  = date(Yii::$app->params['datetimeSaveFormat']);
                $model->token       = substr(uniqid('', true), -6);
                $model->save();
            } else {
                //START NEW TOKEN
                if($currentTime < $timeOut){
                    $interval = (int)(abs(($currentTime-$tokenTime) / 60));
                    if ($interval >= $minutesTolerance) :
                        $schedule = Schedule::findOne(['id' => $model->id,'office_id'=>$model->office_id]);
                        if($model->token_time < $schedule->token_time) {
                            $model = $schedule;
                        } else {
                            $model->token_time = date(Yii::$app->params['datetimeSaveFormat']);
                            $model->token = substr(uniqid('', true), -6);
                            $model->save();
                        }
                    endif;
                    $countdownTime = strtotime($model->token_time) + ($minutesTolerance * 60);
                }
            }


            return $this->render('view', [
                'model' => $this->findModel($id),
                'providerScheduleDetail' => $providerScheduleDetail,
                'countdownTime' => $countdownTime,
                'interval' => $interval,
                'minutesTolerance' => $minutesTolerance
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Schedule model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-schedule')) {

            $model = new Schedule();
            $model->office_id = DataIdUseCase::getOfficeId();
            $model->date_start = date(Yii::$app->params['datetimeSaveFormat']);
            $model->date_end = date(Yii::$app->params['datetimeSaveFormat']);

            $periodList = DataListUseCase::getPeriod();
            $roomList = DataListUseCase::getRoom();
            $groupList = DataListUseCase::getGroup();
            $subjectList = DataListUseCase::getSubject();
            $staffList = DataListUseCase::getStaff();

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                $model->updateIsAsset();
                MessageHelper::getFlashSaveSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'periodList' => $periodList,
                    'roomList' => $roomList,
                    'groupList' => $groupList,
                    'subjectList' => $subjectList,
                    'staffList' => $staffList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Schedule model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-schedule')) {
            $model = $this->findModel($id);
            $officeList = DataListUseCase::getOffice();
            $periodList = DataListUseCase::getPeriod();
            $roomList = DataListUseCase::getRoom();
            $groupList = DataListUseCase::getGroup();
            $subjectList = DataListUseCase::getSubject();
            $staffList = DataListUseCase::getStaff();

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                $model->updateIsAsset();
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id,'title'=>$model->title]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'periodList' => $periodList,
                    'roomList' => $roomList,
                    'groupList' => $groupList,
                    'subjectList' => $subjectList,
                    'staffList' => $staffList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Schedule model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     * @throws NotFoundHttpException
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-schedule')) {
            $model = $this->findModel($id);
            $modelDetails = $model->scheduleDetails;

            $transaction = \Yii::$app->db->beginTransaction();
            try {
                foreach ($modelDetails as $modelDetailItem) {
                    $modelDetailItem->deleteAsset();
                    $modelDetailItem->removeExtractFolder($modelDetailItem->getExtractDir());
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
     * Finds the Schedule model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Schedule the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Schedule::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }

    /**
     * Action to load a tabular form grid
     * for ScheduleDetail
     * @return mixed
     * @author Jiwantoro Ndaru <jiwanndaru@gmail.com>
     *
     * @author Yohanes Candrajaya <moo.tensai@gmail.com>
     */
    public function actionAddScheduleDetail()
    {
        if (Yii::$app->request->isAjax) {
            $subjectList = DataListUseCase::getSubject();

            $row = Yii::$app->request->post('ScheduleDetail');
            if (!empty($row)) {
                $row = array_values($row);
            }
            if ((Yii::$app->request->post('isNewRecord') && Yii::$app->request->post('_action') == 'load' && empty($row)) || Yii::$app->request->post('_action') == 'add')
                $row[] = [];
            return $this->renderAjax('_formScheduleDetail', [
                'row' => $row,
                'subjectList' => $subjectList
            ]);
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
