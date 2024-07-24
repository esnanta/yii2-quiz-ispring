<?php

namespace common\domain;

class DataIdUseCase
{
    public static function getOfficeId(){
        return CacheUseCase::getInstance()->getOfficeId();
    }
}