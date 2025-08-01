<?php

use kartik\builder\TabularForm;
use yii\data\ArrayDataProvider;
use yii\helpers\Html;
use kartik\widgets\Select2;
use kartik\grid\GridView;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var array $listParticipants - The list of participants
 * @var array $officeList - The list of offices for dropdown
 * @var array $groupList - The list of groups for dropdown
 */
?>

<?php $form = ActiveForm::begin(); ?>

<?php

$dataProvider = new ArrayDataProvider([
    'allModels' => $listParticipants,
    'pagination' => [
        'pageSize' => -1 // Disable pagination
    ]
]);

echo TabularForm::widget([
    'dataProvider' => $dataProvider,
    'formName' => 'Participant',
    'checkboxColumn' => false,
    'actionColumn' => false,
    'attributeDefaults' => [
        'type' => TabularForm::INPUT_TEXT,
    ],
    'attributes' => [
        'id' => [
            'type' => TabularForm::INPUT_HIDDEN,
            'columnOptions' => ['hidden' => true]
        ],
        'title' => [
            'label' => Yii::t('app', 'Title'),
            'type' => TabularForm::INPUT_TEXT,
            'options' => [
                'placeholder' => 'Enter profile title',
                'maxlength' => 100,
                'disabled' => true // Disable the field
            ],
        ],
        'identity_number' => [
            'label' => Yii::t('app', 'Identity Number'),
            'type' => TabularForm::INPUT_TEXT,
            'options' => [
                'placeholder' => 'Enter identity number',
                'maxlength' => 100,
                'disabled' => true // Disable the field
            ],
        ],
        'username' => [
            'label' => Yii::t('app', 'Username'),
            'type' => TabularForm::INPUT_TEXT,
            'options' => [
                'placeholder' => 'Enter username',
                'maxlength' => 100,
                'disabled' => true // Disable the field
            ],
        ],
        'group_id' => [
            'label' => Yii::t('app', 'Group'),
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $groupList,
                'options' => ['placeholder' => 'Choose Group'],
            ],
            'columnOptions' => ['width' => '200px'],
        ],
        'del' => [
            'type' => 'raw',
            'label' => '',
            'value' => function ($model, $key) {
                return Html::hiddenInput("Participant[$key][id]", $model['id']) .
                    Html::a('<i class="glyphicon glyphicon-trash"></i>', '#', [
                        'title' => Yii::t('app', 'Delete'),
                        'onClick' => "delRowParticipant($key); return false;",
                        'id' => 'profile-del-btn'
                    ]);
            },
        ],
    ],
    'gridSettings' => [
        'panel' => [
            'heading' => false,
            'type' => GridView::TYPE_DEFAULT,
            'before' => false,
            'footer' => false,
            'after' => Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']), // Add Save button
        ],
    ],
]);

?>

<?php ActiveForm::end();
