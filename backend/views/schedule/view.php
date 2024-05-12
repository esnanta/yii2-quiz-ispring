<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use common\models\Schedule;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a(
    '<i class="fas fa-plus"></i>',
    ['create'],
    ['class' => 'button float-right', 'style' => 'color:#333333;padding:0 5px']
);

$refresh = Html::a(
    '<i class="fas fa-sync-alt"></i>',
    ['view', 'id' => $model->id, 'title' => $model->title],
    ['class' => 'button']
);
?>


<?php
    $labelAlertTimer = 'badge bg-warning text-white';
    if ($interval < $minutesTolerance) :
        $labelAlertTimer = 'badge bg-success text-white';
    endif;
?>

<?php
    Yii2TimerCountDown::widget([
        'countDownIdSelector' => 'time-down-counter-token',
        'countDownDate' => $countdownTime * 1000
    ]);
?>

<div class="card">
    <div class="card-header">

        <?= Yii::t('app', 'Schedule') ?>
        <strong> #<?= $model->title;?></strong> /
        Token : <strong><?=$model->token;?></strong> /
        <div class="<?= $labelAlertTimer;?>">
            <div id="time-down-counter-token"></div>
        </div>
        <?=$refresh;?>
        <div class="float-right">
            <?=
            Html::a(
                '<i class="fas fa-plus"></i> New',
                ['create'],
                ['class' => LabelHelper::getButtonCssPlus()]
            );
            ?>
            <?=
            Html::a(
                '<i class="fas fa-pencil-alt"></i> Update',
                ['update', 'id' => $model->id],
                ['class' => LabelHelper::getButtonCssUpdate()]
            );
            ?>
            <?=
            Html::a('<i class="fas fa-minus"></i> Delete', ['delete', 'id' => $model->id], [
                'class' => LabelHelper::getButtonCssMinus(),
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]);
            ?>
            <button class="<?= LabelHelper::getButtonCssPrint() ?>" type="button" onclick="window.print();">
                <i class="fas fa-print"></i>
                Print
            </button>
        </div>
    </div>

    <div class="card-body">
        <div class="row mb-4">

            <div class="col-sm-4">
                <div><strong><?= $model->office->title; ?></strong></div>
                <div><?= $model->office->address; ?></div>
                <div>Email: <?= $model->office->email; ?></div>
                <div>Phone: <?= $model->office->phone_number; ?></div>
            </div>


            <div class="col-sm-4">
                <div>
                    <strong><?= $model->title; ?></strong>
                </div>
                <div><?= $model->period->title; ?></div>
                <div><?= $model->group->title; ?></div>
            </div>

            <div class="col-sm-4">
                <div>
                    <strong><?= $model->room->title; ?></strong>
                </div>
                <div><?= Yii::t('app', 'Date Start'); ?> : <?= $model->date_start; ?></div>
                <div><?= Yii::t('app', 'Date End'); ?> : <?= $model->date_end; ?></div>
            </div>

        </div>

        <?php if ($providerScheduleDetail->totalCount) { ?>

            <div class="table-responsive-sm">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Subject'); ?></th>
                        <th><?= Yii::t('app', 'Remark'); ?></th>
                        <th><?= Yii::t('app', 'Subject Type'); ?></th>
                        <th class="center"><?= Yii::t('app', 'Asset'); ?></th>
                        <th class="right"><?= Yii::t('app', ''); ?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $modelDetails = $providerScheduleDetail->getModels();
                    foreach ($modelDetails as $i => $modelDetailItem) {
                        ?>

                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                            <td class="left"><?= $modelDetailItem->remark; ?></td>
                            <td class="left"><?= $modelDetailItem->getOneSubjectType($modelDetailItem->subject_type); ?></td>
                            <td class="center">
                                <?php
                                if (empty($modelDetailItem->asset_name)) {
                                    echo Yii::t('app', 'Please upload files in zip');
                                } else {
                                    echo $modelDetailItem->getAssetButton(0);
                                }
                                ?></td>
                            <td class="right">
                                <?php
                                if ($modelDetailItem->asset_name == null) {
                                    echo Html::a(
                                        '<i class="fas fa-upload"></i>',
                                        ['schedule-detail/update', 'id' => $modelDetailItem->id],
                                        ['class' => LabelHelper::getButtonCssPlus()]
                                    );
                                } else {
                                    echo Html::a('<i class="fas fa-trash-alt"></i>',
                                        ['schedule-detail/delete-file', 'id' => $modelDetailItem->id], [
                                            'class' => LabelHelper::getButtonCssMinus(),
                                            'data' => [
                                                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                                'method' => 'post',
                                            ],
                                        ]);
                                }
                                ?>
                            </td>
                        </tr>

                    <?php } ?>

                    </tbody>
                </table>
            </div>

        <?php } ?>

        <ul class="nav nav-tabs">
<!--            <li class="nav-item">-->
<!--                <a class="nav-link active" data-toggle="tab" href="#summary">Summary</a>-->
<!--            </li>-->
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#detail">Detail</a>
            </li>
        </ul>

        <div class="tab-content">
<!--            <div class="tab-pane fade show active" id="summary">-->
<!--                <p>This is the Home content.</p>-->
<!--            </div>-->
            <div class="tab-pane fade show active" id="detail">
                <?php if ($providerAssessment->totalCount)
                {
                    echo $this->render('view_assessment', [
                        'providerAssessment' => $providerAssessment,
                    ]);
                }
                ?>
            </div>
        </div>


        <br>

        <div class="row">
            <div class="col-lg-4 col-sm-5">
                <?= Yii::t('app', 'Created At'); ?>:
                <?= date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at)); ?>
                <br><?= Yii::t('app', 'Created By'); ?> :
                <?= \common\models\User::getName($model->created_by); ?>
            </div>
            <div class="col-lg-4 col-sm-5 ml-auto">
                <?= $model->staff->title; ?><br>
                <?= Yii::t('app', 'Description'); ?>:
                <br><?= ($model->description == null) ? '-' : $model->description; ?>

            </div>
        </div>
    </div>
</div>