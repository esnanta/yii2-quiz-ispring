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
            <th><?= Yii::t('app', 'Group'); ?></th>
            <th><?= Yii::t('app', 'Username'); ?></th>
            <th><?= Yii::t('app', 'Last Login'); ?></th>
            <th><?= Yii::t('app', 'Status'); ?></th>
            <th><?= Yii::t('app', 'Reset'); ?></th>
        </tr>
        </thead>
        <tbody>

        <?php
        foreach ($participantList as $i => $modelDetailItem) {
            ?>
            <tr>
                <td class="center"><?= ($i + 1); ?></td>
                <td class="left">
                    <?php
                    $participant =
                        Html::a($modelDetailItem->title, ['profile/view',
                            'id' => $modelDetailItem->id,
                            'title' => $modelDetailItem->title
                        ]);
                    echo $participant;
                    ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->group->title; ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->username; ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->last_login_at; ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->getOneStatus($modelDetailItem->status); ?>
                </td>
                <td class="left"><?=
                    Html::a(
                        IconHelper::getReset(),
                        Yii::$app->urlManager->createUrl([
                            'profile/reset',
                            'id' => $modelDetailItem->id,
                            'schId' => $model->id,
                            'title' => $modelDetailItem->title
                        ]),
                        [
                            'title' => Yii::t('yii', 'Reset'),
                            'class' => 'btn btn-sm btn-danger '.$modelDetailItem->getIsButtonDisabled(),
                        ]
                    );
                    ?>
                </td>
            </tr>

        <?php } ?>

        </tbody>
    </table>
</div>


