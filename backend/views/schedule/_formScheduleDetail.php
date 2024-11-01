<div class="form-group" id="add-schedule-detail">
<?php

use common\helper\IconHelper;
use kartik\grid\GridView;
use kartik\builder\TabularForm;
use kartik\widgets\Select2;
use yii\data\ArrayDataProvider;
use yii\helpers\Html;
use yii\helpers\Url;
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
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $subjectList,
                'options' => [
                        'placeholder' => Yii::t('app', ''),
                        'onchange' => 'updateRemarkField(this)',
                ],
            ],
            'columnOptions' => ['width' => '200px']
        ],

        'remark' => [
            'label' => Yii::t('app', 'Remark'),
            'type' => TabularForm::INPUT_TEXT
        ],
        'question_type' => [
            'label' => Yii::t('app', 'Subject Type'),
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $questionTypeList,
                'options' => [
                    'placeholder' => Yii::t('app', ''),
                ],
            ],
            'columnOptions' => ['width' => '200px']
        ],

        'asset_id' => [
            'label' => Yii::t('app', 'Asset'),
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => Select2::class,
            'options' => [
                'data' => $assetList,
                'options' => [
                    'placeholder' => Yii::t('app', ''),
                ],
            ],
            'columnOptions' => ['width' => '200px']
        ],

        'del' => [
            'type' => 'raw',
            'label' => '',
            'value' => function($model, $key) {
                return
                    Html::hiddenInput('Children[' . $key . '][id]', (!empty($model['id'])) ? $model['id'] : "") .
                    Html::a(IconHelper::getDelete(), '#', ['title' =>  Yii::t('app', 'Delete'), 'onClick' => 'delRowScheduleDetail(' . $key . '); return false;', 'id' => 'schedule-detail-del-btn']);
            },
        ],
    ],
    'gridSettings' => [
        'panel' => [
            'heading' => false,
            'type' => GridView::TYPE_DEFAULT,
            'before' => false,
            'footer' => false,
            'after' => Html::button('<i class="glyphicon glyphicon-plus"></i>' . Yii::t('app', 'Add Detail'), ['type' => 'button', 'class' => 'btn btn-info kv-batch-create', 'onClick' => 'addRowScheduleDetail()']),
        ]
    ]
]);
echo  "    </div>\n\n";
?>
<?php
$this->registerJs("
    function updateRemarkField(dropdown) {
        var rowIndex = dropdown.id
        var selectedValue = $(dropdown).val();
        
        $.ajax({
            url: '" . Url::to(['schedule/update-remark-field']) . "',
            type: 'GET',
            data: {subjectId: selectedValue},
            success: function(data) {

                var obj = JSON.parse(data)
                //console.log('#obj ' + obj.remark)
                
                //scheduledetail-0-subject_id
                rowRemark = rowIndex.replace('subject_id','remark')
             
                //console.log('#' + rowRemark)
                $('#' + rowRemark).val(obj.remark);
            }
        });
    }
", yii\web\View::POS_END);
?>
