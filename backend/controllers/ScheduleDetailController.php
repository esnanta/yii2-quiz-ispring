<?php

namespace backend\controllers;


use Yii;
use common\models\ScheduleDetail;
use common\models\ScheduleDetailSearch;
use common\domain\DataIdUseCase;
use common\domain\DataListUseCase;
use yii\base\Exception;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;


/**
 * ScheduleDetailController implements the CRUD actions for ScheduleDetail model.
 */
class ScheduleDetailController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                    'delete-file' => ['post'],
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

            $officeList = DataListUseCase::getOffice();
            $scheduleList = DataListUseCase::getSchedule();
            $subjectList = DataListUseCase::getSubject();

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
            $model->office_id = DataIdUseCase::getOfficeId();

            $scheduleList = DataListUseCase::getSchedule();
            $subjectList = DataListUseCase::getSubject();

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
                $scheduleList = DataListUseCase::getSchedule();
                $subjectList = DataListUseCase::getSubject();

                $oldFile = $model->getAssetFile();
                $oldAvatar = $model->asset_name;

                if ($model->load(Yii::$app->request->post())) {
                    // process uploaded asset file instance
                    $asset = $model->uploadAsset();
                    $model->asset_name  = $asset->name;

                    // revert back if no valid file instance uploaded
                    if ($asset === false) {
                        $model->asset_name = $oldAvatar;
                    }

                    if ($model->save()) :
                        // upload only if valid uploaded file instance found
                        if ($asset !== false) { // delete old and overwrite
                            if(file_exists($oldFile)):
                                unlink($oldFile);
                            endif;
                            $path = $model->getAssetFile();
                            $asset->saveAs($path);
                            $model->extract();
                        }
                        MessageHelper::getFlashUpdateSuccess();
                    endif;

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
            $model->deleteAsset();
            $model->removeExtractFolder($model->getExtractDir());
            $model->save();
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
    protected function findModel($id)
    {
        if (($model = ScheduleDetail::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
