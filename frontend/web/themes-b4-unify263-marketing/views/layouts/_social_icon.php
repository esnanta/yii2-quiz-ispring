<?php
use yii\helpers\Html;
?>

<ul class="col-auto list-inline g-pos-abs g-right-0 g-pos-rel--lg g-top-minus-3 g-py-20 g-py-6--lg g-pr-5 g-mr-60 g-mr-0--lg ml-auto ml-lg-0 mb-0">

    <?php if (Yii::$app->user->getIsGuest()) { ?>
        <li class="list-inline-item g-mx-0">
            <?php
            $login = Html::a('<i class="fa fa-user"></i>',
                            ['user/security/login'],
                            ['class' => 'u-icon-v3 u-icon-size--xs g-bg-transparent g-bg-main--hover rounded']);
            echo str_replace('user/user/', 'user/', $login);
            ?>

        </li>

    <?php
    } else {
        if (Yii::$app->user->identity->isAdmin == true) {
            echo '<li class="list-inline-item g-mx-0">';
            echo Html::a('<i class="fa fa-dashboard"></i> ', ['/backend/web/site/index'],
                    ['class' => 'u-icon-v3 u-icon-size--xs g-bg-transparent g-bg-main--hover rounded']);
            echo '</li>';
        }

        echo '<li class="list-inline-item g-mx-0">';

        echo Html::a(
                '<i class="fa fa-sign-out"></i>',
                ['user/security/logout'],
                ['data-method' => 'post',
                    'data-confirm' => 'Logout now?',
                    'class' => 'u-icon-v3 u-icon-size--xs g-bg-transparent g-bg-main--hover rounded',
                    'title' => 'Logout']
        );

        echo '</li>';
    }
    ?>

</ul>