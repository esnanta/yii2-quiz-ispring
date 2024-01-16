<?php
namespace common\modules\quizresult\includes;

use common\modules\quizresult\classes\Autoloader;

require_once dirname(__FILE__) . '/../classes/Autoloader.class.php';
spl_autoload_register(function ($className) { Autoloader::LoadClassByName($className); });