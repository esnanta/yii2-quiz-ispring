<?php

namespace common\helper;

class IconHelper
{
    public static function getFontAwesomeBrands(): array
    {
        return [
            'fa-brands fa-instagram' => 'Instagram',
            'fa-brands fa-twitter' => 'Twitter',
            'fa-brands fa-facebook' => 'Facebook',
            'fa-brands fa-tiktok' => 'Tiktok',
            'fa-brands fa-linkedin' => 'Linkedin',
            'fa-brands fa-github' => 'Github',
            'fa-brands fa-google' => 'Google',
            'fa-brands fa-youtube' => 'youtube',
        ];
    }

    public static function getFontAwesomeBrandValue(string $iconClass): string
    {
        $brands = self::getFontAwesomeBrands();

        return $brands[$iconClass] ?? 'Unknown';
    }

    public static function getHome(): string
    {
        return '<i class="fas fa-home"></i>';
    }
    public static function getGithub(): string
    {
        return '<i class="fab fa-github"></i>';
    }
    public static function getSave(): string
    {
        return '<i class="fas fa-save"></i>';
    }
    public static function getSignIn(): string
    {
        return '<i class="fas fa-sign-in-alt"></i>';
    }
    public static function getChartLine(): string
    {
        return '<i class="fas fa-chart-line"></i>';
    }
    public static function getView(): string
    {
        return '<i class="fas fa-eye"></i>';
    }
    public static function getUpdate(): string
    {
        return '<i class="fas fa-eye"></i>';
    }
    public static function getUser(): string
    {
        return '<i class="fas fa-user"></i>';
    }
}