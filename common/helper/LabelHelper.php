<?php
namespace common\helper;

use Yii;

// TEMPLATE UNIFY V.2.6.3
class LabelHelper {
    public static function getButtonCssPlus(): string
    {
        return 'btn btn-success';
    }
    public static function getButtonCssMinus(): string
    {
        return 'btn btn-danger';
    }
    public static function getButtonCssPrint(): string
    {
        return 'btn btn-info';
    }

    public static function getIsProcessedPending($text): string
    {
        return '<span class="u-label g-bg-lightred g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }

    public static function getIsProcessedDone($text): string
    {
        return '<span class="u-label g-bg-blue g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }


    public static function getAccountTypeAsset($text): string
    {
        return '<span class="u-label g-bg-brown g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getAccountTypeLiability($text): string
    {
        return '<span class="u-label g-bg-pink g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getAccountTypeEquity($text): string
    {
        return '<span class="u-label g-bg-purple g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getAccountTypeRevenue($text): string
    {
        return '<span class="u-label g-bg-indigo g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
    }
    public static function getAccountTypeExpense($text): string
    {
        return '<span class="u-label g-bg-lightred g-rounded-3 g-mr-10 g-mb-15">'.$text.'</span>';
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