<?php

use common\helper\LabelHelper;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleToken $model
 */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Tokens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();

?>
<div class="schedule-token-view">

    <?= DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                    'heading' => $this->title . $create,
                    'type' => DetailView::TYPE_DEFAULT,
            ],
            'attributes' => [
                    [
                            'attribute' => 'date_start',
                            'format' => [
                                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                            ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                            : 'd-m-Y H:i:s A'
                            ],
                            'type' => DetailView::INPUT_WIDGET,
                            'widgetOptions' => [
                                    'class' => DateControl::class,
                                    'type' => DateControl::FORMAT_DATETIME
                            ]
                    ],
                    [
                            'attribute' => 'date_end',
                            'format' => [
                                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                            ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                            : 'd-m-Y H:i:s A'
                            ],
                            'type' => DetailView::INPUT_WIDGET,
                            'widgetOptions' => [
                                    'class' => DateControl::class,
                                    'type' => DateControl::FORMAT_DATETIME
                            ]
                    ],
                    'token',
                    'description'
            ],
            'deleteOptions' => [
                    'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => true,
    ]) ?>

</div>
