<?php

namespace common\domain;

use common\helper\CacheCloud;

class DataIdUseCase
{
    public static function getOfficeId(){
        return CacheCloud::getInstance()->getOfficeId();
    }
}