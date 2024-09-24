<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Group;
use common\models\GroupSearch;
use common\models\Participant;
use common\service\DataIdService;
use common\service\DataListService;
use Yii;
use yii\db\Exception;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * GroupController implements the CRUD actions for Group model.
 */
class GroupController extends Controller
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
     * Lists all Group models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-group')){
            $searchModel = new GroupSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList = DataListService::getOffice();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList'=>$officeList
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Group model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id,$title=null)
    {
        if(Yii::$app->user->can('view-group')){
            $model = $this->findModel($id);
            $officeList = DataListService::getOffice();
            $listParticipant = Participant::find()
                ->where(['office_id'=>$model->office_id, 'group_id'=>$id])
                ->all();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList'=>$officeList,
                    'listParticipant' => $listParticipant
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     */
    public function actionUpdateParticipant($id, $title=null): Response|string
    {
        // Find the group
        $model = $this->findModel($id);
        $officeList = DataListService::getOffice();
        $groupList = DataListService::getGroup();

        // Find all participants in this group
        $listParticipants = Participant::find()
            ->where(['office_id' => $model->office_id, 'group_id' => $id])
            ->all();

        // If the form is submitted
        if (Yii::$app->request->post()) {
            $postData = Yii::$app->request->post('Participant', []);

            // Loop through the participant data
            foreach ($postData as $index => $participantData) {
                // Find the participant model
                $participant = Participant::findOne($participantData['id']);

                // If participant found, load data and validate/save
                if ($participant) {
                    $participant->load(['Participant' => $participantData]);
                    if (!$participant->save()) {
                        Yii::$app->session->setFlash('error', "Failed to save participant: " . $participant->id);
                    }
                }
            }

            Yii::$app->session->setFlash('success', 'Participants updated successfully.');
            return $this->redirect(['view', 'id' => $id]);
        }

        return $this->render('_form_participant', [
            'group' => $model,
            'officeList' => $officeList,
            'groupList' => $groupList,
            'listParticipants' => $listParticipants
        ]);
    }

    /**
     * Creates a new Group model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-group')){
            $officeId   = DataIdService::getOfficeId();
            $officeList = DataListService::getOffice();

            $model = new Group;
            $model->office_id = $officeId;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } 
                else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList'=>$officeList
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Group model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-group')){
            try {
                $model = $this->findModel($id);
                $officeList = DataListService::getOffice();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeList' => $officeList
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Group model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-group')){
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Group model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Group the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Group::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
