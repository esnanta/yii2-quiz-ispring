<?php
use yii\helpers\Url;
use yii\helpers\Html;
?>

<div id="navBar" class="collapse navbar-collapse align-items-center flex-sm-row">
    <ul class="navbar-nav ml-auto g-pb-30 g-pb-0--lg">
        <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
            <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" 
               href="<?= str_replace('admin/', '', Url::to(['/site/index'])) ?>">
                Home
            </a>
        </li>

        <!-- About - Submenu -->
<!--        <li class="nav-item hs-has-sub-menu g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
            <a id="nav-link--page" class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" href="#"
               aria-haspopup="true"
               aria-expanded="false"
               aria-controls="nav-submenu--page">
                About
            </a>

             Submenu 
            <ul id="nav-submenu--page" class="hs-sub-menu list-unstyled u-shadow-v11 g-min-width-220 g-mt-18"
                aria-labelledby="nav-link--page">
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-about-1.html">About</a>
                </li>
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-services-1.html">Services</a>
                </li>
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-consultants-1.html">Consultants</a>
                </li>
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-works-1.html">Works</a>
                </li>
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-hire-us-1.html">Hire Us</a>
                </li>
                <li class="dropdown-item">
                    <a class="nav-link g-color-text g-font-weight-600" href="page-careers-1.html">Careers</a>
                </li>
            </ul>
             End Submenu 
        </li>
         End About - Submenu 

        <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
            <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" href="page-help-1.html">
                Help
            </a>
        </li>
        <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
            <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" href="page-pricing-1.html">
                Pricing
            </a>
        </li>
        <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
            <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" href="page-contacts-1.html">
                Contacts
            </a>
        </li>-->

        <?php if(!Yii::$app->user->isGuest) { ?>
            <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
                <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" 
                   href="<?= str_replace('', '', Url::to(['admin/site/index'])) ?>">Dashboard
                </a>
            </li>
            
            <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
                <?=
                    Html::a(
                            'Logout',
                            ['user/security/logout'],
                            ['data-method' => 'post',
                                'data-confirm' => 'Logout now?',
                                'class' => 'nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10',
                                'title' => 'Logout']
                    );
                ?>
            </li>
        <?php } else { ?>
            <li class="nav-item g-mx-15 g-mx-3--lg g-mb-5 g-mb-0--lg">
                <a class="nav-link rounded g-color-primary--hover g-bg-transparent g-bg-main--hover g-font-weight-600 g-font-size-15 g-px-14 g-py-10" 
                   href="<?= str_replace('user/user/', '', Url::to(['admin/site/index']))  ?>">
                    Login
                </a>
            </li>
        <?php } ?>
    </ul>
</div>