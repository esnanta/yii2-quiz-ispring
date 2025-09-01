<?php

use common\helper\DateHelper;
use common\models\User;
use yii\bootstrap4\ActiveForm;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */
/* @var $scheduleDetailService common\service\ScheduleDetailService */
/* @var $providerAssessment yii\data\ActiveDataProvider */
/* @var $providerScheduleDetail yii\data\ActiveDataProvider */
?>
<?php
$currentTime = time();
if ($currentTime >= $model->getTimeStart() && $currentTime <= $model->getTimeOut()) {
    ?>
    <div class="card mb-3">
        <div class="card-header">
            <strong><i class="fas fa-key"></i> <?= Yii::t('app', 'Token Access') ?></strong>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 col-md-8 col-lg-6">
                    <?php $form = ActiveForm::begin(['options' => ['class' => 'row g-2 align-items-center']]); ?>
                    <div class="col-auto">
                        <label class="font-weight-bold mb-0" for="token-input">
                            <?= Yii::t('app', 'Token') ?>:
                        </label>
                    </div>
                    <div class="col">
                        <?= $form->field($tokenForm, 'token')->textInput([
                            'maxlength' => true,
                            'placeholder' => Yii::t('app', 'Enter token'),
                            'class' => 'form-control',
                            'autocomplete' => 'off',
                            'id' => 'token-input',
                        ])->label(false) ?>
                    </div>
                    <div class="col-auto">
                        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => 'btn btn-primary']) ?>
                    </div>
                    <?php ActiveForm::end(); ?>
                    <?php if (isset($tokenForm->is_token_equals)) {
                        if ($tokenForm->is_token_equals && !empty($tokenForm->token)) { ?>
                            <div class="alert alert-success mt-2 mb-0 p-2 d-flex align-items-center">
                                <i class="fas fa-check-circle mr-2"></i>
                                <span><?= Yii::t('app', 'Token accepted.') ?></span>
                            </div>
                        <?php } elseif (!$tokenForm->is_token_equals && !empty($tokenForm->token)) { ?>
                            <div class="alert alert-danger mt-2 mb-0 p-2 d-flex align-items-center">
                                <i class="fas fa-times-circle mr-2"></i>
                                <span><?= Yii::t('app', 'Invalid token.') ?></span>
                            </div>
                        <?php }
                    } ?>
                </div>
            </div>
        </div>
    </div>
<?php }
?>
<div class="card">
    <div class="card-header">
        <?= Yii::t('app', 'Schedule') ?>
        <strong>#<?= $model->title; ?></strong>
    </div>

    <div class="card-body">
        <div class="row mb-4">

            <div class="col-sm-4">
                <div>
                    <strong><?= $model->title; ?> - <?= $model->getOneExamType($model->exam_type); ?> </strong>
                </div>
                <div><?= $model->period->title; ?></div>
                <div><?= $model->group->title; ?></div>
            </div>
            <div class="col-sm-4">
                <div><strong><?= Yii::t('app', 'Description'); ?></strong></div>
                <div><?= ($model->description == null) ? '-' : $model->description; ?></div>
            </div>
            <div class="col-sm-4">
                <div>
                    <strong><?= $model->room->title; ?></strong>
                </div>
                <div>
                    <?= Yii::t('app', 'Date Start'); ?> :
                    <?= DateHelper::formatDateTime($model->date_start); ?>
                </div>
                <div>
                    <?= Yii::t('app', 'Date End'); ?> :
                    <?= DateHelper::formatDateTime($model->date_end); ?>
                </div>
            </div>

        </div>

        <?php if ($providerScheduleDetail->totalCount) { ?>

            <div class="table-responsive-sm">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Subject'); ?></th>
                        <th><?= Yii::t('app', 'Remark'); ?></th>
                        <th><?= Yii::t('app', 'Question Type'); ?></th>
                        <th><?= Yii::t('app', 'Action'); ?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $modelDetails = $providerScheduleDetail->getModels();
                    foreach ($modelDetails as $i => $modelDetailItem) {
                        $submissionIsFalse = false;
                        ?>

                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                            <td class="left"><?= $modelDetailItem->remark; ?></td>
                            <td class="left"><?= $modelDetailItem->getOneQuestionType($modelDetailItem->question_type); ?></td>
                            <td>
                                <?php
                                if ($tokenForm->is_token_equals) {
                                    echo $scheduleDetailService->getAssetButton($modelDetailItem, $submissionIsFalse, Yii::$app->user->id);
                                } else {
                                    echo Html::a(Yii::t('app', 'Closed'), '#', ['class' => 'btn btn-secondary btn-sm disabled']);
                                }
                                ?>
                            </td>
                        </tr>

                    <?php } ?>

                    </tbody>
                </table>
            </div>

        <?php } ?>

        <?php if (!empty($profileList)) {
            echo $this->render('view_participant', [
                'model'=>$model,
                'profileList' => $profileList,
            ]);
        }
        ?>

        <br>

        <div class="row">
            <div class="col-lg-4 col-sm-5">
                <?= Yii::t('app', 'Created At'); ?>:
                <?= date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at)); ?>
                <br><?= Yii::t('app', 'Created By'); ?> :
                <?= User::getName($model->created_by); ?>
            </div>
            <div class="col-lg-4 col-sm-5 ml-auto">
                <?= '( ' . $model->staff->title . ' )'; ?>
            </div>
        </div>
    </div>
</div>