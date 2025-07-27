<?php

namespace common\service;

class DataIdService
{
    public static function getOfficeId(){
        return CacheService::getInstance()->getOfficeId();
    }
}