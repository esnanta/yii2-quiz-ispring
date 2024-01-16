<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\helpers\Url;
use yii\data\ActiveDataProvider;
use yii\widgets\Breadcrumbs;
use frontend\assets\B4UnifyMarketingAsset;

//use common\widgets\Alert;

use backend\models\Office;
use backend\models\Blog;
use backend\models\Theme;
use backend\models\Category;
use backend\models\PageType;
use backend\models\Page;
//use backend\models\SiteLink;

use kartik\social\TwitterPlugin;
use kartik\social\FacebookPlugin;

$this->registerMetaTag(Yii::$app->params['meta_author'], 'meta_author');
$this->registerMetaTag(Yii::$app->params['meta_description'], 'meta_description');
$this->registerMetaTag(Yii::$app->params['meta_keywords'], 'meta_keywords');

$this->registerMetaTag(Yii::$app->params['og_site_name'], 'og_site_name');
$this->registerMetaTag(Yii::$app->params['og_title'], 'og_title');
$this->registerMetaTag(Yii::$app->params['og_description'], 'og_description');
$this->registerMetaTag(Yii::$app->params['og_type'], 'og_type');
$this->registerMetaTag(Yii::$app->params['og_url'], 'og_url');
$this->registerMetaTag(Yii::$app->params['og_image'], 'og_image');
$this->registerMetaTag(Yii::$app->params['og_width'], 'og_width');
$this->registerMetaTag(Yii::$app->params['og_height'], 'og_height');
$this->registerMetaTag(Yii::$app->params['og_updated_time'], 'og_updated_time');

$this->registerMetaTag(Yii::$app->params['twitter_title'], 'twitter_title');
$this->registerMetaTag(Yii::$app->params['twitter_description'], 'twitter_description');
$this->registerMetaTag(Yii::$app->params['twitter_card'], 'twitter_card');
$this->registerMetaTag(Yii::$app->params['twitter_url'], 'twitter_url');
$this->registerMetaTag(Yii::$app->params['twitter_image'], 'twitter_image');

$this->registerMetaTag(Yii::$app->params['googleplus_name'], 'googleplus_name');
$this->registerMetaTag(Yii::$app->params['googleplus_description'], 'googleplus_description');
$this->registerMetaTag(Yii::$app->params['googleplus_image'], 'googleplus_image');

//$office = Office::findOne(1);
//$siteLinks = SiteLink::find()->limit(8)->orderBy(['sequence' => SORT_ASC])->all();
//$categories = Category::find()->orderBy(['sequence' => SORT_ASC])->all();
//$pageTypes = PageType::find()->orderBy(['sequence' => SORT_ASC])->all();
//$timeLine = Category::find()->where(['time_line' => Category::TIME_LINE_YES])->orderBy(['sequence' => SORT_ASC])->one();

$description    = Theme::find()->where(['id'=> Theme::SEO_DESCRIPTION])->one();
$keyword        = Theme::find()->where(['id'=> Theme::SEO_KEYWORDS])->one();

$logo1          = Theme::find()->where(['id'=> Theme::LOGO_FRONTEND_HEADER])->one();
$logo1Url       = str_replace('frontend', 'backend', $logo1->getImageUrl());
$logo1Image     = Html::img($logo1Url, ['class'=>'g-width-95','style' => 'width:200px;height:40px'], ['alt' => 'Logo']);

$logo2          = Theme::find()->where(['id'=> Theme::LOGO_FRONTEND_FOOTER])->one();
$logo2Url       = str_replace('frontend', 'backend', $logo2->getImageUrl());
$logo2Image     = Html::img($logo2Url, ['class'=>'g-width-95', 'style' => 'width:200px;height:40px'], ['alt' => 'Logo']);

B4UnifyMarketingAsset::register($this);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="robots" content="follow" />
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php
        Yii::$app->params['meta_author']['content']         = '@nanta_es | @nanta.es';
        Yii::$app->params['meta_description']['content']    = strip_tags($description->content);
        Yii::$app->params['meta_keywords']['content']       = strip_tags($keyword->content);
        Yii::$app->params['og_site_name']['content']        = Yii::$app->name;
    ?>


    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="main">
   
    <!-- Header -->
    <header id="js-header" class="u-header u-header--sticky-top u-header--toggle-section u-header--change-appearance u-shadow-v19">
        <div class="u-header__section g-bg-white g-transition-0_3">
            <nav class="js-mega-menu navbar navbar-expand-lg g-pa-0">
                <div class="container">
                    <!-- Logo -->
                    
                    <a class="navbar-brand g-pl-15 py-3" href="<?= str_replace('admin/', '', Url::to(['/site/index']))  ?>">
                        <?=$logo1Image;?>
                    </a>
                    <!-- End Logo -->

                    <!-- Responsive Toggle Button -->
                    <button class="navbar-toggler navbar-toggler-right btn g-line-height-1 g-brd-none g-pos-abs g-top-10 g-right-0 g-pa-0 g-mt-2" type="button"
                            aria-label="Toggle navigation"
                            aria-expanded="false"
                            aria-controls="navBar"
                            data-toggle="collapse"
                            data-target="#navBar">
                        <span class="hamburger hamburger--slider g-px-15">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </span>
                    </button>
                    <!-- End Responsive Toggle Button -->

                    <!-- Navigation -->
                    <?= $this->render('_navbar.php');?>
                    <!-- End Navigation -->

                    <!-- Social Icons -->
                    <?php // $this->render('_social_icon.php');?>
                    <!-- End Social Icons -->

                    <div class="col-auto g-hidden-md-down g-pr-0">
                        <div class="g-bg-main g-cursor-pointer g-px-25 g-py-20">
                            <span class="d-block g-color-primary g-font-size-11 mb-1">(0161) 347 8854</span>
                            <span class="d-block g-color-primary"><i class="mr-2 fa fa-phone"></i> Request a Call</span>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- End Header -->
      
    
    <?= Breadcrumbs::widget([
        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
    ]) ?>
    <?php // Alert::widget() ?>
    <?= $content ?>
    
    <!-- Footer -->
    <footer>
        <div class="g-bg-dark">
            <div class="container g-pt-70 g-pb-40">
                <div class="row">
                    <div class="col-6 col-md-3 g-mb-30">
                        <h3 class="h6 g-color-white text-uppercase">About</h3>

                        <!-- Links -->
                        <ul class="list-unstyled mb-0">
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-about-1.html">
                                    About Unify Marketing
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-services-1.html">
                                    Services
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-pricing-1.html">
                                    Pricing Tables
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-hire-us-1.html">
                                    Hire Unify Marketing
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-apply-1.html">
                                    Apply for a Job
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="page-contacts-1.html">
                                    Contacts
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                        </ul>
                        <!-- End Links -->
                    </div>

                    <div class="col-6 col-md-3 g-mb-30">
                        <h3 class="h6 g-color-white text-uppercase">Insiders</h3>

                        <!-- Links -->
                        <ul class="list-unstyled mb-0">
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Insider Information</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Information for Insiders</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Personal Information</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Enterprise Information</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                        </ul>
                        <!-- End Links -->
                    </div>

                    <div class="col-6 col-md-3 g-mb-30">
                        <h3 class="h6 g-color-white text-uppercase">Unify Special</h3>

                        <!-- Links -->
                        <ul class="list-unstyled mb-0">
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Unify Online</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Unify Express</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Unify Finance</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Unify Business</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>Unify Ads</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                        </ul>
                        <!-- End Links -->
                    </div>

                    <div class="col-6 col-md-3 g-mb-30">
                        <!-- Links -->
                        <ul class="list-inline">
                            <li class="list-inline-item mb-1">
                                <a class="u-icon-v2 u-icon-size--xs g-brd-gray-light-v2 g-brd-primary--hover g-color-gray-light-v1 g-color-primary--hover rounded" href="#">
                                    <i class="fa fa-android"></i>
                                </a>
                            </li>
                            <li class="list-inline-item mb-1">
                                <a class="u-icon-v2 u-icon-size--xs g-brd-gray-light-v2 g-brd-primary--hover g-color-gray-light-v1 g-color-primary--hover rounded" href="#">
                                    <i class="fa fa-apple"></i>
                                </a>
                            </li>
                            <li class="list-inline-item mb-1">
                                <a class="u-icon-v2 u-icon-size--xs g-brd-gray-light-v2 g-brd-primary--hover g-color-gray-light-v1 g-color-primary--hover rounded" href="#">
                                    <i class="fa fa-windows"></i>
                                </a>
                            </li>
                        </ul>

                        <ul class="list-unstyled mb-4">
                            <li>
                                <a class="u-link-v6 g-color-text g-color-primary--hover g-font-weight-500 g-text-underline--none--hover g-py-3" href="#">
                                    <span>How to Install Apps</span>
                                    <span class="u-link-v6-arrow g-font-size-18">&rightarrow;</span>
                                </a>
                            </li>
                        </ul>
                        <!-- End Links -->

                        <h3 class="h6 g-color-white text-uppercase">Address</h3>
                        <address class="g-font-size-13 g-color-gray-dark-v3 g-font-weight-600 g-line-height-2 mb-0">470 Lucy Forks,<br>Patriciafurt, YC7B 3UT<br>WY10037, Great Britain</address>
                    </div>
                </div>
            </div>
        </div>

        <div class="g-bg-dark-light-v1">
            <div class="container g-pt-30">
                <div class="row align-items-center">
                    <div class="col-md-4 text-center text-md-left g-mb-30">
                        <!-- Logo -->
                        <a class="g-text-underline--none--hover mr-4" href="<?= str_replace('admin/', '', Url::to(['/site/index']))  ?>">
                            <?=$logo2Image;?>
                        </a>
                        <!-- End Logo -->
                        <p class="d-inline-block align-middle g-font-size-13 mb-0">
                            &copy; nanta.es <?= date('Y') ?> | <?= Yii::powered() ?><br>
                            All Rights Reserved.
                        </p>
                    </div>

                    <div class="col-md-4 g-mb-30">
                        <!-- Social Icons -->
                        <ul class="list-inline text-center mb-0">
                            <li class="list-inline-item">
                                <a class="u-icon-v3 u-icon-size--sm g-color-gray-light-v1 g-color-primary--hover g-bg-transparent g-bg-main--hover rounded" href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a class="u-icon-v3 u-icon-size--sm g-color-gray-light-v1 g-color-primary--hover g-bg-transparent g-bg-main--hover rounded" href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a class="u-icon-v3 u-icon-size--sm g-color-gray-light-v1 g-color-primary--hover g-bg-transparent g-bg-main--hover rounded" href="#"><i class="fa fa-pinterest"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a class="u-icon-v3 u-icon-size--sm g-color-gray-light-v1 g-color-primary--hover g-bg-transparent g-bg-main--hover rounded" href="#"><i class="fa fa-instagram"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a class="u-icon-v3 u-icon-size--sm g-color-gray-light-v1 g-color-primary--hover g-bg-transparent g-bg-main--hover rounded" href="#"><i class="fa fa-youtube"></i></a>
                            </li>
                        </ul>
                        <!-- End Social Icons -->
                    </div>

                    <div class="col-md-4 g-mb-30 text-right">
                        <div class="d-inline-block g-mx-15">
                            <h4 class="g-color-text g-font-size-11 text-left text-uppercase">Email</h4>
                            <a href="#">ombakrinai@gmail.com</a>
                        </div>
                        <div class="d-inline-block g-mx-15">
                            <h4 class="g-color-text g-font-size-11 text-left text-uppercase">Phone</h4>
                            <a href="#">081804292926</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer -->

</div>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
