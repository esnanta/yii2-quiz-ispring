<?php

use yii\bootstrap5\Html;


/* @var $this yii\web\View */
/* @var $subjects common\models\Subject */
/* @var $groups common\models\Group */
/* @var $participants common\models\Participant */
/* @var $schedules common\models\Schedule */
/* @var $scheduleDetails common\models\ScheduleDetail */
/* @var $assessments common\models\Assessment */

$this->title = 'Dummy';
$this->params['breadcrumbs'][] = ['label' => 'Dummy', 'url' => ['view']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?='Dummy'?>
        </span>
    </div>
    <div class="card-body text-default">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Data</th>
                <th scope="col">Records</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>
                    <?=Html::a('Subject', ['subject/index']);?>
                </td>
                <td><?=$subjects;?></td>
                <td>
                    <?= Html::a('<i class="fas fa-trash"></i>', ['delete-subject']);?>
                    &nbsp;
                    <?= Html::a('<i class="fas fa-plus-circle"></i>', ['create-subject']);?>
                </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td><?=Html::a('Group', ['group/index']);?></td>
                <td><?=$groups;?></td>
                <td>
                    <?= Html::a('<i class="fas fa-trash"></i>', ['delete-group']);?>
                    &nbsp;
                    <?= Html::a('<i class="fas fa-plus-circle"></i>', ['create-group']);?>
                </td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td><?=Html::a('Participant', ['participant/index']);?></td>
                <td><?=$participants;?></td>
                <td>
                    <?= Html::a('<i class="fas fa-trash"></i>', ['delete-participant']);?>
                    &nbsp;
                    <?= Html::a('<i class="fas fa-plus-circle"></i>', ['create-participant']);?>
                </td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td><?=Html::a('Schedule', ['schedule/index']);?></td>
                <td><?=$schedules.' master / '.$scheduleDetails . ' detail';?></td>
                <td>
                    <?= Html::a('<i class="fas fa-trash"></i>', ['delete-schedule']);?>
                    &nbsp;
                    <?= Html::a('<i class="fas fa-plus-circle"></i>', ['create-schedule']);?>
                </td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td><?=Html::a('Assessment', ['assessment/index']);?></td>
                <td><?=$assessments;?></td>
                <td>
                    <?= Html::a('<i class="fas fa-trash"></i>', ['delete-assessment']);?>
                    &nbsp;
                    <?= Html::a('<i class="fas fa-plus-circle"></i>', ['create-assessment']);?>
                </td>
            </tr>
            </tbody>
        </table>

    </div>
</div>
