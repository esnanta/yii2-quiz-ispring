<?php

/** @var \yii\web\View $this */
/** @var string $content */

use common\widgets\AlertBootstrap4;
use frontend\assets\AppBootstrap4Asset;
use yii\bootstrap4\Breadcrumbs;
use yii\bootstrap4\Html;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;

use common\helper\CacheCloud;

AppBootstrap4Asset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>

<header>
    <?php
    NavBar::begin([
        'brandLabel' => 'Rajahati',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar navbar-expand-md navbar-dark bg-dark fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
        //['label' => 'About', 'url' => ['/site/about']],
        //['label' => 'Contact', 'url' => ['/site/contact']],
    ];
    if (Yii::$app->user->isGuest) {
        //$menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
    }

    echo Nav::widget([
        'options' => ['class' => 'navbar-nav me-auto mb-2 mb-md-0'],
        'items' => $menuItems,
    ]);
    
                                    
//                                    if (Yii::$app->user->getIsGuest()) {
//                                        echo Yii::$app->user->identity;
//                                        echo '<li>';
//                                        echo str_replace('user/user/', '', Html::a('Login', ['admin/user/login'], ['class' => 'd-block g-color-secondary-dark-v1 g-color-primary--hover g-text-underline--none--hover g-py-5 g-px-20']));
//                                        echo '</li>';
//                                    } else {
//
//                                        if (Yii::$app->user->identity->isAdmin == true) {
//                                            echo '<li>';
//                                            echo Html::a('Admin', ['/backend/web/site/index'], ['class' => 'd-block g-color-secondary-dark-v1 g-color-primary--hover g-text-underline--none--hover g-py-5 g-px-20']);
//                                            echo '</li>';
//                                        }
//
//                                        echo '<li>';
//                                        echo Html::a('Sign Out ', ['user/security/logout'], ['data-method' => 'POST', 'class' => 'd-block g-color-secondary-dark-v1 g-color-primary--hover g-text-underline--none--hover g-py-5 g-px-20']);
//                                        echo '</li>';
//                                    }
                                   
    
    
    
    if (Yii::$app->user->isGuest) {
        //$loginText = str_replace('user/user/', '', Html::a('Login', ['admin/user/login'], ['class' => '']));
        echo Html::tag('div',Html::a('Login',['user/login'],['class' => ['btn btn-link login text-decoration-none']]),['class' => ['d-flex']]);
    } else {
        
        $cacheCloud = new CacheCloud();
        $officeId   = $cacheCloud->getOfficeId();
        $authItemName   = $cacheCloud->getAuthItemName();

        $dashboardMenuVisibility = false;
        if($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']){
            $dashboardMenuVisibility = true;
        }    
        
        if($dashboardMenuVisibility==true):
            echo Html::tag('div',Html::a('Dashboard', (['/admin/site/index']), ['class' => ['btn btn-link login text-decoration-none']]),['class' => ['d-flex']]);
        endif;

        echo Html::tag('div',Html::a('Sales', (['/fuel-sales/index']), ['class' => ['btn btn-link login text-decoration-none']]),['class' => ['d-flex']]);
        echo Html::tag('div',Html::a(Yii::$app->user->identity->username, (['user/login']), ['class' => ['btn btn-link login text-decoration-none']]),['class' => ['d-flex']]);
        echo Html::beginForm(['/user/logout'], 'post', ['class' => 'd-flex'])
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . ')',
                ['data-confirm' => 'Logout now?', 'class' => 'btn btn-link logout text-decoration-none']
            )
            . Html::endForm();
    }
    NavBar::end();
    ?>
</header>

<main role="main" class="flex-shrink-0">
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= AlertBootstrap4::widget() ?>
        <?= $content ?>
    </div>
</main>

<footer class="footer mt-auto py-3 text-muted">
    <div class="container">
        <p class="float-start">&copy; <?= Html::encode(Yii::$app->name) ?> <?= date('Y') ?></p>
        <p class="float-end"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage();
