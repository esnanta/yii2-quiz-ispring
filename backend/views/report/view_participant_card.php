<?php

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 * @var common\models\Participant $participants
 */

$this->title = Yii::t('app', 'Report {modelClass}', [
    'modelClass' => 'Participant',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Participant'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<style>
    /* Optional: Add some spacing between cards */
    .card {
        margin-bottom: 20px;
    }

    /* Smaller font for the entire card content */
    .card-header, .card-title, .card-text {
        font-size: 0.875rem; /* Smaller font size */
    }

    /* Print styles */
    @media print {
        .print-button {
            display: none; /* Hide the print button during printing */
        }

        /* Ensure cards stay side by side */
        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .col-md-6 {
            box-sizing: border-box;
            flex: 0 0 50%;
            max-width: 50%;
        }
    }
</style>

<div class="container my-4">
    <div class="row">
        <!-- Participant Card Start -->
        <?php
        foreach($participants as $i=>$participantItemModel) {
            ?>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-default text-black">
                        <?= $participantItemModel->office->title;?>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <?= $participantItemModel->title;?>
                            <span class="float-right float-end">
                                <?=Yii::t('app', 'Group')?> :
                                <?= $participantItemModel->group->title;?>
                            </span>
                        </h5>
                        <p class="card-text">
                            <strong><?=Yii::t('app', 'Username')?>:</strong>
                            <?= $participantItemModel->username;?>
                        </p>
                        <p class="card-text">
                            <strong><?=Yii::t('app', 'Password')?>:</strong>
                            <?= $participantItemModel->password;?>
                        </p>
                    </div>
                </div>
            </div>

        <?php } ?>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-secondary print-button float-end float-right"
                    onclick="window.print()">Print
            </button>
        </div>
    </div>
</div>
