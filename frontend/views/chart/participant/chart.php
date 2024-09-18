<?php

use common\helper\ApexChartHelper;
use common\helper\IconHelper;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 * @var common\models\Participant $participant
 * @var common\models\Period $periodList
 * @var common\models\Group $groupList
 * @var common\models\Subject $subjectList
 */

$this->title = Yii::t('app', 'Chart');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Participant Chart'), 'url' => ['chart/participant']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?= IconHelper::getUser().' '. $participant->title ;?>
        <span class="float-right float-end">
            <?= $participant->identity_number ;?>
        </span>
    </div>
    <div class="card-body text-default">
        <?= $this->render('/chart/participant/_form', [
            'model' => $model,
            'participant' => $participant,
            'periodList' => $periodList,
            'groupList' => $groupList,
            'subjectList' => $subjectList,
        ])
        ?>

        <hr>

        <?php
            if($series!=null && $categories!=null):
                echo ApexChartHelper::renderParticipantScoreChart(
                    $categories, $series, Yii::t('app', 'Participant')
                );
                echo '<br>';
                echo ApexChartHelper::renderRadarChart(
                    $categories, $series, Yii::t('app', 'Participant Evaluation vs Average')
                );
            endif;
        ?>
    </div>
</div>