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
}