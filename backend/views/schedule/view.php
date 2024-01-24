<?php

use common\helper\LabelHelper;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model backend\models\Schedule */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a(
    '<i class="fas fa-plus"></i>',
    ['create'],
    ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']
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
                <li><span class="g-font-weight-700">
                        <?= Yii::t('app', 'Schedule')?>
                    </span>
                    <?= $model->title;?>
                </li>
                <li><span class="g-font-weight-700"><?= Yii::t('app', 'Group');?>:</span>
                    <?= $model->group->title;?>
                </li>
                <li><span class="g-font-weight-700"><?= Yii::t('app', 'Room');?>:</span>
                    <?= $model->room->title;?>
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
                    <?= $model->date_start;?>
                </li>
                <li>
                    <span class="g-font-weight-700">
                        <?= Yii::t('app', 'Date End');?>:
                    </span>
                    <?= $model->date_end;?>
                </li>
            </ul>
        </div>
    </div>
</section>
<!-- End General Info -->


<!-- Table Striped Rows -->
<section class="container g-pb-70">

    <?php if ($providerScheduleDetail->totalCount) { ?>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="g-color-white g-bg-primary text-center text-uppercase">
                <tr>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15">Ref</th>
                    <th class="g-brd-top-none g-font-weight-500 text-left g-py-15">
                        <?= Yii::t('app', 'Subject');?>
                    </th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Remark');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', 'Asset');?></th>
                    <th class="g-brd-top-none g-font-weight-500 g-py-15"><?= Yii::t('app', '');?></th>
                </tr>
                </thead>

                <tbody class="text-center">
                <?php
                $modelDetails = $providerScheduleDetail->getModels();
                foreach ($modelDetails as $i => $modelDetailItem) {
                    ?>
                    <tr>
                        <td class="g-width-70 g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= ($i+1);?>
                        </td>
                        <td class="g-max-width-300 text-left g-py-15">
                            <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">
                                <?= $modelDetailItem->subject->title;?>
                            </h4>
                            <p class="g-color-gray-dark-v5 g-font-size-12 mb-0">
                                <?= $modelDetailItem->subject->description;?>
                            </p>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?= $modelDetailItem->remark;?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?php

                                if(empty($modelDetailItem->asset_name)){
                                    echo '<i>Asset not available</i>';
                                } else {
                                    $textLink  = Yii::$app->urlManager->baseUrl.$modelDetailItem->getExtractUrl();
                                    echo Html::a(
                                        'Open',
                                        str_replace('admin','frontend/web',$textLink),
                                        ['class' => LabelHelper::getButtonCssPlus()]
                                    );
                                }
                            ?>
                        </td>
                        <td class="g-color-gray-dark-v4 g-font-weight-600 g-py-15">
                            <?php
                                if($modelDetailItem->asset_name==null){
                                    echo Html::a(
                                        '<i class="fas fa-upload"></i>',
                                        ['schedule-detail/update','id'=>$modelDetailItem->id],
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
                            </span> <?= \backend\models\User::getName($model->created_by);?>
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
