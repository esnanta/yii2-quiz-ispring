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
        </tr>
        </thead>
        <tbody>

        <?php
        foreach ($participantList as $i => $modelDetailItem) {
            ?>
            <tr>
                <td class="center"><?= ($i + 1); ?></td>
                <td class="left">
                    <?= $modelDetailItem->title; ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->group->title; ?>
                </td>
                <td class="left">
                    <?= $modelDetailItem->username; ?>
                </td>
            </tr>

        <?php } ?>

        </tbody>
    </table>
</div>


