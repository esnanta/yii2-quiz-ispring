<?php

namespace backend\controllers;

use common\models\Employment;
use common\models\Office;
use common\models\Staff;
use common\models\UserDektrium;
use common\service\CacheService;
use common\service\DataIdService;
use common\service\DataListService;
use common\service\UserService;
use Yii;
use common\models\Profile;
use common\models\ProfileSearch;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ProfileController implements the CRUD actions for Profile model.
 */
class ProfileController extends Controller
{
    private UserService $userService;

    public function __construct($id, $module, UserService $userService, $config = [])
    {
        $this->userService = $userService;
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
     * Lists all Profile models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-profile')){
            $searchModel = new ProfileSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $profileList = DataListService::getProfile();
            $groupList  = DataListService::getGroup();
            $userTypeList = Profile::getArrayUserType();

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'profileList' => $profileList,
                'groupList' => $groupList,
                'userTypeList' => $userTypeList,
            ]);
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Profile model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-profile')){
            $model = $this->findModel($id);
            $officeId   = DataIdService::getOfficeId();
            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();
            $userTypeList = Profile::getArrayUserType();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->user_id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'officeId' => $officeId,
                    'officeList' => $officeList,
                    'groupList' => $groupList,
                    'userTypeList' => $userTypeList,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Profile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-profile')){
            $model = new Profile;
            $officeId   = DataIdService::getOfficeId();
            $officeList = DataListService::getOffice();
            $groupList  = DataListService::getGroup();
            $userTypeList = Profile::getArrayUserType();

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->user_id]);
                } 
                else {
                    return $this->render('create', [
                        'model' => $model,
                        'officeId' => $officeId,
                        'officeList' => $officeList,
                        'groupList' => $groupList,
                        'userTypeList' => $userTypeList,
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
     * Updates an existing Profile model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-profile')){
            try {
                $model = $this->findModel($id);
                $officeId   = DataIdService::getOfficeId();
                $officeList = DataListService::getOffice();
                $groupList  = DataListService::getGroup();
                $userTypeList = Profile::getArrayUserType();

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->user_id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'officeId' => $officeId,
                        'officeList' => $officeList,
                        'groupList' => $groupList,
                        'userTypeList' => $userTypeList,
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
     * Deletes an existing Profile model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-profile')){
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Profile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Profile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Profile::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionCreateRegular()
    {
        if (Yii::$app->user->can('create-user-regular')) {
            $officeId   = DataIdService::getOfficeId();
            $authItemName = CacheService::getInstance()->getAuthItemName();
            $userTypeList = Profile::getArrayUserType();;
            $profileList = DataListService::getProfile();

            $canCreateRegular = false;
            if ($authItemName == Yii::$app->params['userRoleAdmin'] ||
                $authItemName == Yii::$app->params['userRoleOwner']) {
                $canCreateRegular = true;
            }

            if ($canCreateRegular) {
                $model = new UserDektrium;

                if ($model->load(Yii::$app->request->post())) {
                    // Use UserService for consistent user creation
                    $result = $this->userService->createUser([
                        'username' => $model->username,
                        'email' => $model->email,
                        'name' => $model->staff_title ?? '',
                        'office_id' => $officeId,
                        'group_id' => null, // Set as needed
                    ], $model->password);

                    if ($result['success']) {
                        MessageHelper::getFlashSaveSuccess();
                        return $this->redirect(['/profile/index']);
                    } else {
                        // Add validation errors to the model
                        foreach ($result['errors'] as $field => $errors) {
                            if (is_array($errors)) {
                                foreach ($errors as $error) {
                                    $model->addError($field, $error);
                                }
                            } else {
                                $model->addError('username', $errors);
                            }
                        }
                    }
                }

                return $this->render('create_user_regular', [
                    'model' => $model,
                    'userTypeList' => $userTypeList,
                    'profileList' => $profileList,
                ]);
            } else {
                MessageHelper::getFlashAccessDenied();
                throw new ForbiddenHttpException;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionCreateOwner()
    {
        if (Yii::$app->user->can('create-user-owner')) {
            $model          = new UserDektrium();
            $userTypeList[] = [Yii::$app->params['userRoleOwner'] => 'Owner'];

            $transaction    = Yii::$app->db->beginTransaction();
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                        'item_name'         => $model->user_type,
                        'user_id'           => $model->id,
                        'created_at'        => time(),
                    ])->execute();

                    $office = new Office;
                    $office->user_id        = $model->id;
                    $office->title          = $model->office_title;
                    $office->email          = $model->email;
                    $office->save();

                    $employment = new Employment;
                    $employment->office_id  = $office->id; //OFFICE
                    $employment->title      = 'Manager';
                    $employment->sequence   = '1';
                    $employment->save();

                    $staff = new Staff;
                    $staff->office_id       = $office->id; //OFFICE
                    $staff->user_id         = $model->id; //USER
                    $staff->employment_id   = $employment->id; //EMPLOYMENT
                    $staff->title           = $model->staff_title;
                    $staff->save();

                    $transaction->commit();

                    return $this->redirect(['/user/admin/index']);
                } else {
                    return $this->render('create_user_owner', [
                        'model' => $model,
                        'userTypeList'=>$userTypeList
                    ]);
                }
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            } catch (\Throwable $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
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
}
