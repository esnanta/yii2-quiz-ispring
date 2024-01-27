<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use yii\bootstrap5\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */

$this->title = Yii::$app->name;
?>

<div class="row">
    <div class="col-xs-6 col-sm-3 col-xl-3">
        <div class="card overflow-hidden rounded-2">
            <div class="position-relative">
                <a href="javascript:void(0)">
                    <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/profile/user-1.jpg"
                                                  class="card-img-top rounded-0"
                                                  alt="...">
                </a>
                <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
            <div class="card-body pt-3 p-4">
                <h6 class="fw-semibold fs-4">
                    <?=Yii::$app->user->identity->username?>
                </h6>

                <div class="timeline-desc fs-3 text-dark mt-n1">
                    <?=$participant->title;?> <br>
                    <?=$participant->group->title;?>
                </div>

            </div>
        </div>
    </div>


    <div class="col-xs-6 col-sm-9 col-xl-9 d-flex align-items-stretch">
        <div class="card w-100">
            <div class="card-body p-4">
                <div class="mb-4">
                    <h5 class="card-title fw-semibold">
                        <?= Yii::t('app', 'Schedule');?>
                    </h5>
                </div>

                <ul class="timeline-widget mb-0 position-relative mb-n5">
                <?php
                    foreach ($schedules as $scheduleItem) {
                        $timeReference      = strtotime($scheduleItem->date_start);
                        $currentTime        = strtotime("now");
                        $minutesDifference  = round(abs(($timeReference - $currentTime) / 60));
                        $minutesTolerance   = 10; //minutes

                        //10 MINUTES BEFORE START, CHANGE REFERENCE TO DATE_END
                        if($timeReference < $currentTime) :
                            $timeReference = strtotime($scheduleItem->date_end);
                        endif;

                    ?>




                    <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">
                            <?= Yii::$app->formatter->format($scheduleItem->date_start, 'date'); ?>
                            <br>
                            <?= Yii::t('app', 'Start');?> :
                            <?= date('H:i:s',strtotime($scheduleItem->date_start)); ?>
                        </div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                            <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                            <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>

                        <div class="timeline-desc fs-3 text-dark mt-n1">
                            <?= $scheduleItem->room->title.' - '.$scheduleItem->title?>
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <tbody>
                                    <?php foreach ($scheduleItem->scheduleDetails as $scheduleDetailItem) { ?>
                                    <tr>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1"><?=$scheduleDetailItem->remark;?></h6>
                                        </td>
                                        <td class="border-bottom-0">
                                            <?php
                                            if(empty($scheduleDetailItem->asset_name)){
                                                echo '<i>Asset not available</i>';
                                            } else {

                                                $textLink           = '';
                                                $linkLabel          = Yii::t('app', 'Closed');
                                                $labelClass         = LabelHelper::getButtonCssPlus().' disabled';

                                                if($timeReference > $currentTime) :
                                                    //http://www.mywebsite.com/presentation/index.html?USER_NAME=John&USER_EMAIL=john@ispringsolutions.com&ADDRESS=NYC
                                                    $userinfo   = '?USER_NAME=' . Yii::$app->user->identity->username .
                                                        '&SCD='.$scheduleDetailItem->id;
                                                    $textLink   = Yii::$app->urlManager->baseUrl .
                                                        $scheduleDetailItem->getExtractUrl() . $userinfo;
                                                    $linkLabel  = Yii::t('app', 'Open');
                                                    $labelClass = LabelHelper::getButtonCssPrint();
                                                endif;

                                                echo Html::a(
                                                    $linkLabel,
                                                    $textLink,
                                                    ['class' => $labelClass]
                                                );
                                            }
                                            ?>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="timeline-desc fs-3 text-dark mt-n1">
                            <?php
                                $labelAlertTimer = 'alert-warning';
                                if($minutesDifference < $minutesTolerance) :
                                    $labelAlertTimer = 'alert-success';
                                endif;

                            ?>

                            <div class="alert <?=$labelAlertTimer;?>">
                                <div id="time-down-counter"></div>
                            </div>

                            <?=
                            Yii2TimerCountDown::widget([
                                'countDownIdSelector' => 'time-down-counter',
                                'countDownDate' => strtotime(date("Y-m-d H:i:s", $timeReference)) * 1000
                            ]);
                            ?>


                        </div>
                    </li>

                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>

