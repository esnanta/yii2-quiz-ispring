<?php

namespace common\service;

use common\models\Assessment;
use Yii;

class AssessmentService
{
    public static function getChartByPeriod(
        $officeId, $participantId, $periodId, $subjectId = null): array
    {
        // Retrieve the evaluations for the participant
        $assessments = Assessment::find()
            ->where(['office_id' => $officeId, 'participant_id' => $participantId])
            ->andWhere(['period_id' => $periodId])
            ->orderBy(['id' => SORT_ASC])
            ->limit(12);

        if($subjectId!=null){
            $assessments->andWhere(['subject_id' => $subjectId]);
        }

        $assessments = $assessments->all();

        $categories = [];
        $evaluateScores = [];
        $averageScores = [];

        // Loop through each assessment and gather the required data
        foreach ($assessments as $assessment) {

            $examType = strip_tags($assessment->getOneExamType($assessment->exam_type));
            $subjectTitle = $examType.'-'.$assessment->subject->title;

            $subjectId = $assessment->subject_id;
            $categories[] = $subjectTitle;
            $evaluateScores[] = $assessment->evaluate_score;

            // Retrieve the evaluations for average value
            // DO NOT INVOLVE PARTICIPANT
            $query = Assessment::find()
                ->where(['office_id' => $officeId])
                ->andWhere(['period_id' => $periodId]);

            if ($subjectId !== null) {
                $query->andWhere(['subject_id' => $subjectId]);
            }

            $averageScore = $query->average('evaluate_score');

            $averageScores[] = round($averageScore, 2); // Rounding for better readability

        }

        $series = [
            [
                'name' => Yii::t('app', 'Evaluate Score'),
                'data' => $evaluateScores,
            ],
            [
                'name' => Yii::t('app', 'Average Score'),
                'data' => $averageScores,
            ],
        ];

        return [
            'categories' => $categories,
            'series' => $series,
        ];
    }
}