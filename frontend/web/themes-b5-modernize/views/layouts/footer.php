<?php
use yii\bootstrap5\Html;
?>
<div class="mt-auto py-6 px-6 text-center">
    <p class="mb-0 fs-4">
        &copy; <?= Html::encode(Yii::$app->name) ?> <?= date('Y') ?>
        <?= Yii::powered() ?></p>
</div>