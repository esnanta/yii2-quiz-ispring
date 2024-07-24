<?php

namespace backend\controllers;

use common\domain\DataIdUseCase;
use common\domain\DataListUseCase;
use common\helper\MessageHelper;
use common\models\Theme;
use common\models\ThemeSearch;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * ThemeController implements the CRUD actions for Theme model.
 */
class ThemeController extends Controller
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

    public function actions()
    {

        return [
            'browse-images' => [
                'class' => 'backend\editor\BrowseAction',
                'quality' => 100,
                'maxWidth' => 900,
                'maxHeight' => 900,
                'useHash' => true,
                'url' => '@web/uploads/theme/',
                'path' => '@backend/web/uploads/theme/',
            ],
            'upload-images' => [
                'class' => 'backend\editor\UploadAction',
                'quality' => 100,
                'maxWidth' => 900,
                'maxHeight' => 900,
                'useHash' => true,
                'url' => '@web/uploads/theme/',
                'path' => '@backend/web/uploads/theme/',
            ],
        ];
    }

    /**
     * Lists all Theme models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-theme')) {
            $searchModel = new ThemeSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeId       = DataIdUseCase::getOfficeId();
            $officeList     = DataListUseCase::getOffice();
            $themTypeList   = Theme::getArrayThemeType();

            if ($dataProvider->getTotalCount() == 0) {
                foreach ($themTypeList as $i => $themeType) {
                    $model = new Theme();
                    $model->office_id = $officeId;
                    $model->theme_type = $i;
                    $model->title = $themeType;
                    $model->description = $themeType;
                    $model->save();
                }
                return $this->redirect(['index']);
            }

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'themTypeList'=>$themTypeList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Theme model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-theme')) {
            $model      = $this->findModel($id);
            $officeList = DataListUseCase::getOffice();;

            $oldFile = $model->getImageFile();
            $oldAvatar = $model->asset_name;

            if ($model->load(Yii::$app->request->post())) {
                // process uploaded image file instance
                $image = $model->uploadImage();

                // revert back if no valid file instance uploaded
                if ($image === false) {
                    $model->asset_name = $oldAvatar;
                }

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($image !== false) { // delete old and overwrite
                        file_exists($oldFile) ? unlink($oldFile) : '' ;
                        $path = $model->getImageFile();
                        $image->saveAs($path);
                    }
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view',
                        'id'=>$model->id,
                    ]);
                } else {
                    MessageHelper::getFlashUpdateFailed();
                }
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList'=>$officeList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Theme model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        
        if (!Yii::$app->user->identity->isAdmin) :
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        endif;
        
        
        if (Yii::$app->user->can('create-theme')) {
            $officeId       = DataIdUseCase::getOfficeId();
            $officeList     = DataListUseCase::getOffice();;
            $themTypeList   = Theme::getArrayThemeType();

            $model = new Theme;
            $model->office_id = $officeId;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList'=>$officeList,
                        'themTypeList'=>$themTypeList
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
     * Updates an existing Theme model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-theme')) {
            try {
                $model          = $this->findModel($id);
                $officeList     = DataListUseCase::getOffice();;
                $themTypeList   = Theme::getArrayThemeType();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeList'=>$officeList,
                        'themTypeList'=>$themTypeList
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
     * Deletes an existing Theme model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-theme')) {
            //$this->findModel($id)->delete();
            throw new ForbiddenHttpException;
            //return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Theme model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Theme the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Theme::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionStripTags($id)
    {
        if (Yii::$app->user->can('update-theme')) {
            $model = $this->findModel($id);
            $model->content = strip_tags($model->content);
            $model->save();

            MessageHelper::getFlashSaveSuccess();
            return $this->redirect(['view', 'id'=>$model->id]);
        } else {
            Yii::$app->getSession()->setFlash('danger', ['message' => Yii::t('app', Helper::getAccessDenied())]);
            throw new ForbiddenHttpException;
        }
    }

    public function actionDeleteImage($id)
    {
        if (Yii::$app->user->can('delete-theme')) {
            $model = $this->findModel($id);

            // validate deletion and on failure process any exception
            // e.g. display an error message
            if (!$model->deleteImage()) {
                Yii::$app->session->setFlash('error', 'Error deleting image');
            } else {
                $model->content = '';
                $model->save();
                Yii::$app->getSession()->setFlash('success', ['message' => 'Image removed']);
            }
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['view','id'=>$model->id]);
        } else {
            Yii::$app->getSession()->setFlash('danger', ['message' => Yii::t('app', Helper::getAccessDenied())]);
            throw new ForbiddenHttpException;
        }
    }
}
