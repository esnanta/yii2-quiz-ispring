<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var common\models\AssessmentDetailSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="assessment-detail-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'office_id') ?>

    <?= $form->field($model, 'assessment_id') ?>

    <?= $form->field($model, 'participant_id') ?>

    <?= $form->field($model, 'app_version') ?>

    <?php // echo $form->field($model, 'earned_points') ?>

    <?php // echo $form->field($model, 'passing_score') ?>

    <?php // echo $form->field($model, 'passing_score_percent') ?>

    <?php // echo $form->field($model, 'gained_score') ?>

    <?php // echo $form->field($model, 'quiz_title') ?>

    <?php // echo $form->field($model, 'quiz_type') ?>

    <?php // echo $form->field($model, 'username') ?>

    <?php // echo $form->field($model, 'time_limit') ?>

    <?php // echo $form->field($model, 'used_time') ?>

    <?php // echo $form->field($model, 'time_spent') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'is_deleted') ?>

    <?php // echo $form->field($model, 'deleted_at') ?>

    <?php // echo $form->field($model, 'deleted_by') ?>

    <?php // echo $form->field($model, 'verlock') ?>

    <?php // echo $form->field($model, 'uuid') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
