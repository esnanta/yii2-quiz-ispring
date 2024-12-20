<?php

namespace common\helper;

use onmotion\apexcharts\ApexchartsWidget;
use Yii;

class ApexChartHelper
{
    public static function getTypeLine(): string
    {
        return 'line';
    }

    public static function getTypeRadar(): string
    {
        return 'radar';
    }

    /**
     * Generates a line chart for participant scores.
     *
     * @param array $categories
     * @param array $series
     * @param string $title
     * @return string
     */
    public static function renderParticipantScoreChart
    (
        array  $categories,
        array  $series,
        string $title = 'Participant'
    ): string
    {
        return ApexchartsWidget::widget([
            'type' => 'line', // default area
            'height' => '400', // default 350
            'width' => '100%', // default 100%
            'chartOptions' => [
                'chart' => [
                    'dropShadow' => [
                        'enabled' => true,
                        'color' => '#000',
                        'top' => 18,
                        'left' => 7,
                        'blur' => 10,
                        'opacity' => 0.2
                    ],
                    'toolbar' => [
                        'show' => true,
                        'autoSelected' => 'zoom'
                    ],
                ],
                'dataLabels' => [
                    'enabled' => true,
                ],
                'stroke' => [
                    'curve' => 'smooth'
                ],
                'title' => [
                    'text' => Yii::t('app', $title),
                    'align' => 'left'
                ],
                'grid' => [
                    'borderColor' => '#e7e7e7',
                    'row' => [
                        'colors' => ['#f3f3f3', 'transparent'],
                        'opacity' => 0.5
                    ]
                ],
                'markers' => [
                    'size' => '1'
                ],
                'xaxis' => [
                    'title' => [
                        'text' => Yii::t('app', 'Subject')
                    ],
                    'labels' => [
                        'rotate' => -45,
                        'rotateAlways' => true,
                    ],
                    'categories' => array_values($categories),
                ],
                'yaxis' => [
                    'title' => [
                        'text' => Yii::t('app', 'Score')
                    ],
                    'min' => 0,
                ],
                'legend' => [
                    'position' => 'top',
                    'verticalAlign' => 'bottom',
                    'horizontalAlign' => 'right',
                    'floating' => true,
                    'offsetY' => -25,
                    'offsetX' => -5,
                ],
            ],
            'series' => array_values($series),
        ]);
    }

    /**
     * Generates a radar chart for participant evaluation vs average.
     *
     * @param array $categories
     * @param array $series
     * @param string $title
     * @return string
     */
    public static function renderRadarChart
    (
        array  $categories,
        array  $series,
        string $title = 'Participant Evaluation vs Average'
    ): string
    {
        return ApexchartsWidget::widget([
            'type' => 'radar', // Set the chart type to 'radar'
            'height' => '400', // Set the height of the chart
            'width' => '100%', // Set the width of the chart
            'chartOptions' => [
                'chart' => [
                    'toolbar' => [
                        'show' => true,
                        'autoSelected' => 'zoom'
                    ],
                ],
                'xaxis' => [
                    'categories' => $categories, // Set categories for the radar chart (subjects)
                ],
                'stroke' => [
                    'show' => true,
                    'width' => 2,
                ],
                'fill' => [
                    'opacity' => 0.1, // Set the opacity of the filled area
                ],
                'markers' => [
                    'size' => 4, // Set marker size for points
                ],
                'legend' => [
                    'position' => 'top',
                    'horizontalAlign' => 'center',
                ],
                'title' => [
                    'text' => \Yii::t('app', $title),
                    'align' => 'center',
                ],
            ],
            'series' => $series, // Pass the series data
        ]);
    }
}