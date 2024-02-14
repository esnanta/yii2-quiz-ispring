<?php

namespace common\domain;

use common\helper\CacheCloud;
use common\models\Archive;
use common\models\ArchiveCategory;
use common\models\Assessment;
use common\models\Employment;
use common\models\Group;
use common\models\Office;
use common\models\Participant;
use common\models\Period;
use common\models\Room;
use common\models\Schedule;
use common\models\Subject;
use yii\helpers\ArrayHelper;

class DataIdUseCase
{
    public static function getOfficeId(){
        return CacheCloud::getInstance()->getOfficeId();
    }
}