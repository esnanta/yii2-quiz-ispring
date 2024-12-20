<?php

use common\helper\IconHelper;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 * @var common\models\Office $officeList
 * @var common\models\Participant $listParticipant
 */

?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Participants');?>
        <span class="float-right float-end">
                    <?= Html::a(IconHelper::getUpdate(),
                        ['update-participant', 'id'=>$model->id, 'title'=>$model->title],
                        ['class' => 'btn btn-primary float-right float-end']); ?>
                </span>
    </div>
    <div class="card-body text-default">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col"><?=Yii::t('app', 'Title');?></th>
                <th scope="col"><?=Yii::t('app', 'Identity Number');?></th>
                <th scope="col"><?=Yii::t('app', 'Username');?></th>
                <th scope="col"><?=Yii::t('app', 'Group');?></th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($listParticipant as $i=>$participant) { ?>
                <tr>
                    <th scope="row"><?=($i+1)?></th>
                    <td><?= $participant->title ?></td>
                    <td><?= $participant->identity_number ;?></td>
                    <td><?= $participant->username ;?></td>
                    <td><?= $participant->group->title ;?></td>
                </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</div>



