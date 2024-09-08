<?php

namespace common\service;

use common\models\Assessment;

class AssessmentService
{
    public static function getAssessmentProgress($officeId, $participantId): array
    {
        // Retrieve the evaluations for the participant
        $assessments = Assessment::find()
            ->where(['office_id' => $officeId, 'participant_id' => $participantId])
            ->orderBy(['id' => SORT_ASC])
            ->limit(12)
            ->all();

        $categories = [];
        $evaluateScores = [];
        $averageScores = [];

        // Loop through each assessment and gather the required data
        foreach ($assessments as $assessment) {
            $examType = strip_tags($assessment->getOneExamType($assessment->exam_type));
           // $subjectTitle = $assessment->subject->title.' ('.$examType.')';

            $subjectId = $assessment->subject_id;
            $categories[] = $assessment->subject->title;
            $evaluateScores[] = $assessment->evaluate_score;

            // Calculate the average score for this subject in the same office
            $averageScore = Assessment::find()
                ->where(['subject_id' => $subjectId, 'office_id' => $officeId])
                ->average('evaluate_score');

            $averageScores[] = round($averageScore, 2); // Rounding for better readability
        }

        $series = [
            [
                'name' => 'Evaluate Score',
                'data' => $evaluateScores,
            ],
            [
                'name' => 'Average Score',
                'data' => $averageScores,
            ],
        ];

        return [
            'categories' => $categories,
            'series' => $series,
        ];
    }
}