<?php

namespace backend\controllers;

use backend\models\Office;
use common\helper\CacheCloud;
use Yii;
use backend\models\Archive;
use backend\models\ArchiveCategory;
use backend\models\ArchiveSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\db\StaleObjectException;

use common\helper\MessageHelper;

/**
 * ArchiveController implements the CRUD actions for Archive model.
 */
class ArchiveController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Archive models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-archive')) {
            $searchModel = new ArchiveSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $archiveCategoryList   = ArrayHelper::map(ArchiveCategory::find()->asArray()->all(), 'id', 'title');
            $isVisibleList         = Archive::getArrayIsVisible();
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' =>$officeList,
                'archiveCategoryList' => $archiveCategoryList,
                'isVisibleList' => $isVisibleList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Archive model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-archive')) {
            $model                  = $this->findModel($id);
            $officeList             = ArrayHelper::map(Office::find()
                                        ->where(['id' => $model->office_id])
                                        ->asArray()->all(), 'id', 'title');
            $archiveCategoryList    = ArrayHelper::map(ArchiveCategory::find()->asArray()->all(), 'id', 'title');
            $isVisibleList          = Archive::getArrayIsVisible();
            $archiveTypeList        = Archive::getArrayArchiveType();

            $oldFile = $model->getAssetFile();
            $oldAvatar = $model->file_name;

            if ($model->load(Yii::$app->request->post())) {
                // process uploaded asset file instance
                $asset = $model->uploadAsset();

                // revert back if no valid file instance uploaded
                if ($asset === false) {
                    $model->file_name = $oldAvatar;
                    //$model->title = $oldFileName;
                }

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($asset !== false) { // delete old and overwrite
                        file_exists($oldFile) ? unlink($oldFile) : '' ;
                        $path = $model->getAssetFile();
                        $asset->saveAs($path);
                    }
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id'=>$model->id]);
                } else {
                    // error in saving model
                }
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'archiveCategoryList'=>$archiveCategoryList,
                    'isVisibleList' => $isVisibleList,
                    'archiveTypeList' => $archiveTypeList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Archive model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-archive')) {

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $model = new Archive;
            $model->office_id       = $officeId;
            $model->date_issued     = date(Yii::$app->params['dateSaveFormat']);
            $model->is_visible      = Archive::IS_VISIBLE_PRIVATE;
            
            $archiveCategoryList    = ArrayHelper::map(ArchiveCategory::find()->asArray()->all(), 'id', 'title');
            $archiveTypeList        = Archive::getArrayArchiveType();
            $isVisibleList          = Archive::getArrayIsVisible();
            
            try {
                if ($model->load(Yii::$app->request->post())) {
                    // process uploaded asset file instance
                    $asset = $model->uploadAsset();

                    if ($model->save()) {
                        // upload only if valid uploaded file instance found
                        if ($asset !== false) {
                            $path = $model->getAssetFile();
                            $asset->saveAs($path);
                        }
                        MessageHelper::getFlashSaveSuccess();
                        return $this->redirect(['view', 'id'=>$model->id]);
                    } else {
                        // error in saving model
                    }
                }
                return $this->render('create', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'archiveCategoryList'=>$archiveCategoryList,
                    'isVisibleList' => $isVisibleList,
                    'archiveTypeList' => $archiveTypeList,
                ]);
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Archive model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-archive')) {
            $model = $this->findModel($id);
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            $archiveCategoryList    = ArrayHelper::map(ArchiveCategory::find()->asArray()->all(), 'id', 'title');
            $archiveTypeList        = Archive::getArrayArchiveType();
            $isVisibleList          = Archive::getArrayIsVisible();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'archiveCategoryList'=>$archiveCategoryList,
                    'isVisibleList' => $isVisibleList,
                    'archiveTypeList' => $archiveTypeList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Archive model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-archive')) {
            $model = $this->findModel($id);
            // validate deletion and on failure process any exception
            // e.g. display an error message
            if ($model->delete()) {
                if (!$model->deleteAsset()) {
                    Yii::$app->session->setFlash('error', 'Error deleting file');
                }
            }
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }
    
    public function actionDeleteFile($id)
    {
        if (Yii::$app->user->can('delete-archive')) {
            $model  = Archive::find()->where(['id'=>$id])->one();
            $model->deleteAsset();
            $model->save();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['archive/view', 'id' => $model->id, 'title'=>$model->title]);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Archive model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Archive the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id): Archive
    {
        if (($model = Archive::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionDownload($id,$title=null)
    {
        $model  = $this->findModel($id);
        $path   = $model->getAssetFile();
        if (!empty($path)) {
            return $model->downloadFile($path);
        } else {
            throw new NotFoundHttpException("can't find {$model->title} file");
        }
    }
}
