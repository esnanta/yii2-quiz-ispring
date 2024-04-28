<?php

namespace common\domain;

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
use common\models\Staff;
use common\models\Subject;
use yii\helpers\ArrayHelper;

class DataListUseCase
{
    public static function getOffice(): array
    {
        return ArrayHelper::map(Office::find()
            ->where(['id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getPeriod(): array
    {
        return ArrayHelper::map(Period::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getSubject(): array
    {
        return ArrayHelper::map(Subject::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getRoom(): array
    {
        return ArrayHelper::map(Room::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getGroup(): array
    {
        return ArrayHelper::map(Group::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getSchedule(): array
    {
        return ArrayHelper::map(Schedule::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getAssessment(): array
    {
        return ArrayHelper::map(Assessment::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getParticipant(): array
    {
        return ArrayHelper::map(Participant::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getEmployment(): array
    {
        return ArrayHelper::map(Employment::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getArchive(): array
    {
        return ArrayHelper::map(Archive::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getArchiveCategory(): array
    {
        return ArrayHelper::map(ArchiveCategory::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }

    public static function getStaff(): array
    {
        return ArrayHelper::map(Staff::find()
            ->where(['office_id' => DataIdUseCase::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }
}