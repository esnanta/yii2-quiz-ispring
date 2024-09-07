<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use common\models\Schedule;
use yii\helpers\Html;

?>


<div class="table-responsive-sm">
    <table class="table table-striped">
        <thead>
        <tr>
            <th class="center">#</th>
            <th><?= Yii::t('app', 'Participant'); ?></th>
            <th><?= Yii::t('app', 'Subject'); ?></th>
            <th><?= Yii::t('app', 'Earned Points'); ?></th>
            <th><?= Yii::t('app', 'Passing Score'); ?></th>
            <th><?= Yii::t('app', 'Gained Score'); ?></th>
            <th><?= Yii::t('app', 'Evaluate Score'); ?></th>
            <th><?= Yii::t('app', 'Time Spent'); ?></th>
            <th><?= Yii::t('app', 'Time Limit'); ?></th>
        </tr>
        </thead>
        <tbody>

        <?php
        $modelDetails = $providerAssessment->getModels();
        foreach ($modelDetails as $i => $modelDetailItem) {
            $subjectType = $modelDetailItem->getOneSubjectType($modelDetailItem->subject_type);
            $wokStatus = $modelDetailItem->getOneWorkStatus($modelDetailItem->work_status);
        ?>
            <tr>
                <td class="center"><?= ($i + 1); ?></td>
                <td class="left">
                    <?php
                    $participant =
                        Html::a($modelDetailItem->participant->title,['participant/view',
                            'id' => $modelDetailItem->participant->id,
                            'title' => $modelDetailItem->participant->title
                    ]);
                    echo $participant . '<br>' . $wokStatus;
                    ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->subject->title . '<br>' . $subjectType; ?>
                </td>
                <td class="left"><?= $modelDetailItem->earned_points; ?></td>
                <td class="left"><?= $modelDetailItem->passing_score; ?></td>
                <td class="left"><?= $modelDetailItem->gained_score; ?></td>
                <td class="left"><?= $modelDetailItem->evaluate_score; ?></td>
                <td class="left"><?= $modelDetailItem->time_spent; ?></td>
                <td class="left"><?= $modelDetailItem->time_limit; ?></td>
            </tr>

        <?php } ?>

        </tbody>
    </table>
</div>


