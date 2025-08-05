<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Staff;
use common\models\StaffSearch;
use common\service\DataListService;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\helpers\FileHelper;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * StaffController implements the CRUD actions for Staff model.
 */
class StaffController extends Controller
{
    
    public static $pathTmpCrop= '/uploads/tmp';
    
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

    public function actions()
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . self::$pathTmpCrop;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }

        return [
            'avatar' => [
                'class' => 'budyaga\cropper\actions\UploadAction',
                'url' => Yii::$app->urlManager->baseUrl.self::$pathTmpCrop,
                'path' => str_replace('frontend', 'backend', Yii::getAlias('@webroot')).self::$pathTmpCrop,
                //'name' => Yii::$app->security->generateRandomString(),
                'width'=> '400',
                'height'=> '400' ,
                'maxSize'=> 4097152,
            ]
        ];
    }
    
    /**
     * Lists all Staff models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-staff')) {
            $searchModel = new StaffSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $officeList         = DataListService::getOffice();
            $employmentList     = DataListService::getEmployment();
            $genderList         = Staff::getArrayGenderStatus();
            $activeStatusList   = Staff::getArrayActiveStatus();
            
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'employmentList'=> $employmentList,
                'genderList' => $genderList,
                'activeStatusList' => $activeStatusList
                    
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Staff model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-staff')) {
            $model              = $this->findModel($id);
            $genderList         = Staff::getArrayGenderStatus();
            $activeStatusList   = Staff::getArrayActiveStatus();
            $officeList         = DataListService::getOffice();
            $employmentList     = DataListService::getEmployment();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'employmentList'=> $employmentList,
                    'genderList' => $genderList,
                    'activeStatusList' => $activeStatusList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Staff model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     * @throws StaleObjectException|ForbiddenHttpException
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-staff')) {
            $model              = new Staff;
            $genderList         = Staff::getArrayGenderStatus();
            $activeStatusList   = Staff::getArrayActiveStatus();
            $officeList         = DataListService::getOffice();
            $employmentList     = DataListService::getEmployment();

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'employmentList'=> $employmentList,
                        'genderList' => $genderList,
                        'activeStatusList' => $activeStatusList
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
     * Updates an existing Staff model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    
    
    public function actionUpdate($id,$title=null)
    {
    
        if (Yii::$app->user->can('update-staff')) {
            try {

                $model          = $this->findModel($id);
                $currentAsset   = $model->asset_name;
                $officeList     = DataListService::getOffice();

                if ($model->load(Yii::$app->request->post())) {
                    $urlTmpCrop         = Yii::$app->urlManager->baseUrl.self::$pathTmpCrop;
                    $model->asset_name  = str_replace($urlTmpCrop, '', $model->asset_name);
                    $model->asset_name  = str_replace('/', '', $model->asset_name);
                    $temporaryAsset     = $model->asset_name;

                    $isFileExisted = $model->getAssetFile(true);
                    if(!file_exists($isFileExisted)):
                        MessageHelper::getFlashCropImage();
                        return $this->render('update', [
                            'model' => $model,
                            'officeList' => $officeList
                        ]);
                    endif;

                    if ($model->save()) {
                        //DELETE CURRENT ASSET
                        $model->asset_name = $currentAsset;
                        $model->deleteAsset(false);

                        //SET ASSET TEMPORARY
                        //MOVE FROM TMP DIR TO MODEL DIR
                        //DELETE ASSET TEMPORARY
                        $model->asset_name = $temporaryAsset;
                        rename($model->getAssetFile(true), $model->getAssetFile(false));
                        $model->deleteAsset(true);

                        MessageHelper::getFlashUpdateSuccess();
                        return $this->redirect(['view', 'id'=>$model->id, 'title'=>$model->title]);
                    } else {
                        MessageHelper::getFlashSaveFailed();
                    }
                }
                return $this->render('update', [
                    'model' => $model,
                    'officeList' => $officeList
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
     * Deletes an existing Staff model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     * @throws NotFoundHttpException
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-staff')) {
            $model = $this->findModel($id);
            $model->delete();
            $model->deleteAsset();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Staff model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Staff the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Staff::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
