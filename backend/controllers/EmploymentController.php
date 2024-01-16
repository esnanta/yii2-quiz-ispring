<?php

namespace backend\controllers;

use Yii;
use backend\models\Employment;
use backend\models\EmploymentSearch;
use backend\models\Office;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

use common\helper\CacheCloud;
use common\helper\MessageHelper;

/**
 * EmploymentController implements the CRUD actions for Employment model.
 */
class EmploymentController extends Controller
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
     * Lists all Employment models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-employment')) {
            $searchModel = new EmploymentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            
            $cacheCloud = new CacheCloud();
            $officeId   = $cacheCloud->getOfficeId();

            $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $officeId])
                    ->asArray()->all(), 'id', 'title');
            
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList'=>$officeList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Employment model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-employment')) {
            $model = $this->findModel($id);

            $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $model->office_id])
                    ->asArray()->all(), 'id', 'title');
            
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
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
     * Creates a new Employment model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-employment')) {
            $cacheCloud = new CacheCloud();
            $officeId   = $cacheCloud->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $officeId])
                    ->asArray()->all(), 'id', 'title');
            
            $model = new Employment;
            $model->office_id = $officeId;
            
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList'=>$officeList
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
     * Updates an existing Employment model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-employment')) {
            try {
                
                $model = $this->findModel($id);
                $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $model->office_id])
                    ->asArray()->all(), 'id', 'title');

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeList' => $officeList
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
     * Deletes an existing Employment model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-employment')) {
            $this->findModel($id)->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Employment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Employment the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Employment::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
