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
        return '<i class="fas fa-pencil-alt"></i>';
    }
    public static function getUser(): string
    {
        return '<i class="fas fa-user"></i>';
    }

    public static function getReset(): string
    {
        return '<i class="fas fa-sync"></i>';
    }
    public static function getImport(): string
    {
        return '<i class="fas fa-file-import"></i>';
    }
    public static function getDownload(): string
    {
        return '<i class="fas fa-download"></i>';
    }
    public static function getAdd(): string
    {
        return '<i class="fas fa-plus"></i>';
    }
    public static function getDelete(): string
    {
        return '<i class="fas fa-trash"></i>';
    }
    public static function getUpload(): string
    {
        return '<i class="fas fa-upload"></i>';
    }
    public static function getArrowRight(): string
    {
        return '<i class="fas fa-arrow-circle-right"></i>';
    }
    public static function getArchive(): string
    {
        return '<i class="far fa-file-archive"></i>';
    }
    public static function getExclamation(): string
    {
        return '<i class="fas fa-exclamation-circle"></i>';
    }
    public static function getCheck(): string
    {
        return '<i class="fas fa-check"></i>';
    }
    public static function getFile(): string
    {
        return '<i class="fas fa-file"></i>';
    }
    public static function getPower(): string
    {
        return '<i class="fas fa-power-off"></i>';
    }
    public static function getSignOut(): string
    {
        return '<i class="fas fa-sign-out-alt"></i>';
    }
    public static function getGlobe(): string
    {
        return '<i class="fas fa-globe"></i>';
    }
	    public static function getClipboard(): string
    {
        return '<i class="fas fa-copy"></i>';
    }
}