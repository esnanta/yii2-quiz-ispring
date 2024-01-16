<?php
use yii\helpers\Url;
/** @var yii\web\View $this */

$this->title = Yii::$app->name;
?>
<div class="site-index">
    <div class="p-5 mb-4 bg-transparent rounded-3">
        <div class="container-fluid py-5 text-center">
            <h1 class="display-4">Pertashop!</h1>
            <p class="fs-5 fw-light">Yii2-powered application.</p>
            <p>
                <?php if (Yii::$app->user->isGuest) {?>
                <a class="btn btn-lg btn-success" 
                  href="<?= str_replace('', '', Url::to(['user/login']))  ?>">
                    Sign In
                </a>
                <?php } else { ?>
                
                <a href="<?= str_replace('', '', Url::to(['user/logout']))  ?>" 
                   data-method="post" data-confirm="Logout now?" 
                   class="btn btn-lg btn-danger">
                    Logout
                </a>

                <a class="btn btn-lg btn-success" 
                  href="<?= str_replace('', '', Url::to(['fuel-sales/create']))  ?>">
                    Penjualan
                </a>
                <?php } ?>
            </p>
        </div>
    </div>
</div>
