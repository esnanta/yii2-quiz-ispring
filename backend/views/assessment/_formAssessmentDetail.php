<div class="form-group" id="add-assessment-detail">
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
    'formName' => 'AssessmentDetail',
    'checkboxColumn' => false,
    'actionColumn' => false,
    'attributeDefaults' => [
        'type' => TabularForm::INPUT_TEXT,
    ],
    'attributes' => [
        "id" => ['type' => TabularForm::INPUT_HIDDEN, 'columnOptions' => ['hidden'=>true]],
        'office_id' => [
            'label' => 'Tx office',
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => \kartik\widgets\Select2::class,
            'options' => [
                'data' => \yii\helpers\ArrayHelper::map(\common\models\Office::find()->orderBy('title')->asArray()->all(), 'id', 'title'),
                'options' => ['placeholder' => Yii::t('app', 'Choose Tx office')],
            ],
            'columnOptions' => ['width' => '200px']
        ],
        'participant_id' => [
            'label' => 'Tx participant',
            'type' => TabularForm::INPUT_WIDGET,
            'widgetClass' => \kartik\widgets\Select2::class,
            'options' => [
                'data' => \yii\helpers\ArrayHelper::map(\common\models\Participant::find()->orderBy('title')->asArray()->all(), 'id', 'title'),
                'options' => ['placeholder' => Yii::t('app', 'Choose Tx participant')],
            ],
            'columnOptions' => ['width' => '200px']
        ],
        'app_version' => ['type' => TabularForm::INPUT_TEXT],
        'earned_points' => ['type' => TabularForm::INPUT_TEXT],
        'passing_score' => ['type' => TabularForm::INPUT_TEXT],
        'passing_score_percent' => ['type' => TabularForm::INPUT_TEXT],
        'gained_score' => ['type' => TabularForm::INPUT_TEXT],
        'quiz_title' => ['type' => TabularForm::INPUT_TEXT],
        'quiz_type' => ['type' => TabularForm::INPUT_TEXT],
        'username' => ['type' => TabularForm::INPUT_TEXT],
        'time_limit' => ['type' => TabularForm::INPUT_TEXT],
        'used_time' => ['type' => TabularForm::INPUT_TEXT],
        'time_spent' => ['type' => TabularForm::INPUT_TEXT],
        'is_deleted' => ['type' => TabularForm::INPUT_TEXT],
        "verlock" => ['type' => TabularForm::INPUT_HIDDEN, 'columnOptions' => ['hidden'=>true]],
        'uuid' => ['type' => TabularForm::INPUT_TEXT],
        'del' => [
            'type' => 'raw',
            'label' => '',
            'value' => function($model, $key) {
                return
                    Html::hiddenInput('Children[' . $key . '][id]', (!empty($model['id'])) ? $model['id'] : "") .
                    Html::a('<i class="glyphicon glyphicon-trash"></i>', '#', ['title' =>  Yii::t('app', 'Delete'), 'onClick' => 'delRowAssessmentDetail(' . $key . '); return false;', 'id' => 'assessment-detail-del-btn']);
            },
        ],
    ],
    'gridSettings' => [
        'panel' => [
            'heading' => false,
            'type' => GridView::TYPE_DEFAULT,
            'before' => false,
            'footer' => false,
            'after' => Html::button('<i class="glyphicon glyphicon-plus"></i>' . Yii::t('app', 'Add Tx Assessment Detail'), ['type' => 'button', 'class' => 'btn btn-success kv-batch-create', 'onClick' => 'addRowAssessmentDetail()']),
        ]
    ]
]);
echo  "    </div>\n\n";
?>

