<?php

use yii\helpers\Html;
use yii\helpers\Url;
use kartik\widgets\SideNav;
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
            <a href="<?= Url::to(['site/index'])?>" class="text-nowrap logo-img">
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
                            getMenu('Dashboard', 'fa fa-dashboard'),
                            ['/site/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Quiz Assessment</span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu('Index', 'fa fa-angle-right'),
                            ['/assessment/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu('Detail', 'fa fa-angle-right'),
                            ['/assessment-detail/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>
                    <li class="sidebar-item">
                        <?=
                        Html::a(
                            getMenu('Logout', 'fa fa-sign-out'),
                            ['/site/logout'],
                            ['data-method' => 'POST', 'data-confirm' => "Logout?", 'class' => 'sidebar-link']
                        )
                        ?>
                    </li>
                <?php } else { ?>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>
                    <li class="sidebar-item">
                    <?=
                    Html::a(
                        getMenu('Login', 'fa fa-sign-in'),
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


