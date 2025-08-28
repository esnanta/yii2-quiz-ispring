<?php

use common\service\UserService;

/**
 * @var yii\web\View $this
 * @var common\models\Participant $model
 * @var common\models\Asset $assetList
 * @var common\models\Group $groupList
 * @var common\models\Office $officeList
 * @var common\helper\SpreadsheetHelper $helper
 * @var common\helper\SpreadsheetHelper $sheetData
 */

$this->title = Yii::t('app', 'Import {modelClass}', [
    'modelClass' => 'Participant',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Participants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header"><?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?=Yii::t('app', 'Participant');?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="participant-create">
            <?= $this->render('_import', [
                'model' => $model,
                'officeList'=>$officeList,
                'groupList' => $groupList,
                'assetList' => $assetList
            ]) 
            ?>
            <br>
            <div class="row">
                <div class="col-md-12">
                    <?php
                        UserService::displayDuplicate($duplicateData);
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>