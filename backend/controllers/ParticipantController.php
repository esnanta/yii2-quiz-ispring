<?php

namespace backend\controllers;

use common\domain\DataIdUseCase;
use common\domain\DataListUseCase;
use common\domain\DataSpreadsheetUseCase;
use common\models\Archive;
use common\models\ArchiveSearch;
use common\models\ParticipantImport;
use common\helper\ReadFilter;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yii;
use common\models\Participant;
use common\models\ParticipantSearch;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ParticipantController implements the CRUD actions for Participant model.
 */
class ParticipantController extends Controller
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
     * Lists all Participant models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-participant')){
            $searchModel = new ParticipantSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList = DataListUseCase::getOffice();
            $groupList  = DataListUseCase::getGroup();
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
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-participant')){
            $model      = $this->findModel($id);
            $officeList = DataListUseCase::getOffice();
            $groupList  = DataListUseCase::getGroup();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'groupList' => $groupList
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

            $officeId   = DataIdUseCase::getOfficeId();
            $officeList = DataListUseCase::getOffice();
            $groupList  = DataListUseCase::getGroup();

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
            $searchModel    = new ArchiveSearch();
            $dataProvider   = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['archive_type' => Archive::ARCHIVE_TYPE_SPREADSHEET]);

            $officeList = DataListUseCase::getOffice();

            return $this->render('select_archive', [
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

    //$id = archive id
    public function actionImport($id,$title=null)
    {
        if(Yii::$app->user->can('create-participant')){
            $officeId       = DataIdUseCase::getOfficeId();
            $officeList     = DataListUseCase::getOffice();
            $archiveList    = DataListUseCase::getArchive();
            $groupList      = DataListUseCase::getGroup();

            $model = new ParticipantImport();
            $model->office_id = $officeId;
            $model->archive_id = $id;

            $archive = Archive::find()->where(['id'=>$model->archive_id])->one();
            $inputFileName = $archive->getAssetFile();

            $helper = DataSpreadsheetUseCase::getInstance()->getHelper();
            $sheetName = DataSpreadsheetUseCase::getInstance()->getSheetName();
            $reader = DataSpreadsheetUseCase::getInstance()->getReader($inputFileName,$sheetName);
            $spreadsheet = $reader->load($inputFileName);
            $activeRange = $spreadsheet->getActiveSheet()->calculateWorksheetDataDimension();
            $sheetData = $spreadsheet->getActiveSheet()->rangeToArray(
                $activeRange, null, true, true, true
            );
            $data = $spreadsheet->getActiveSheet();

            try {
                if ($model->load(Yii::$app->request->post())) {

                    $transaction = \Yii::$app->db->beginTransaction();
                    $dataList = [];
                    try {
                        //$data->getRowIterator(1) = START FROM ROW 1
                        foreach ($data->getRowIterator(1) as $row) {
                            $cellIterator = $row->getCellIterator();

                            /*
                             * setIterateOnlyExistingCells
                             * Default value is 'false'
                             * FALSE = This loops through all cells, even if a cell value is not set.
                             * TRUE = Loop through cells only when their value is set.
                             */
                            $cellIterator->setIterateOnlyExistingCells(FALSE);

                            //$counter = 0;
                            $rowList = [];
                            foreach ($cellIterator as $i=>$cell) {
                                if($i !=  'A' && $cell->getValue() != null){
                                    $rowList[] = $cell->getFormattedValue();
                                }
                                $dataList[] = $rowList;
                            }
                        }

                        $counter = 0;
                        foreach (array_filter($dataList) as $i=>$data){
                            if(sizeof($data) > 2){
                                $participant = new Participant();
                                $participant->office_id         = $model->office_id;
                                $participant->group_id          = $model->group_id;
                                $participant->identity_number   = $data[0]; //identity_number
                                $participant->title             = $data[1]; //title
                                $participant->email             = $data[2]; //email
                                $participant->save();
                                $counter = $counter+1;
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
                    return $this->render('import', [
                        'model' => $model,
                        'officeList' => $officeList,
                        'groupList' => $groupList,
                        'archiveList' => $archiveList,
                        'helper' => $helper,
                        'sheetData' => $sheetData
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
                $officeList = DataListUseCase::getOffice();;

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


    public function actionReset($id, $title=null)
    {
        if(Yii::$app->user->can('update-participant')){
            $model = Participant::findOne($id);
            $model->status = Participant::STATUS_INACTIVE;
            $model->save();
            MessageHelper::getFlashUpdateSuccess();
            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
