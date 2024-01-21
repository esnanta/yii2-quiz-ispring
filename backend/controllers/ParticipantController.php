<?php

namespace backend\controllers;

use backend\models\Archive;
use backend\models\Group;
use backend\models\GroupSearch;
use backend\models\Office;
use backend\models\ParticipantImport;
use backend\models\Subject;
use common\helper\CacheCloud;
use common\helper\ReadFilter;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yii;
use backend\models\Participant;
use backend\models\ParticipantSearch;
use yii\helpers\ArrayHelper;
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
                'class' => VerbFilter::className(),
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

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $groupList = ArrayHelper::map(Group::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'groupList' => $groupList
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
            $model = $this->findModel($id);

            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

            $groupList = ArrayHelper::map(Group::find()
                ->where(['office_id' => $model->office_id])
                ->asArray()->all(), 'id', 'title');

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

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

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

    public function actionSelect(){
        if(Yii::$app->user->can('create-participant')){
            $searchModel    = new GroupSearch();
            $dataProvider   = $searchModel->search(Yii::$app->request->queryParams);

            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('select_group', [
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

    public function actionImport($groupId)
    {
        if(Yii::$app->user->can('create-participant')){
            $officeId   = CacheCloud::getInstance()->getOfficeId();
            $officeList = ArrayHelper::map(Office::find()
                ->where(['id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $archiveList = ArrayHelper::map(Archive::find()
                ->where(['office_id' => $officeId,'archive_type'=>Archive::ARCHIVE_TYPE_SPREADSHEET])
                ->asArray()->all(), 'id', 'title');

            $groupList = ArrayHelper::map(Group::find()
                ->where(['id' => $groupId,'office_id' => $officeId,])
                ->asArray()->all(), 'id', 'title');

            $model = new ParticipantImport();
            $model->office_id = $officeId;
            $model->group_id = $groupId;

            try {
                if ($model->load(Yii::$app->request->post())) {
                    $archive = Archive::find()->where(['id'=>$model->archive_id])->one();
                    $path = Yii::getAlias('@backend').'/web/'.$archive->getPath();
                    $inputFileName  = $path.'/'.$archive->asset_name;
                    $sheetName = 'Participant';
                    $filterSubset = new ReadFilter();

                    $helper = new Sample();

                    $inputFileType = IOFactory::identify($inputFileName);
                    $reader = IOFactory::createReader($inputFileType);
                    $reader->setReadDataOnly(true); //THIS WILL IGNORE FORMATTING
                    $reader->setLoadSheetsOnly($sheetName);
                    $reader->setReadFilter($filterSubset);
                    $spreadsheet = $reader->load($inputFileName);

                    $activeRange = $spreadsheet->getActiveSheet()->calculateWorksheetDataDimension();
                    $sheetData = $spreadsheet->getActiveSheet()->rangeToArray($activeRange, null, true, true, true);
                    $data = $spreadsheet->getActiveSheet();

                    $helper->displayGrid($sheetData);
                    //throw new NotFoundHttpException('The object being updated is outdated.');

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
                            if(sizeof($data) > 1){
                                $participant = new Participant();
                                $participant->office_id         = $model->office_id;
                                $participant->group_id          = $model->group_id;
                                $participant->identity_number   = $data[0]; //identity_number
                                $participant->title             = $data[1]; //title
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
                        'archiveList' => $archiveList
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
                $model = $this->findModel($id);

                $officeList = ArrayHelper::map(Office::find()
                    ->where(['id' => $model->office_id])
                    ->asArray()->all(), 'id', 'title');

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
}
