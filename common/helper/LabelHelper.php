<?php
namespace common\helper;

use Yii;

// TEMPLATE UNIFY V.2.6.3
class LabelHelper {
    public static function getButtonCssPlus(): string
    {
        return 'btn btn-success';
    }
    public static function getButtonCssUpdate(): string
    {
        return 'btn btn-warning';
    }
    public static function getButtonCssMinus(): string
    {
        return 'btn btn-danger';
    }
    public static function getButtonCssPrint(): string
    {
        return 'btn btn-info';
    }
    
    public static function getArchiveTypeDocument($text): string
    {
        return '<span class="u-label g-bg-brown g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getArchiveTypeSpreadsheet($text): string
    {
        return '<span class="u-label g-bg-pink g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getArchiveTypeImage($text): string
    {
        return '<span class="u-label g-bg-purple g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getArchiveTypeCompression($text): string
    {
        return '<span class="u-label g-bg-indigo g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }


    public static function getYes($text): string
    {
        return '<span class="u-label g-bg-purple g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getNo($text): string
    {
        return '<span class="u-label g-bg-indigo g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getDefault($text): string
    {
        return '<span class="u-label g-bg-yellow g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }

}