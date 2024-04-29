<?php
namespace common\helper;

use Yii;

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
    
    public static function getArchiveTypeDocument($text): string
    {
        return '<span class="badge bg-primary text-white">'.$text.'</span>';
    }
    public static function getArchiveTypeSpreadsheet($text): string
    {
        return '<span class="badge bg-success text-white">'.$text.'</span>';
    }
    public static function getArchiveTypeImage($text): string
    {
        return '<span class="badge bg-secondary text-white">'.$text.'</span>';
    }
    public static function getArchiveTypeCompression($text): string
    {
        return '<span class="badge bg-danger text-white">'.$text.'</span>';
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
        return '<span class="badge bg-secondary text-white">'.$text.'</span>';
    }
}