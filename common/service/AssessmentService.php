<?php

namespace common\service;

use common\models\Assessment;

class AssessmentService
{
    public static function getEvaluateScoreAsArray(
        $participantId, $officeId, $subjectId, $isAvg = false): array
    {
        $mainArray = [];
        $assessments = Assessment::find()
            ->where([
                'office_id' => $officeId,
                'participant_id' => $participantId,
                'subject_id' => $subjectId
            ])
            ->distinct('subject_id')
            ->all();

        foreach ($assessments as $assessmentModel) {
            if (!$isAvg) {
                $mainArray[] = $assessmentModel->evaluate_score;
            } else {
                $avgAge = Assessment::find()
                    ->select(['AVG(evaluate_score) AS es'])
                    ->where([
                        'group_id' => $assessmentModel->group_id,
                        'office_id' => $assessmentModel->office_id,
                        'subject_id' => $subjectId
                    ])
                    ->scalar();

                $mainArray[] = $avgAge;
            }
        }
        return $mainArray;
    }

    public static function getSubjectAsArray(
        $participantId, $officeId, $subjectId): array
    {
        $mainArray = [];
//        $assessments = Assessment::find()
//            ->where([
//                'office_id' => $officeId,
//                'participant_id' => $participantId,
//                'subject_id' => $subjectId
//            ])
//            ->distinct('subject_id')
//            ->all();
//
//        foreach ($assessments as $assessmentModel) {
//            $mainArray[] = $assessmentModel->subject->title;
//        }
        return $mainArray;
    }

    public static function getAssessments(
        $officeId, $participantId, $subjectId): array|\yii\db\ActiveRecord|null
    {
        return Assessment::find()
            ->where([
                'office_id' => $officeId,
                'participant_id' => $participantId,
                'subject_id' => $subjectId
            ])
            //->distinct('subject_id')
            ->one();
    }
}