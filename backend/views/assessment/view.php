<?php

use common\helper\LabelHelper;
use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model common\models\Assessment */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a(
    '<i class="fas fa-plus"></i>',
    ['create'],
    ['class' => 'button float-right','style'=>'color:#333333;padding:0 5px']
);
?>


<div class="row justify-content-between">
    <div class="col-md-4 align-self-center g-hidden-sm-down g-mb-30">
    </div>

    <div class="col-md-7 align-self-center g-mb-30">
        <div class="text-right">
            <?=
            Html::a(
                '<i class="fas fa-plus"></i> New',
                ['create'],
                ['class' => LabelHelper::getButtonCssPlus()]
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
            <button class="<?=LabelHelper::getButtonCssPrint()?>" type="button" onclick="window.print();">
                <i class="fas fa-print"></i>
                Print
            </button>
        </div>
    </div>
</div>


<section class="container g-pt-10 g-pb-10">
    <div class="row">
        <div class="col-md-6 g-mb-30">

            <h2 class="h4 g-font-weight-700 text-uppercase"><?= $model->office->title;?></h2>
            <p class="g-color-gray-dark-v4"><?= $model->office->phone_number;?>
                <br><?= $model->office->email;?>
                <br><?= $model->office->address;?></p>
        </div>

        <div class="col-md-3 g-mb-30">
            <h3 class="h5 g-color-black g-font-weight-600 text-uppercase">
                <?= Yii::t('app', 'Details');?>
            </h3>
            <ul class="list-unstyled g-font-size-default">
                <li>
                    <span class="g-font-weight-700">
                        <?= Yii::t('app', 'Assessment')?>
                    </span>
                    <?= $model->title;?>
                </li>
                <li><span class="g-font-weight-700"><?= Yii::t('app', 'Schedule');?>:</span>
                    <?= $model->schedule->title;?>
                </li>
            </ul>
        </div>

        <div class="col-md-3 g-mb-30">
            <h3 class="h5 g-color-black g-font-weight-600 text-uppercase">
                <?= Yii::t('app', 'Time')?>:
            </h3>
            <ul class="list-unstyled g-font-size-default">
                <li>
                    <span class="g-font-weight-700">
                        <?= Yii::t('app', 'Date Start');?>:
                    </span>
                    <?= $model->schedule->date_start;?>
                </li>
                <li>
                    <span class="g-font-weight-700">
                        <?= Yii::t('app', 'Date End');?>:
                    </span>
                    <?= $model->schedule->date_end;?>
                </li>
            </ul>
        </div>
    </div>
</section>
<!-- End General Info -->

<!-- Table Striped Rows -->
<section class="container g-pb-70">

    <?php if ($providerAssessmentDetail->totalCount) { ?>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="g-color-white g-bg-primary text-center text-uppercase">
                <tr>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15">Ref</th>
                    <th class="g-brd-top-none g-font-weight-500 text-left g-py-15">
                        <?= Yii::t('app', 'Participant');?>
                    </th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Subject');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Earned Points');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Passing Score');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Gained Score');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Time Limit');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Used Time');?></th>
                </tr>
                </thead>

                <tbody class="text-center">
                <?php
                $modelDetails = $providerAssessmentDetail->getModels();
                foreach ($modelDetails as $i => $modelDetailItem) {
                    ?>
                    <tr>
                        <td class="g-width-70 g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= ($i+1);?>
                        </td>
                        <td class="g-max-width-300 text-left g-py-15">
                            <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">
                                <?= $modelDetailItem->participant->title;?>
                            </h4>
                            <p class="g-color-gray-dark-v5 g-font-size-12 mb-0">
                                <?= $modelDetailItem->quiz_title .' ('.$modelDetailItem->quiz_type.')';?>
                            </p>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= $modelDetailItem->subject->title;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= $modelDetailItem->earned_points;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= $modelDetailItem->passing_score;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= $modelDetailItem->gained_score;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= gmdate("H:i:s", $modelDetailItem->time_limit) ;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= gmdate("H:i:s", $modelDetailItem->used_time);?>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    <?php } ?>

    <div class="g-bg-gray-light-v5 mb-2">
        <div class="row justify-content-end">
            <div class="col-lg-7">
                <div class="col-md-12 align-self-center g-mb-30">
                    <ul class="list-unstyled g-font-weight-600 text-uppercase py-4 g-pr-50 mb-0">

                        <li class="my-1"><span class="g-font-weight-600">
                            <?= Yii::t('app', 'Description');?>:
                            <br><?=($model->description==null) ? '-':'';?>
                            <br>
                            <br>
                        </li>

                        <li class="my-1">
                            <span class="g-font-weight-600">
                                <?= Yii::t('app', 'Created At');?>:
                            </span>
                            <?=date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at));?>
                        </li>
                        <li class="my-1"><span class="g-font-weight-600">
                            <?= Yii::t('app', 'Created By');?> :
                             <?= \common\models\User::getName($model->created_by);?>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="col-lg-5">
                <ul class="list-unstyled g-font-weight-600 text-uppercase py-4 g-pr-50 mb-0">

                </ul>
            </div>
        </div>
    </div>
    <!-- End Subtotal -->

</section>
<!-- End Table Striped Rows -->


