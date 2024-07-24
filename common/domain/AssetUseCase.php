<?php

namespace common\domain;

use Yii;
use yii\base\Exception;
use yii\helpers\FileHelper;

class AssetUseCase
{
    /**
     * @throws Exception
     */
    public static function createBackendDirectory($path): string
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $path;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return $directory;
    }

    public static function getFileUrl($path,$fileName): string
    {
        // return a default image placeholder if your source avatar is not found
        return isset($fileName) ?
            Yii::$app->urlManager->baseUrl .$path.'/'.$fileName :
            Yii::$app->urlManager->baseUrl .'/images/no-picture-available-icon-1.jpg';
    }

    /**
     * @throws Exception
     */
    public static function getFile($path, $fileName): string
    {
        $directory = self::createBackendDirectory($path);
        return (!empty($fileName)) ? $directory.'/'. $fileName : '';
    }

    public static function deleteFile($file): bool
    {
        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }
        else{
            // check if uploaded file can be deleted on server
            if (!unlink($file)) {
                return false;
            }
            // can delete
            else{
                return true;
            }
        }

    }
}