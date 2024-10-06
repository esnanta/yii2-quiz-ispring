<?php

namespace common\service;

use common\models\Assessment;
use common\models\Asset;
use common\models\AssetCategory;
use common\models\Employment;
use common\models\Group;
use common\models\Office;
use common\models\Page;
use common\models\Participant;
use common\models\Period;
use common\models\Room;
use common\models\Schedule;
use common\models\Staff;
use common\models\Subject;
use yii\helpers\ArrayHelper;

class DataListService
{
    public static function getOffice(): array
    {
        return ArrayHelper::map(Office::find()
            ->where(['id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getPeriod(): array
    {
        return ArrayHelper::map(Period::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }
    public static function getPeriodActive(): array
    {
        return ArrayHelper::map(Period::find()
            ->where(['office_id' => DataIdService::getOfficeId(),'is_active' => Period::IS_ACTIVE_YES])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getSubject(): array
    {
        return ArrayHelper::map(Subject::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getRoom(): array
    {
        return ArrayHelper::map(Room::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getGroup(): array
    {
        return ArrayHelper::map(Group::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getSchedule(): array
    {
        return ArrayHelper::map(Schedule::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getAssessment(): array
    {
        return ArrayHelper::map(Assessment::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getParticipant(): array
    {
        return ArrayHelper::map(Participant::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getEmployment(): array
    {
        return ArrayHelper::map(Employment::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getAsset(): array
    {
        return ArrayHelper::map(Asset::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getAssetCompression($limit=50): array
    {
        return ArrayHelper::map(Asset::find()
            ->where(['office_id' => DataIdService::getOfficeId(),'asset_type'=>Asset::ASSET_TYPE_COMPRESSION])
            ->orderBy('id DESC')
            ->limit($limit)
            ->asArray()->all(), 'id', 'title');
    }

    public static function getAssetCategory(): array
    {
        return ArrayHelper::map(AssetCategory::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getStaff(): array
    {
        return ArrayHelper::map(Staff::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getPage(): array
    {
        return ArrayHelper::map(Page::find()
            ->asArray()->all(), 'id', 'title');
    }
}