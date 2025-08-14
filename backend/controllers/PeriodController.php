<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Asset;
use common\models\Period;
use common\models\PeriodSearch;
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
class PeriodController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                    'toggle' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Period models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-period')) {
            $searchModel = new PeriodSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $officeList = DataListService::getOffice();
            $isActiveList = Period::getArrayIsActive();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'isActiveList' => $isActiveList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Period model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-period')) {
            $model = $this->findModel($id);
            $officeList = DataListService::getOffice();
            $isActiveList = Period::getArrayIsActive();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'isActiveList' => $isActiveList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Period model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-period')) {

            $model              = new Period;
            $model->is_active   = Period::IS_ACTIVE_YES;
            $model->office_id   = DataIdService::getOfficeId();
            $officeList         = DataListService::getOffice();
            $isActiveList       = Period::getArrayIsActive();

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'isActiveList' => $isActiveList
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
     * Updates an existing Period model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-period')) {
            try {
                $model      = $this->findModel($id);
                $officeList = DataListService::getOffice();
                $isActiveList = Period::getArrayIsActive();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'isActiveList' => $isActiveList
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
     * Deletes an existing Period model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-period')) {
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Toggles the is_active status of an existing Period model.
     * If toggle is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionToggle($id)
    {
        if (Yii::$app->user->can('update-period')) {
            $model = $this->findModel($id);
            
            // Toggle the is_active value
            $model->is_active = ($model->is_active == Period::IS_ACTIVE_YES) 
                ? Period::IS_ACTIVE_NO 
                : Period::IS_ACTIVE_YES;
            
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Status updated successfully.');
            } else {
                Yii::$app->session->setFlash('error', 'Failed to update status.');
            }

            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Period model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Period the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Period::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
