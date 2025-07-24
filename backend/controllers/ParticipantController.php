<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\helper\SpreadsheetHelper;
use common\models\Assessment;
use common\models\Asset;
use common\models\AssetSearch;
use common\models\Participant;
use common\models\ParticipantImport;
use common\models\ParticipantSearch;
use common\models\Subject;
use common\service\AssessmentService;
use common\service\AssetService;
use common\service\DataIdService;
use common\service\DataListService;
use common\service\ParticipantService;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * ParticipantController implements the CRUD actions for Participant model.
 */
class ParticipantController extends Controller
{

    private AssetService $assetService;

    public function __construct($id, $module,
                                AssetService $assetService, $config = [])
    {
        $this->assetService = $assetService;
        parent::__construct($id, $module, $config);
    }

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
     * Lists all Participant models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-participant')){
            $searchModel = new ParticipantSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();
            $statusList = Participant::getArrayStatus();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'groupList' => $groupList,
                'statusList' => $statusList
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Participant model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    public function actionView($id,$title=null)
    {
        if(Yii::$app->user->can('view-participant')){
            $model      = $this->findModel($id);
            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'groupList' => $groupList,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Participant model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-participant')){

            $officeId   = DataIdService::getOfficeId();
            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();

            $model = new Participant;
            $model->office_id = $officeId;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } 
                else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'groupList' => $groupList
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

    public function actionSelect(){
        if(Yii::$app->user->can('create-participant')){
            $searchModel    = new AssetSearch();
            $dataProvider   = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['asset_type' => Asset::ASSET_TYPE_SPREADSHEET]);

            $officeList = DataListService::getOffice();

            return $this->render('select_asset', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'officeList' => $officeList,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    //$id = asset id
    public function actionImport($id,$title=null)
    {
        if(Yii::$app->user->can('create-participant')){
            $officeId       = DataIdService::getOfficeId();
            $officeList     = DataListService::getOffice();
            $assetList      = DataListService::getAsset();
            $groupList      = DataListService::getGroup();

            $model = new ParticipantImport();
            $model->office_id = $officeId;
            $model->asset_id = $id;

            $asset = Asset::find()->where(['id'=>$model->asset_id])->one();
            $inputFileName = $this->assetService->getAssetFile($asset);

            $helper = SpreadsheetHelper::getInstance()->getHelper();
            $sheetName = SpreadsheetHelper::getInstance()->getSheetName();
            $reader = SpreadsheetHelper::getInstance()->getReader($inputFileName,$sheetName);
            $spreadsheet = $reader->load($inputFileName);
            $activeRange = $spreadsheet->getActiveSheet()->calculateWorksheetDataDimension();
            $sheetData = $spreadsheet->getActiveSheet()->rangeToArray(
                $activeRange, null, true, true, true
            );
            $data = $spreadsheet->getActiveSheet();
            $dataList = SpreadsheetHelper::getInstance()->getDataList($data);

            try {
                if ($model->load(Yii::$app->request->post())) {

                    $transaction = \Yii::$app->db->beginTransaction();
                    try {
                        $counter = 0;
                        foreach (array_filter($dataList) as $i=>$data){
                            if(sizeof($data) > 2){
                                $identityNumber = $data[0];
                                $title = $data[1];
                                $email = $data[2];

                                $participant = Participant::find()
                                    ->where(['office_id' => $officeId,
                                        'identity_number' => $identityNumber])
                                    ->one();

                                if(empty($participant)):
                                    $participant = new Participant();
                                    $participant->office_id         = $model->office_id;
                                    $participant->group_id          = $model->group_id;
                                    $participant->identity_number   = $identityNumber;
                                    $participant->title             = $title;
                                    $participant->email             = $email;
                                    $participant->save();
                                    $counter++;
                                endif;
                            }
                        }

                        $transaction->commit();
                        MessageHelper::getFlashSaveSuccess();
                        Yii::$app->getSession()->setFlash(
                                'success',
                                ['message' => Yii::t(
                                    'app',
                                    'Saved '.$counter.' records.'
                                )]
                        );
                        return $this->redirect(['index']);
                    } catch (\Exception|\Throwable $e) {
                        $transaction->rollBack();
                        throw $e;
                    }
                }
                else {
                    $duplicateData = ParticipantService::checkDuplicate($dataList);
                    return $this->render('import', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'groupList' => $groupList,
                        'assetList' => $assetList,
                        'helper' => $helper,
                        'sheetData' => $sheetData,
                        'duplicateData' => $duplicateData
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
     * Updates an existing Participant model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-participant')){
            try {
                $model      = $this->findModel($id);
                $officeList = DataListService::getOffice();;

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
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
     * Deletes an existing Participant model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-participant')){
            $this->findModel($id)->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Participant model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Participant the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Participant::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionDownload()
    {
        $fileName = 'template_participant.xlsx';
        $path = str_replace('frontend', 'backend', Yii::getAlias('@webroot'))
                    . '/template/' . $fileName;

        if (!empty($path)) {

            header('Content-Type:text/plain; charset=ISO-8859-15');
            //if you want to read text file using text/plain header
            header('Content-Disposition: attachment; filename="' . basename($path) . '"');
            header('Content-Length: ' . filesize($path));
            readfile($path);

            Yii::app()->end();

        } else {
            throw new NotFoundHttpException();
        }
    }


    public function actionReset($id, $schId=null, $title=null)
    {
        if(Yii::$app->user->can('update-participant')){
            $model = Participant::findOne($id);
            $model->status = Participant::STATUS_INACTIVE;
            $model->save();
            MessageHelper::getFlashResetSuccess();
            if($schId==null){
                return $this->redirect(['index']);
            }
            return $this->redirect(['schedule/view', 'id' => $schId]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
