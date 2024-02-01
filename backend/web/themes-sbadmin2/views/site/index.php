<?php
/** @var yii\web\View $this */
$this->title = Yii::$app->name;

use yii\helpers\Html;

?>


<!-- Content Row -->
<div class="row">

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            <?= Yii::t('app', 'Participant (Offline)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countOfflineParticipant ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Participant (Online)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countOnlineParticipant ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Group'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countGroup ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Subject'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countSubject ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Content Row -->

<div class="row">
    <div class="col-md-6 col-xs-12">
        <div class="card mb-3" style="max-width: 540px;">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    User Info <span class="float-right"><i class="fas fa-user"></i></span>
                </h6>
            </div>
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<?= $staff->getAssetUrl() ?>" class="img-fluid rounded-start"
                         alt="<?= $staff->title; ?>">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">
                            <?= $staff->title; ?>
                        </h5>

                        <p class="card-text">
                            <i class="fas fa-id-badge"></i>
                            <?= (!empty($authItemName)) ? $authItemName : '-'; ?>
                        </p>

                        <p class="card-text">
                            <i class="fas fa-briefcase"></i>
                            <?= (!empty($office->title)) ? $office->title : '-' ?>
                        </p>

                        <p class="card-text">
                            <i class="fas fa-phone"></i>
                            <?= (!empty($office->phone_number)) ? $office->phone_number : '-'; ?>
                        </p>

                        <p class="card-text">
                            <i class="fas fa-envelope"></i>
                            <?= (!empty($office->email)) ? $office->email : '-'; ?>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>

