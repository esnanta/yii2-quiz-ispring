<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>

<?php
$module = Yii::$app->getModule('user');

function getMenu($_menuName, $_classIcon): string
{
    return '<span>' .
            '<i class="' . $_classIcon . '"></i>' .
            '</span>' .
            '<span class="hide-menu">' . $_menuName . '</span>';
}
?>

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <?php $urlHome = str_replace('user/site','site',Url::to(['site/index']));?>
            <a href="<?= $urlHome ?>" class="text-nowrap logo-img">
                <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/logos/dark-logo.svg"
                     width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>

        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">

                <?php if (!Yii::$app->user->isGuest) { ?>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">
                            Home
                        </span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Dashboard'), 'fa fa-dashboard'),
                            ['/site/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Quiz</span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Schedule'), 'fa fa-angle-right'),
                            ['/schedule/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Assessment'), 'fa fa-angle-right'),
                            ['/assessment/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Chart'), 'fa fa-angle-right'),
                            ['/chart/participant-chart'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">
                            <?=Yii::t('app', 'Auth');?>
                        </span>
                    </li>
                    <li class="sidebar-item">
                        <?=
                        Html::a(
                            getMenu(Yii::t('app', 'Logout'), 'fa fa-sign-out'),
                            ['/site/logout'],
                            ['data-method' => 'POST', 'data-confirm' => "Logout?", 'class' => 'sidebar-link']
                        )
                        ?>
                    </li>
                <?php } else { ?>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"><?=Yii::t('app', 'Auth');?></span>
                    </li>
                    <li class="sidebar-item">
                    <?=
                    Html::a(
                        getMenu(Yii::t('app', 'Login'), 'fa fa-sign-in'),
                        ['/site/login'],
                        ['class' => 'sidebar-link']
                    )
                    ?>
                    </li>

                <?php } ?>

                <?php if ($module->enableRegistration) : ?>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                            <span>
                                <i class="ti ti-user-plus"></i>
                            </span>
                            <span class="hide-menu">Register</span>
                        </a>
                    </li>
                <?php endif ?>
            </ul>


            <!--            <div class="unlimited-access hide-menu bg-light-primary position-relative mb-7 mt-5 rounded">
                            <div class="d-flex">
                                <div class="unlimited-access-title me-3">
                                    <h6 class="fw-semibold fs-4 mb-6 text-dark w-85">Upgrade to pro</h6>
                                    <a href="https://adminmart.com/product/modernize-bootstrap-5-admin-template/" target="_blank" class="btn btn-primary fs-2 fw-semibold lh-sm">Buy Pro</a>
                                </div>
                                <div class="unlimited-access-img">
                                    <img src="../assets/images/backgrounds/rocket.png" alt="" class="img-fluid">
                                </div>
                            </div>
                        </div>-->
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>


