<div class="form-group" id="add-schedule-detail">
<?php
use kartik\grid\GridView;
use kartik\builder\TabularForm;
use yii\data\ArrayDataProvider;
use yii\helpers\Html;
use yii\widgets\Pjax;

$dataProvider = new ArrayDataProvider([
    'allModels' => $row,
    'pagination' => [
        'pageSize' => -1
    ]
]);
echo TabularForm::widget([
    'dataProvider' => $dataProvider,
    'formName' => 'ScheduleDetail',
    'checkboxColumn' => false,
    'actionColumn' => false,
    'attributeDefaults' => [
        'type' => TabularForm::INPUT_TEXT,
    ],
    'attributes' => [
        "id" => ['type' => TabularForm::INPUT_HIDDEN, 'columnOptions' => ['hidden'=>true]],
        'subject_id' => [
            'label' => Yii::t('app', 'Subject'),
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => \kartik\widgets\Select2::class,
            'options' => [
                'data' => $subjectList,
                'options' => ['placeholder' => Yii::t('app', 'Choose Subject')],
            ],
            'columnOptions' => ['width' => '200px']
        ],
        'remark' => ['type' => TabularForm::INPUT_TEXT],
        //'asset' => ['type' => TabularForm::INPUT_FILE],
        'del' => [
            'type' => 'raw',
            'label' => '',
            'value' => function($model, $key) {
                return
                    Html::hiddenInput('Children[' . $key . '][id]', (!empty($model['id'])) ? $model['id'] : "") .
                    Html::a('<i class="glyphicon glyphicon-trash"></i>', '#', ['title' =>  Yii::t('app', 'Delete'), 'onClick' => 'delRowScheduleDetail(' . $key . '); return false;', 'id' => 'schedule-detail-del-btn']);
            },
        ],
    ],
    'gridSettings' => [
        'panel' => [
            'heading' => false,
            'type' => GridView::TYPE_DEFAULT,
            'before' => false,
            'footer' => false,
            'after' => Html::button('<i class="glyphicon glyphicon-plus"></i>' . Yii::t('app', 'Add Detail'), ['type' => 'button', 'class' => 'btn btn-primary kv-batch-create', 'onClick' => 'addRowScheduleDetail()']),
        ]
    ]
]);
echo  "    </div>\n\n";
?>

