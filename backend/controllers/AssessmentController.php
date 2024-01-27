<?php

namespace backend\controllers;

use backend\models\Office;
use backend\models\Schedule;
use backend\models\Subject;
use common\helper\CacheCloud;
use Yii;
use backend\models\Assessment;
use backend\models\AssessmentSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * AssessmentController implements the CRUD actions for Assessment model.
 */
class AssessmentController extends Controller
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
     * Lists all Assessment models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-assessment')){
            $searchModel = new AssessmentSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'scheduleList' => $scheduleList,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Assessment model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-assessment')){
            $model = $this->findModel($id);
            $providerAssessmentDetail = new \yii\data\ArrayDataProvider([
                'allModels' => $model->assessmentDetails,
            ]);

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            return $this->render('view', [
                'model' => $this->findModel($id),
                'providerAssessmentDetail' => $providerAssessmentDetail,
                'scheduleList' => $scheduleList,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Assessment model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-assessment')){
            $model = new Assessment();

            $officeId   = CacheCloud::getInstance()->getOfficeId();

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Assessment model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-assessment')){
            $model = $this->findModel($id);

            $scheduleList = ArrayHelper::map(Schedule::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'scheduleList' => $scheduleList,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Assessment model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-assessment')){
            $model          = $this->findModel($id);
            $modelDetails   = $model->assessmentDetails;

            $transaction = \Yii::$app->db->beginTransaction();
            try {
                foreach ($modelDetails as $modelDetailItem) {
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
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    
    /**
     * Finds the Assessment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Assessment the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Assessment::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
    
    /**
    * Action to load a tabular form grid
    * for AssessmentDetail
    * @author Yohanes Candrajaya <moo.tensai@gmail.com>
    * @author Jiwantoro Ndaru <jiwanndaru@gmail.com>
    *
    * @return mixed
    */
    public function actionAddAssessmentDetail()
    {
        if (Yii::$app->request->isAjax) {
            $row = Yii::$app->request->post('AssessmentDetail');
            if (!empty($row)) {
                $row = array_values($row);
            }
            if((Yii::$app->request->post('isNewRecord') && Yii::$app->request->post('_action') == 'load' && empty($row)) || Yii::$app->request->post('_action') == 'add')
                $row[] = [];
            return $this->renderAjax('_formAssessmentDetail', ['row' => $row]);
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
