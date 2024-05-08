<?php

namespace frontend\controllers;

use common\models\Assessment;
use common\models\Participant;

use common\models\Period;
use Yii;
use common\models\AssessmentDetail;
use frontend\models\AssessmentDetailSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;


/**
 * AssessmentDetailController implements the CRUD actions for AssessmentDetail model.
 */
class AssessmentDetailController extends Controller
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
     * Lists all AssessmentDetail models.
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionIndex($user=null)
    {
        try {
            $participant = Participant::findone(['username' => Yii::$app->user->identity->username]);
            $searchModel = new AssessmentDetailSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $dataProvider->query->andWhere(['participant_id' => $participant->id]);

            $officeId = $participant->office_id;
            $assessmentList = ArrayHelper::map(Assessment::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $periodList = ArrayHelper::map(Period::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            //ONLY DISPLAY 1 PARTICIPANT
            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $officeId])
                ->andWhere(['id' => $participant->id])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'assessmentList' => $assessmentList,
                'periodList' => $periodList,
                'participantList' => $participantList
            ]);
        } catch (\Exception $e){
            throw new NotFoundHttpException($e->getMessage());
        }
    }

    /**
     * Displays a single AssessmentDetail model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionView($id)
    {
        try {
            $model = AssessmentDetail::find()
            ->where(['id'=>$id])
            ->one();

            $assessmentList = ArrayHelper::map(Assessment::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            $participantList = ArrayHelper::map(Participant::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'assessmentList' => $assessmentList,
                    'participantList' => $participantList
                ]);
            }
        } catch (\Exception $e){
            throw new NotFoundHttpException($e->getMessage());
        }
    }

}
