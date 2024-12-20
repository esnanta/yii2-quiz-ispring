<?php

use yii\bootstrap4\Html;

?>
<!--
=========================================================
* YII2 QUIZ ISPRING
=========================================================

* Product Page: https://github.com/esnanta/yii2-quiz-ispring
* Licensed under Creative Commons Attribution-NonCommercial 4.0 International
* Power by Yii

=========================================================
* Layout Page Frontend : https://github.com/adminmart/Modernize-bootstrap-free
* Layout Page Backend : https://github.com/StartBootstrap/startbootstrap-sb-admin-2
=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>
                Copyright &copy; by Nantha Seutia |
                <i class="fab fa-github"></i>
                <?= Html::a(Html::encode(Yii::$app->name),
                    'https://github.com/esnanta/yii2-quiz-ispring') ?> |
                Designed by <?= Html::a('sbadmin-2','https://github.com/StartBootstrap/startbootstrap-sb-admin-2') ?>
            </span>
        </div>
    </div>
</footer>
<!-- End of Footer -->
