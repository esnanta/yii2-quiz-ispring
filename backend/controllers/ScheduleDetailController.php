<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\ScheduleDetail;
use common\models\ScheduleDetailSearch;
use common\service\DataIdService;
use common\service\DataListService;
use common\service\ScheduleDetailService;
use Yii;
use yii\base\Exception;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;


/**
 * ScheduleDetailController implements the CRUD actions for ScheduleDetail model.
 */
class ScheduleDetailController extends Controller
{

    public function behaviors(): array
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                    'delete-file' => ['post'],
                    'delete-assessment' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all ScheduleDetail models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-scheduledetail')) {
            $searchModel = new ScheduleDetailSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single ScheduleDetail model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-scheduledetail')) {
            $model = $this->findModel($id);

            $officeList = DataListService::getOffice();
            $scheduleList = DataListService::getSchedule();
            $subjectList = DataListService::getSubject();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'scheduleList' => $scheduleList,
                    'subjectList' => $subjectList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new ScheduleDetail model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-scheduledetail')) {
            $model = new ScheduleDetail;
            $model->office_id = DataIdService::getOfficeId();

            $scheduleList = DataListService::getSchedule();
            $subjectList = DataListService::getSubject();

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'scheduleList' => $scheduleList,
                        'subjectList' => $subjectList
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
     * Updates an existing ScheduleDetail model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-scheduledetail')) {
            try {

                $model = $this->findModel($id);
                $scheduleList = DataListService::getSchedule();
                $subjectList = DataListService::getSubject();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashUpdateSuccess();
                    $model->schedule->updateIsAsset();
                    return $this->redirect(['schedule/view', 'id' => $model->schedule_id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'scheduleList' => $scheduleList,
                        'subjectList' => $subjectList
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
     * Deletes an existing ScheduleDetail model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-scheduledetail')) {
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     * @throws ForbiddenHttpException
     */
    public function actionDeleteFile($id)
    {
        if (Yii::$app->user->can('delete-scheduledetail')) {
            $model  = $this->findModel($id);
            $model->save();
            $model->schedule->updateIsAsset();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect([
                'schedule/view',
                'id' => $model->schedule_id,
                'title'=>$model->schedule->title
            ]);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the ScheduleDetail model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ScheduleDetail the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id): ScheduleDetail
    {
        if (($model = ScheduleDetail::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
