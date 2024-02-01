<?php
/** @var yii\web\View $this */
$this->title = Yii::$app->name;
use yii\helpers\Html;
?>


<div class="row">
    <div class="col-md-4 col-xs-6">

        <!-- Panel -->
        <div class="card g-brd-gray-light-v7 g-rounded-3 g-mb-30">
            <div class="card-block g-pa-15 g-pa-30--sm">
                <!-- User Information -->
                <section class="text-center g-mb-30 g-mb-50--md">
                    <div class="d-inline-block g-pos-rel g-mb-20">
                        <?= Html::a('<i class="hs-admin-pencil g-absolute-centered g-font-size-16 g-color-white"></i>',
                            ['/staff/update', 'id' => $staff->id],
                            ['class' => 'u-badge-v2--lg u-badge--bottom-right g-width-32 g-height-32 g-bg-secondary g-bg-primary--hover g-transition-0_3 g-mb-20 g-mr-20']); ?>
                        <img class="img-fluid rounded-circle" src="<?= $staff->getImageUrl() ?>"
                             alt="<?= $staff->title; ?>">
                    </div>

                    <h3 class="g-font-weight-300 g-font-size-20 g-color-black mb-0"><?= Html::a($staff->title, ['/staff/view', 'id' => $staff->id,]); ?></h3>
                </section>
                <!-- User Information -->

                <!-- Profile Sidebar -->
                <section>
                    <ul class="list-unstyled mb-0">
                        <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                            <span class="d-flex align-items-center u-link-v5 g-parent g-py-15" href="">
                                <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent g-mr-15">
                                    <i class="fa fa-id-badge"></i>
                                </span>

                                <span class="u-tags-v1 g-color-main g-brd-around g-brd-gray-light-v3 g-bg-gray-dark-v2--hover g-brd-gray-dark-v2--hover g-color-white--hover g-rounded-50 g-py-4 g-px-15">
                                    <?= (!empty($authItemName)) ? $authItemName : '-'; ?>
                                </span>
                            </span>
                        </li>
                        <li class="g-brd-top g-brd-gray-light-v7 mb-0">

                            <span class="d-flex align-items-center u-link-v5 g-parent g-py-15" href="">
                                <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent g-mr-15">
                                    <i class="fa fa-university"></i>
                                </span>
                                <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent">
                                    <?= (!empty($office->title)) ? $office->title : '-' ?>
                                </span>
                            </span>
                        </li>

                        <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                            <span class="d-flex align-items-center u-link-v5 g-parent g-py-15" href="">
                                <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent g-mr-15">
                                    <i class="fa fa-phone"></i>
                                </span>
                                <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">
                                    <?= (!empty($office->phone_number)) ? $office->phone_number : '-'; ?>
                                </span>
                            </span>
                        </li>
                        <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                            <span class="d-flex align-items-center u-link-v5 g-parent g-py-15" href="">
                                <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent g-mr-15">
                                    <i class="fa fa-send"></i>
                                </span>
                                <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">
                                    <?= (!empty($office->email)) ? $office->email : '-'; ?>
                                </span>
                            </span>
                        </li>
                    </ul>
                </section>

            </div>
        </div>
        <!-- End Panel -->
    </div>


    <div class="col-md-12 col-xs-12">
        <div class="js-area-chart u-area-chart--v1 g-pos-rel g-line-height-0" data-height="100px" data-high="2420"
             data-low="0" data-offset-x="0" data-offset-y="0" data-postfix=" m" data-is-show-area="true"
             data-is-show-line="false" data-is-show-point="true"
             data-is-full-width="true" data-is-stack-bars="true" data-is-show-axis-x="false" data-is-show-axis-y="false"
             data-is-show-tooltips="true" data-tooltip-description-position="left"
             data-tooltip-custom-class="u-tooltip--v2 g-font-weight-300 g-font-size-default g-color-gray-dark-v6"
             data-align-text-axis-x="center" data-fill-opacity=".3" data-fill-colors='["#1cc9e4"]'
             data-stroke-width="2px" data-stroke-color="#1cc9e4" data-stroke-dash-array="0" data-text-size-x="14px"
             data-text-color-x="#000000" data-text-offset-top-x="0"
             data-text-size-y="14px" data-text-color-y="#53585e" data-points-colors='["#1cc9e4"]' data-series='[
                [
                  {"meta": "$", "value": 400},
                  {"meta": "$", "value": 2400},
                  {"meta": "$", "value": 700},
                  {"meta": "$", "value": 2750},
                  {"meta": "$", "value": 600},
                  {"meta": "$", "value": 1840},
                  {"meta": "$", "value": 320},
                  {"meta": "$", "value": 2720},
                  {"meta": "$", "value": 800}
                ]
            ]' data-labels='["2013", "2014", "2015", "2016", "2017"]'>
        </div>
    </div>

</div>

