<?php
use common\helper\IconHelper;
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
            <th><?= Yii::t('app', 'Work Status'); ?></th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <?php
        $modelDetails = $providerAssessment->getModels();
        foreach ($modelDetails as $i => $modelDetailItem) {
            $questionType = $modelDetailItem->getOneQuestionType($modelDetailItem->question_type);
            $wokStatus = $modelDetailItem->getOneSubmissionStatus($modelDetailItem->submission_status);
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
                    echo $participant;
                    ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->subject->title . '<br>' . $questionType; ?>
                </td>
                <td class="left"><?= $modelDetailItem->earned_points; ?></td>
                <td class="left"><?= $modelDetailItem->passing_score; ?></td>
                <td class="left"><?= $modelDetailItem->gained_score; ?></td>
                <td class="left"><?= $modelDetailItem->evaluate_score; ?></td>
                <td class="left"><?= $modelDetailItem->time_spent; ?></td>
                <td class="left"><?= $modelDetailItem->time_limit; ?></td>
                <td class="left"><?= $wokStatus ?></td>
                <td class="left no-print">
                    <?php
                    echo Html::a(
                        IconHelper::getDelete(),
                        ['/assessment/delete','id'=>$modelDetailItem->id],
                        ['data-method' => 'post',
                            'data-confirm' => 'Delete this?',
                            'class' => 'dropdown-item',
                            'title' => 'Delete']);
                    ?>
                </td>
            </tr>

        <?php } ?>

        </tbody>
    </table>
</div>


