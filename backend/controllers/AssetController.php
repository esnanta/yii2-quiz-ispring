<?php

namespace backend\controllers;

use common\helper\DateHelper;
use common\helper\MessageHelper;
use common\helper\SpreadsheetHelper;
use common\models\Asset;
use common\models\AssetSearch;
use common\models\ProfileImport;
use common\service\AssetService;
use common\service\CacheService;
use common\service\DataIdService;
use common\service\DataListService;
use common\service\ProfileService;
use common\service\UserService;
use Yii;
use yii\base\Exception;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * AssetController implements the CRUD actions for Asset model.
 */
class AssetController extends Controller
{
    private AssetService $assetService;
    private UserService $userService;

    public function __construct($id, $module,
                                AssetService $assetService,
                                UserService $userService, $config = [])
    {
        $this->assetService = $assetService;
        $this->userService = $userService;
        parent::__construct($id, $module, $config);
    }

    public function behaviors(): array
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
     * Lists all Asset models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-asset')) {
            $searchModel = new AssetSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $officeList         = DataListService::getOffice();
            $assetCategoryList  = DataListService::getAssetCategory();
            $assetTypeList      = Asset::getArrayAssetType();

            $isVisibleList = Asset::getArrayIsVisible();
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'officeList' => $officeList,
                'assetCategoryList' => $assetCategoryList,
                'assetTypeList' => $assetTypeList,
                'isVisibleList' => $isVisibleList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Asset model.
     * @param integer $id
     * @return mixed
     * @throws Exception
     */
    public function actionView($id, $title = null)
    {
        if (Yii::$app->user->can('view-asset')) {
            $model = $this->findModel($id);

            $scheduleDetailList   = $model->scheduleDetails;
            $officeList           = DataListService::getOffice();
            $assetCategoryList    = DataListService::getAssetCategory();

            $isVisibleList        = Asset::getArrayIsVisible();
            $assetTypeList        = Asset::getArrayAssetType();
            $fileExtensionList    = Asset::getArrayFileExtension();

            $renderIndexFileStatus = $this->assetService->renderIndexFileStatus($model);
            $currentFile    = $this->assetService->getAssetFile($model);
            $assetUrl       = $this->assetService->getAssetUrl($model);
            $fileData       = null;
            $fileType       = null; // Type of file: 'spreadsheet', 'image', 'document'
            $helper         = null;

            if (!empty($currentFile)) {
                try {
                    $fileExtension = strtolower(pathinfo($currentFile, PATHINFO_EXTENSION));

                    foreach ($fileExtensionList as $type => $extensions) {
                        if (in_array($fileExtension, $extensions)) {
                            $fileType = $type; // Assign the asset type integer
                            break;
                        }
                    }

                    if ($fileType === Asset::ASSET_TYPE_SPREADSHEET) {
                        $spreadsheetHelper = SpreadsheetHelper::getInstance();
                        $helper = $spreadsheetHelper;
                        $sheetName = $spreadsheetHelper->getSheetName();
                        $spreadsheet = $spreadsheetHelper->loadSpreadsheet($currentFile, $sheetName);

                        // Use the corrected getDataList method to ensure data is read properly
                        $worksheet = $spreadsheet->getActiveSheet();
                        $fileData = $spreadsheetHelper->getDataList($worksheet);

                    } else  {
                        $fileData = $currentFile;
                    }

                } catch (\Exception $e) {
                    MessageHelper::getFlashAssetNotFound();
                }
            }

            if ($model->load(Yii::$app->request->post())) {
                // process uploaded asset file instance
                $asset = $this->assetService->uploadAsset($model);

                if(!empty($asset)):
                    $model->asset_name  = $asset->name;
                    $model->asset_url = $this->assetService->getAssetUrl($model);
                endif;

                if ($model->save()) {
                    if ($asset !== false) {
                        if (file_exists($currentFile)) {
                            unlink($currentFile);
                        }
                        $path = $this->assetService->getAssetFile($model);
                        // Use the new method that sets proper permissions
                        $this->assetService->saveUploadedFileWithPermissions($asset, $path, 0664);
                    }
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                }
            }

            return $this->render('view', [
                'model' => $model,
                'scheduleDetailList' => $scheduleDetailList,
                'officeList' => $officeList,
                'assetCategoryList' => $assetCategoryList,
                'isVisibleList' => $isVisibleList,
                'assetTypeList' => $assetTypeList,
                'assetUrl' => $assetUrl,
                'fileType' => $fileType,
                'helper' => $helper,
                'fileData' => $fileData,
                'renderIndexFileStatus' => $renderIndexFileStatus
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException();
        }
    }

    /**
     * Creates a new Asset model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($isImport=false)
    {
        if (Yii::$app->user->can('create-asset')) {

            $officeId             = CacheService::getInstance()->getOfficeId();
            $officeList           = DataListService::getOffice();
            $assetCategoryList    = DataListService::getAssetCategory();

            $model              = new Asset;
            $model->office_id   = $officeId;
            $model->date_issued = date(DateHelper::getDateSaveFormat());
            $model->is_visible  = Asset::IS_VISIBLE_PRIVATE;
            if($isImport):
                $model->asset_type = Asset::ASSET_TYPE_IMPORT;
            endif;

            $assetTypeList = Asset::getArrayAssetType();
            $isVisibleList = Asset::getArrayIsVisible();

            try {
                if ($model->load(Yii::$app->request->post())) {
                    // process uploaded asset file instance
                    $asset = $this->assetService->uploadAsset($model);

                    if(empty($asset)){
                        MessageHelper::getFlashUploadFailed();
                    } else {
                        $model->asset_name = $asset->name;
                        $model->asset_url = $this->assetService->getAssetUrl($model);
                    }

                    if ($model->save()) :
                        // upload only if valid uploaded file instance found
                        if ($asset !== false) {
                            $path = $this->assetService->getAssetFile($model);
                            // Use the new method that sets proper permissions
                            $this->assetService->saveUploadedFileWithPermissions($asset, $path, 0664);
                        }
                        MessageHelper::getFlashUpdateSuccess();
                    endif;

                    return $this->redirect(['view', 'id' => $model->id]);
                }
                return $this->render('create', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'assetCategoryList' => $assetCategoryList,
                    'isVisibleList' => $isVisibleList,
                    'assetTypeList' => $assetTypeList,
                ]);
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Asset model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id,$title=null)
    {
        if (Yii::$app->user->can('update-asset')) {
            $model = $this->findModel($id);

            $officeList             = DataListService::getOffice();
            $assetCategoryList    = DataListService::getAssetCategory();

            $assetTypeList = Asset::getArrayAssetType();
            $isVisibleList = Asset::getArrayIsVisible();

            if ($model->load(Yii::$app->request->post())) {

                $asset = $this->assetService->uploadAsset($model);

                if(empty($asset)){
                    MessageHelper::getFlashAssetNotFound();
                } else {
                    $model->asset_name  = $asset->name;
                    $model->asset_url = $this->assetService->getAssetUrl($model);
                }

                if ($model->save()) :
                    // upload only if valid uploaded file instance found
                    if ($asset !== false) {
                        $path = $this->assetService->getAssetFile($model);
                        // Use the new method that sets proper permissions
                        $this->assetService->saveUploadedFileWithPermissions($asset, $path, 0664);
                    }
                    MessageHelper::getFlashUpdateSuccess();
                endif;

                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'officeList' => $officeList,
                    'assetCategoryList' => $assetCategoryList,
                    'isVisibleList' => $isVisibleList,
                    'assetTypeList' => $assetTypeList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Asset model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws Exception
     */
    public function actionDelete($id)
    {

        if (Yii::$app->user->can('delete-asset')) {
            $model = $this->findModel($id);
            // validate deletion and on failure process any exception
            // e.g. display an error message
            if ($model->delete()) {
                if (!$this->assetService->deleteAsset($model)) {
                    Yii::$app->session->setFlash('error', 'Asset not found');
                }
            }
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * @throws Exception
     * @throws \yii\db\Exception
     * @throws ForbiddenHttpException
     */
    public function actionDeleteFile($id)
    {
        if (Yii::$app->user->can('delete-asset')) {
            $model = Asset::find()->where(['id' => $id])->one();
            $this->assetService->deleteAsset($model);
            $extractDir = $this->assetService->getExtractDir($model);
            $this->assetService->removeExtractFolder($extractDir);
            $model->save();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['asset/view', 'id' => $model->id, 'title' => $model->title]);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Asset model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Asset the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id): Asset
    {
        if (($model = Asset::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionDownload($id, $title = null)
    {
        $model = $this->findModel($id);
        $path = $this->assetService->getAssetFile($model);
        if (!empty($path)) {
            return $model->downloadFile($path);
        } else {
            throw new NotFoundHttpException("can't find {$model->title} file");
        }
    }

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     * @throws ForbiddenHttpException
     */
    public function actionExtract($id,$title=null){
        if (Yii::$app->user->can('create-asset')) {
            $model = $this->findModel($id);
            $this->assetService->extract($model);
            MessageHelper::getFlashExtractFileSuccess();
            return $this->redirect(['asset/view', 'id' => $model->id, 'title' => $model->title]);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    //$id = asset id
    public function actionImport($id,$title=null)
    {
        if(Yii::$app->user->can('create-asset')){
            $officeId       = DataIdService::getOfficeId();
            $officeList     = DataListService::getOffice();
            $assetList      = DataListService::getAsset();
            $groupList      = DataListService::getGroup();

            $model = new ProfileImport();
            $model->office_id = $officeId;
            $model->asset_id = $id;

            $asset = Asset::find()->where(['id'=>$model->asset_id])->one();
            $inputFileName = $this->assetService->getAssetFile($asset);

            // Validate file format before processing
            $spreadsheetHelper = SpreadsheetHelper::getInstance();
            if (!$spreadsheetHelper->isSupportedFormat($inputFileName)) {
                MessageHelper::getFlashAccessDenied();
                Yii::$app->getSession()->setFlash('error', 'Unsupported file format. Please upload a valid spreadsheet file (xlsx, xls, ods, csv, etc.).');
                return $this->redirect(['asset/view', 'id' => $asset->id]);
            }

            try {
                $helper = $spreadsheetHelper->getHelper();
                $sheetName = $spreadsheetHelper->getSheetName();

                // Use the enhanced loadSpreadsheet method with fallback
                $spreadsheet = $spreadsheetHelper->loadSpreadsheet($inputFileName, $sheetName);
                $activeRange = $spreadsheet->getActiveSheet()->calculateWorksheetDataDimension();
                $sheetData = $spreadsheet->getActiveSheet()->rangeToArray(
                    $activeRange, null, true, true, true
                );
                $data = $spreadsheet->getActiveSheet();
                $dataList = $spreadsheetHelper->getDataList($data);

                if ($model->load(Yii::$app->request->post())) {
                    // Use UserService for bulk user creation
                    $result = $this->userService->createUsersFromImport(
                        array_filter($dataList),
                        $model->office_id,
                        $model->group_id
                    );

                    if ($result['success']) {
                        MessageHelper::getFlashSaveSuccess();
                        Yii::$app->getSession()->setFlash(
                            'success',
                            ['message' => Yii::t(
                                'app',
                                'Saved '.$result['created_count'].' records.'
                            )]
                        );
                        return $this->redirect(['index']);
                    } else {
                        // Handle errors
                        foreach ($result['errors'] as $error) {
                            Yii::$app->getSession()->setFlash('error', $error);
                        }

                        $duplicateData = ProfileService::checkDuplicate($dataList);
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
                else {
                    $duplicateData = ProfileService::checkDuplicate($dataList);
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
            } catch (\Exception $e) {
                MessageHelper::getFlashAccessDenied();
                Yii::$app->getSession()->setFlash('error', 'Error processing spreadsheet: ' . $e->getMessage());
                return $this->redirect(['asset/view', 'id' => $asset->id]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
