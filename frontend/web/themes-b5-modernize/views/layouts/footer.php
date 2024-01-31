<?php
use yii\bootstrap5\Html;
use yii\helpers\Url;
?>

<!--
=========================================================
* YII2 QUIZ ISPRING
=========================================================

* Product Page: https://github.com/esnanta/yii2-quiz-ispring
* Licensed under MIT
* Power by Yii

=========================================================
* Layout Page Frontend : https://github.com/adminmart/Modernize-bootstrap-free
* Layout Page Backend : https://github.com/StartBootstrap/startbootstrap-sb-admin-2
=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->

<div class="mt-auto py-6 px-6 text-center">
    <p class="mb-0 fs-4">
        Copyright &copy; by Nantha Seutia |
        <i class="fab fa-github"></i>
        <?= Html::a(Html::encode(Yii::$app->name) .' '.date('Y'),
            'https://github.com/esnanta/yii2-quiz-ispring') ?> |
        Power by <?= Html::a('Yii','https://www.yiiframework.com/') ?>
    </p>
</div>