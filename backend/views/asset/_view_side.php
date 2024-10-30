<?php

use common\helper\IconHelper;
use common\models\Asset;
use lesha724\documentviewer\ViewerJsDocumentViewer;
use supplyhog\ClipboardJs\ClipboardJsWidget;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Asset $model
 * @var common\models\Asset $assetCategoryList
 * @var common\models\Asset $assetTypeList
 * @var common\models\Asset $isVisibleList
 * @var common\service\AssetService $assetUrl
 * @var common\helper\SpreadsheetHelper $helper
 * @var common\helper\SpreadsheetHelper $fileData
 * @var string $fileType
 */

?>


<div class="card">
    <div class="card-body">
        <h6 class="card-subtitle mb-2 text-muted">
            <i class="fa fa-eye"></i> <?= $model->view_counter; ?>
            <?php

            echo ClipboardJsWidget::widget([
                'text' => 'https://' . Yii::$app->getRequest()->serverName . $model->getAssetUrl(),
                'label' => IconHelper::getClipboard() . ' Copy Url',
                'htmlOptions' => ['class' => 'btn btn-small'],
                'tag' => 'button',
            ]);

            if (!empty($model->asset_name)) {
                echo Html::a(IconHelper::getDelete(), ['asset/delete-file', 'id' => $model->id],
                    ['class' => 'card-link float-right float-end', 'data-confirm' => "Delete Asset?",
                        'data-method' => 'POST', 'title' => 'Delete Asset?']);
            }

            echo Html::a(IconHelper::getDownload() . ' ' . $model->download_counter,
                ['asset/download', 'id' => $model->id, 'title' => $model->title],
                ['class' => 'card-link float-right float-end','style'=>'padding-right:5px', 'title' => 'Download']);

            if ($fileType == Asset::ASSET_TYPE_SPREADSHEET) {
                echo Html::a(IconHelper::getImport() . ' Import',
                    ['participant/import', 'id' => $model->id, 'title' => $model->title],
                    ['class' => 'card-link float-right float-end', 'title' => 'Import']);
            }

            ?>
        </h6>

        <br>

        <?php
        if ($fileType == Asset::ASSET_TYPE_IMAGE) {
            echo Html::img($assetUrl, ['class' => 'img-fluid']);
        } elseif ($fileType == Asset::ASSET_TYPE_SPREADSHEET) {
            /*
             * "displayGrid" is defined as a void method, using echo here will result
             * in a warning because echo expects a return value to display.
             * should call it without echo
             */
            $helper->displayGrid($fileData);
        } elseif ($fileType == Asset::ASSET_TYPE_WORD ||
            $fileType == Asset::ASSET_TYPE_PDF) {
            echo ViewerJsDocumentViewer::widget([
                'url' => $assetUrl,//url на ваш документ
                'width' => '100%',
                'height' => '300px',
                //https://geektimes.ru/post/111647/
            ]);
        } elseif ($fileType == Asset::ASSET_TYPE_COMPRESSION) {
            $extract = Html::a('Extract',
                ['asset/extract', 'id' => $model->id, 'title' => $model->title],
                ['class' => 'text-center', 'title' => 'Extract']);

            echo '<ul class="list-group list-group-flush">';
            echo '<li class="list-group-item">' .
                IconHelper::getFile() . ' ' .
                $model->asset_name . '</li>';
            echo '<li class="list-group-item">' .
                IconHelper::getArchive() . ' ' .
                $extract .
                '<span class="float-end float-right">' . $renderIndexFileStatus . '</span>' .
                '</li>';
            echo '</ul>';

        }
        ?>

        <br>

        <?php if (!empty($scheduleDetailList)) { ?>
            <p><?= Yii::t('app', 'Schedule'); ?></p>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col"><?= Yii::t('app', 'Title'); ?></th>
                    <th scope="col"><?= Yii::t('app', 'Subject'); ?></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($scheduleDetailList as $i => $scheduleDetail) { ?>
                    <tr>
                        <th scope="row"><?= ($i + 1); ?></th>
                        <td>
                            <?= $scheduleDetail->schedule->getUrl(); ?>
                        </td>
                        <td><?= $scheduleDetail->subject->title; ?></td>
                    </tr>
                <?php } ?>

                </tbody>
            </table>
        <?php } ?>
    </div>
</div>

