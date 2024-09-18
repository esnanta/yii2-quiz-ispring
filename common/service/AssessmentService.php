<?php

namespace common\service;

use common\helper\ApexChartHelper;
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
            'chartType' => ApexChartHelper::getTypeLine()
        ];
    }

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
            $subjectTitle = $examType.'-'.$assessment->subject->title;

            $subjectId = $assessment->subject_id;
            $categories[] = $subjectTitle;
            $evaluateScores[] = $assessment->evaluate_score;

            // Calculate the average score for this subject in the same office
            $averageScore = Assessment::find()
                ->where(['subject_id' => $subjectId, 'office_id' => $officeId])
                ->average('evaluate_score');

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
            'chartType' => ApexChartHelper::getTypeLine()
        ];
    }

    public static function getAssessmentRadar($officeId, $participantId): array
    {
        $assessments = Assessment::find()
            ->where(['office_id' => $officeId, 'participant_id' => $participantId])
            ->orderBy(['id' => SORT_ASC])
            ->limit(12)
            ->all();

        $categories = [];
        $evaluateScores = [];
        $averageScores = [];

        $subjectScores = []; // To store scores by subject

        // Loop through each assessment and gather the required data
        foreach ($assessments as $assessment) {
            $subjectId = $assessment->subject_id;
            $subjectTitle = $assessment->subject->title;

            // If the subject hasn't been added yet, initialize it
            if (!isset($subjectScores[$subjectId])) {
                $subjectScores[$subjectId] = [
                    'title' => $subjectTitle,
                    'total_score' => 0,
                    'count' => 0,
                    'evaluate_score' => $assessment->evaluate_score,
                ];
            }

            // Aggregate scores for the same subject
            $subjectScores[$subjectId]['total_score'] += $assessment->evaluate_score;
            $subjectScores[$subjectId]['count']++;
        }

        // Prepare data for the chart
        foreach ($subjectScores as $subjectId => $subjectData) {
            $categories[] = $subjectData['title']; // Use subject title as category
            $evaluateScores[] = round($subjectData['evaluate_score'], 2); // Evaluated score for the participant

            // Calculate the average score for the subject across all participants in the same office
            $averageScore = Assessment::find()
                ->where(['subject_id' => $subjectId, 'office_id' => $officeId])
                ->average('evaluate_score');

            $averageScores[] = round($averageScore, 2); // Add average score to the array
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
            'chartType' => ApexChartHelper::getTypeRadar()
        ];
    }
}