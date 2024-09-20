<?php
use common\helper\IconHelper;
use yii\bootstrap5\Html;
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

DO NOT REMOVE OR EDIT FOOTER

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->

<div class="mt-auto py-6 px-6 text-center">
    <p class="mb-0 fs-4">
        <?= IconHelper::getHome();?> <?= Html::a('Daraspace','https://www.daraspace.com/') ?>
        |
        <?= IconHelper::getGithub();?>
        <?= Html::a(Html::encode(Yii::$app->name),
            'https://github.com/esnanta/yii2-quiz-ispring') ?>
        | Copyright &copy; by Nantha Seutia  <?=date('Y')?>
    </p>
</div>