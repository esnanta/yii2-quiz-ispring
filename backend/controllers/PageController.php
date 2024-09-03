<?php

namespace backend\controllers;


use common\helper\MessageHelper;
use common\models\Page;
use common\models\PageSearch;
use common\service\DataListService;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * ThemeDetailController implements the CRUD actions for Page model.
 */
class PageController extends Controller
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

    
    public function actions() {

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
     * Lists all Page models.
     * @return mixed
     */
    public function actionIndex($type)
    {
        if(Yii::$app->user->can('index-page')){
            $searchModel    = new PageSearch;
            $dataProvider   = $searchModel->search(Yii::$app->request->getQueryParams());
            $dataProvider->query->andWhere(['page_type' => $type]);

            $dataList       = DataListService::getPage();
            $pageTypeList   = Page::getArrayPageType();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'pageTypeList' => $pageTypeList,
                'dataList'=>$dataList,
            ]);           
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         
    }

    /**
     * Displays a single Page model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-page')){
            $model          = $this->findModel($id);
            $dataList       = DataListService::getPage();
            $pageTypeList   = Page::getArrayPageType();

            $oldFile = $model->getImageFile();
            $oldAvatar = $model->asset_name;
            $oldFileName = $model->title;         
            
            if ($model->load(Yii::$app->request->post())) {
                // process uploaded image file instance
                $image = $model->uploadImage();

                // revert back if no valid file instance uploaded
                if ($image === false) {
                    $model->asset_name = $oldAvatar;
                    //$model->title = $oldFileName;
                }

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($image !== false) { // delete old and overwrite
                        file_exists($oldFile) ? unlink($oldFile) : '' ;
                        $path = $model->getImageFile();
                        $image->saveAs($path);
                    }
                    return $this->redirect(['view', 'id'=>$model->id]);
                } 
                else {
                    // error in saving model
                }
            }  
            else {
                return $this->render('view', [
                    'model' => $model,
                    'dataList' => $dataList,
                    'pageTypeList' => $pageTypeList,
                ]);
            }            
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }          
    }

    /**
     * Creates a new Page model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-page')){
            $model          = new Page;
            $dataList       = DataListService::getPage();
            $pageTypeList   = Page::getArrayPageType();
            
            if ($model->load(Yii::$app->request->post())) {
                // process uploaded image file instance
                $image = $model->uploadImage();    

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($image !== false) {
                        $path = $model->getImageFile();
                        $image->saveAs($path);
                    }
                    return $this->redirect(['view', 'id'=>$model->id]);
                } else {
                    // error in saving model
                }
            }
            return $this->render('create', [
                'model'=>$model,
                'dataList'=>$dataList,
                'pageTypeList' => $pageTypeList,
            ]);           
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }          
        
    }

    /**
     * Updates an existing Page model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-page')){
            $model          = $this->findModel($id);
            $dataList       = DataListService::getPage();
            $pageTypeList   = Page::getArrayPageType();

            $oldFile = $model->getImageFile();
            $oldAvatar = $model->content;
            $oldFileName = $model->title;

            if ($model->load(Yii::$app->request->post())) {
                // process uploaded image file instance
                $image = $model->uploadImage();

                // revert back if no valid file instance uploaded
                if ($image === false) {
                    //$model->content = $oldAvatar;
                    //$model->title = $oldFileName;
                }

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($image !== false) { // delete old and overwrite
                        file_exists($oldFile) ? unlink($oldFile) : '' ;
                        $path = $model->getImageFile();
                        $image->saveAs($path);
                    }
                    return $this->redirect(['view', 'id'=>$model->id]);
                } else {
                    // error in saving model
                }
            }
            return $this->render('update', [
                'model'=>$model,
                'dataList'=>$dataList,
                'pageTypeList' => $pageTypeList,
            ]);            
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }           
                    
        
    }

    /**
     * Deletes an existing Page model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-page')){
            $model = $this->findModel($id);

            // validate deletion and on failure process any exception 
            // e.g. display an error message 
            if ($model->delete()) {
                if (!$model->deleteImage()) {
                    MessageHelper::getFlashDeleteFailed();
                }
            }

            return $this->redirect(['index']);          
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         

    }

    /**
     * Deletes an existing Page model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDeleteImage($id)
    {
        if(Yii::$app->user->can('delete-page')){
            $model = $this->findModel($id);

            // validate deletion and on failure process any exception 
            // e.g. display an error message 
            if (!$model->deleteImage()) {
                MessageHelper::getFlashDeleteFailed();
            }
            else{
                $model->content = '';
                $model->save();
                MessageHelper::getFlashDeleteSuccess();
            }

            return $this->redirect(['view','id'=>$model->id]);          
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         

    }    
    
    /**
     * Finds the Page model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Page the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Page::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }


    public function actionStripTags($id){
        if(Yii::$app->user->can('update-page')){

            $model = $this->findModel($id);
            $model->content = strip_tags($model->content);
            $model->save();
            
            return $this->redirect(['view', 'id'=>$model->id]);       
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }          
    }
}
