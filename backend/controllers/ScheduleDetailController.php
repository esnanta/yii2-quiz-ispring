<?php

namespace backend\controllers;

use backend\models\Office;
use backend\models\Schedule;
use backend\models\Subject;
use common\helper\CacheCloud;
use Yii;
use backend\models\ScheduleDetail;
use backend\models\ScheduleDetailSearch;
use yii\base\Exception;
use yii\helpers\ArrayHelper;
use yii\helpers\FileHelper;
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

            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['id' => $model->schedule_id])
                ->asArray()->all(), 'id', 'title');

            $subjectList = ArrayHelper::map(Subject::find()
                ->where(['id' => $model->subject_id])
                ->asArray()->all(), 'id', 'title');

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
            $officeId = CacheCloud::getInstance()->getOfficeId();
            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $subjectList = ArrayHelper::map(Subject::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $model = new ScheduleDetail;
            $model->office_id = $officeId;

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

                $scheduleList = ArrayHelper::map(Schedule::find()
                    ->where(['id' => $model->schedule_id])
                    ->asArray()->all(), 'id', 'title');

                $subjectList = ArrayHelper::map(Subject::find()
                    ->where(['id' => $model->subject_id])
                    ->asArray()->all(), 'id', 'title');

                $oldFile = $model->getAssetFile();
                $oldAvatar = $model->asset_name;

                if ($model->load(Yii::$app->request->post())) {
                    // process uploaded asset file instance
                    $asset = $model->uploadAsset();
                    $model->asset_name  = $asset->name;
                    $model->asset_url   = $model->getPath().'/'.$asset->name;

                    // revert back if no valid file instance uploaded
                    if ($asset === false) {
                        $model->asset_name = $oldAvatar;
                    }

                    if ($model->save()) :
                        // upload only if valid uploaded file instance found
                        if ($asset !== false) { // delete old and overwrite
                            file_exists($oldFile) ? unlink($oldFile) : '';
                            $path = $model->getAssetFile();
                            $asset->saveAs($path);

                            //$zip = new ZipArchive;



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

    public function actionDeleteFile($id)
    {
        if (Yii::$app->user->can('delete-scheduledetail')) {
            $model  = ScheduleDetail::find()->where(['id'=>$id])->one();
            $model->deleteAsset();
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

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     */
    public function actionTest(){
        $model = $this->findModel(53);

        //Get the file then extract
        $fileLocation = Yii::getAlias('@backend').'/web'.$model->asset_url;
        $zipArchive = Yii::$app->zipper->open($fileLocation, 'zip');

        /*
            Create an extract directory
            1. FORMAT : DATE-SUBJECT
        */

        //Combine date and subject and id
        $tmpDate = substr($model->schedule->date_start,0,10);
        $date = str_replace('-','',$tmpDate);
        $combinedName = $model->getPath().'/'.$date.'-'.$model->subject->title.'-'.$model->id;

        //Create extract directory -> PATH / DATE AND SUBJECT
        $extractDirectory = Yii::getAlias('@backend').'/web'.$combinedName;
        FileHelper::createDirectory($extractDirectory, $mode = 0777);
        $zipArchive->extract($extractDirectory);

        //THIS IS FOR INDEX.HTML DIRECTORY
        $deleteExt = substr($model->asset_name, 0, strpos($model->asset_name, "."));
        $url = $combinedName.'/'.$deleteExt;


        $model->asset_name = 'index.html';
        $model->asset_url = $url;
        $model->save();

    }

}
