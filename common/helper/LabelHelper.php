<?php
namespace common\helper;

use kartik\detail\DetailView;
use Yii;
use yii\helpers\Html;

// TEMPLATE UNIFY V.2.6.3
class LabelHelper {
    public static function getButtonCssPlus(): string
    {
        return 'btn btn-sm btn-success';
    }
    public static function getButtonCssUpdate(): string
    {
        return 'btn btn-sm btn-warning';
    }
    public static function getButtonCssMinus(): string
    {
        return 'btn btn-sm btn-danger';
    }
    public static function getButtonCssPrint(): string
    {
        return 'btn btn-sm btn-info';
    }

    public static function getYes($text): string
    {
        return '<span class="badge bg-primary text-white">'.$text.'</span>';
    }
    public static function getNo($text): string
    {
        return '<span class="badge bg-danger text-white">'.$text.'</span>';
    }
    public static function getDefault($text): string
    {
        return self::getSecondary($text);
    }

    public static function getPrimary($text): string
    {
        return '<span class="badge bg-primary text-white">'.$text.'</span>';
    }
    public static function getSuccess($text): string
    {
        return '<span class="badge bg-success text-white">'.$text.'</span>';
    }
    public static function getDanger($text): string
    {
        return '<span class="badge bg-danger text-white">'.$text.'</span>';
    }
    public static function getWarning($text): string
    {
        return '<span class="badge bg-warning text-white">'.$text.'</span>';
    }
    public static function getSecondary($text): string
    {
        return '<span class="badge bg-secondary text-white">'.$text.'</span>';
    }
    public static function getLight($text): string
    {
        return '<span class="badge bg-light text-black">'.$text.'</span>';
    }
    public static function getDark($text): string
    {
        return '<span class="badge bg-dark text-white">'.$text.'</span>';
    }
    public static function getInfo($text): string
    {
        return '<span class="badge bg-info text-white">'.$text.'</span>';
    }
    public static function getCreateButton($route='create'): string
    {
        return Html::a('<i class="fas fa-plus"></i>',
            [$route],
            ['class' => 'button float-right','style'=>'color:black;padding:0 5px']);
    }

    public static function getUpdateButton($route='create'): string
    {
        return Html::a('<i class="fa fa-pencil"></i>',
            [$route],
            ['class' => 'button float-right','style'=>'color:#ffffff;padding:0 5px']);
    }

    public static function getDetailViewType(): string
    {
        return DetailView::TYPE_DEFAULT;
    }
}