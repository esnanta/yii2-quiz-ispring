<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\widgets\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 */
$this->title = Yii::t('app', 'Card');
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
        'group_id' => [
            'type' => Form::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $groupList,
                'options' => ['placeholder' => '', 'disabled' => false],
            ],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ],
    ]
]);

//    echo '<hr>';
//    echo '<p class="help-block">Optional</p>';
//
//    echo Form::widget([
//        'model' => $model,
//        'form' => $form,
//        'columns' => 1,
//        'attributes' => [
//            'subject_id' => [
//                'type' => Form::INPUT_WIDGET,
//                'widgetClass' => Select2::class,
//                'options' => [
//                    'data' => $subjectList,
//                    'options' => ['placeholder' => '', 'disabled' => false],
//                ],
//                'pluginOptions' => [
//                    'allowClear' => true
//                ],
//            ],
//        ]
//    ]);

echo Html::submitButton(Yii::t('app', 'View'),
    ['class' => 'btn btn-success']
);
ActiveForm::end();
?>