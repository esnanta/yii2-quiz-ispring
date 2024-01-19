<?php

namespace backend\controllers;

use backend\models\Office;
use backend\models\Participant;
use backend\models\Room;
use backend\models\Subject;
use common\helper\CacheCloud;
use Yii;
use backend\models\Schedule;
use backend\models\ScheduleSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ScheduleController implements the CRUD actions for Schedule model.
 */
class ScheduleController extends Controller
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
     * Lists all Schedule models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-schedule')){
            $searchModel = new ScheduleSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $subjectList = ArrayHelper::map(Subject::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $roomList = ArrayHelper::map(Room::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'subjectList' => $subjectList,
                'roomList' => $roomList
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Schedule model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-schedule')){
            $model = $this->findModel($id);
            $providerScheduleDetail = new \yii\data\ArrayDataProvider([
                'allModels' => $model->scheduleDetails,
            ]);
            return $this->render('view', [
                'model' => $this->findModel($id),
                'providerScheduleDetail' => $providerScheduleDetail,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Schedule model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-schedule')){
            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $subjectList = ArrayHelper::map(Subject::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $roomList = ArrayHelper::map(Room::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $model = new Schedule();
            $model->office_id = $officeId;

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'subjectList' => $subjectList,
                    'roomList' => $roomList,
                    'participantList' => $participantList
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Schedule model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-schedule')){
            $model = $this->findModel($id);

            if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Schedule model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     * @throws NotFoundHttpException
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-schedule')){
            $model          = $this->findModel($id);
            $modelDetails   = $model->scheduleDetails;

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

            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    
    /**
     * Finds the Schedule model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Schedule the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Schedule::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
    
    /**
    * Action to load a tabular form grid
    * for ScheduleDetail
    * @author Yohanes Candrajaya <moo.tensai@gmail.com>
    * @author Jiwantoro Ndaru <jiwanndaru@gmail.com>
    *
    * @return mixed
    */
    public function actionAddScheduleDetail()
    {
        if (Yii::$app->request->isAjax) {
            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $row = Yii::$app->request->post('ScheduleDetail');
            if (!empty($row)) {
                $row = array_values($row);
            }
            if((Yii::$app->request->post('isNewRecord') && Yii::$app->request->post('_action') == 'load' && empty($row)) || Yii::$app->request->post('_action') == 'add')
                $row[] = [];
            return $this->renderAjax('_formScheduleDetail', [
                'row' => $row,
                'participantList' => $participantList
            ]);
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
