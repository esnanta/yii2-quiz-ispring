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
<div class="card">
    <div class="card-header">
        <?= Yii::t('app', 'Schedule') ?>
        <strong>#<?= $model->title; ?></strong>
    </div>

    <div class="card-body">
        <?php
        $currentTime = time();
        if ($currentTime >= $model->getTimeStart() && $currentTime <= $model->getTimeOut()) {
            ?>
            <div class="d-flex justify-content-center align-items-center mb-3" style="gap: 8px;">
                <?php $form = ActiveForm::begin(['options' => ['class' => 'form-inline p-0 m-0', 'style' => 'display:flex;align-items:center;gap:8px;']]); ?>
                <label class="font-weight-bold mb-0" for="token-input">
                    <?= Yii::t('app', 'Token') ?>:
                </label>
                <?= $form->field($tokenForm, 'token')->textInput([
                    'maxlength' => true,
                    'placeholder' => Yii::t('app', 'Enter token'),
                    'class' => 'form-control',
                    'autocomplete' => 'off',
                    'id' => 'token-input',
                    'style' => 'width:120px;display:inline-block;'
                ])->label(false) ?>
                <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => 'btn btn-primary']) ?>
                <?php ActiveForm::end(); ?>
                <?php if (isset($tokenForm->is_token_equals) && !$tokenForm->is_token_equals && !empty($tokenForm->token)) { ?>
                    <span class="ml-2 text-danger small">
                        <?= Yii::t('app', 'Invalid token.') ?>
                    </span>
                <?php } ?>
            </div>
        <?php } ?>
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