<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\widgets\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 * @var common\models\Period $periodList
 * @var common\models\Schedule $scheduleList
 * @var common\models\Subject $subjectList
 */
$this->title = Yii::t('app', 'Score');
$this->params['breadcrumbs'][] = $this->title;
?>


<?php

$form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]);
echo '<p class="help-block">Required</p>';
echo Form::widget([
    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [
        'period_id' => [
            'type' => Form::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $periodList,
                'options' => ['placeholder' => '', 'disabled' => false],
            ],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ],
        'group_id' => [
            'type' => Form::INPUT_WIDGET,
            'widgetClass' => Select2::class,//DepDrop::class
            'options' => [
                //'type' => DepDrop::TYPE_SELECT2,
                'data' => $groupList,
                'options' => ['placeholder' => ''],
//                'pluginOptions' => [
//                    'depends' => ['chartparticipant-period_id'],
//                    'url' => Url::to(['/chart/get-group-in-assessment']),
//                    'initializeEmpty' => true,
//                ],
            ],
        ],
    ]
]);

echo '<hr>';
echo '<p class="help-block">Optional</p>';

echo Form::widget([
    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [
        'subject_id' => [
            'type' => Form::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $subjectList,
                'options' => ['placeholder' => '', 'disabled' => false],
            ],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ],
    ]
]);

echo Html::submitButton(Yii::t('app', 'Proceed'),
    ['class' => 'btn btn-success']
);
ActiveForm::end();
?>