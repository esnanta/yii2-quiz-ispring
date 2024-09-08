<?php

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */
/* @var $examTypeList common\models\Schedule */
/* @var $subjectList common\models\Subject */
/* @var $roomList common\models\Room */
/* @var $groupList common\models\Group */
/* @var $periodList common\models\Period */
/* @var $staffList common\models\Staff */
/* @var $questionTypeList common\models\ScheduleDetail */

$this->title = Yii::t('app', 'Create Schedule');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?=Yii::t('app', 'Schedule');?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="schedule-create">
            <?= $this->render('_form', [
                'model' => $model,
                'subjectList' => $subjectList,
                'roomList' => $roomList,
                'groupList' => $groupList,
                'periodList' => $periodList,
                'staffList' => $staffList,
                'examTypeList' => $examTypeList,
                'questionTypeList' => $questionTypeList
            ]) 
            ?>
        </div>
    </div>
</div>
