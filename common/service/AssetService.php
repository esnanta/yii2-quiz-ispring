<?php

namespace common\service;

use Yii;
use yii\base\Exception;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;
use FilesystemIterator;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use ZipArchive;

use common\models\Asset;
use common\models\ScheduleDetail;

class AssetService
{
    /**
     * Upload asset file
     * @param Asset $asset
     * @return UploadedFile|false
     */
    public function uploadAsset(Asset $asset)
    {
        $asset = UploadedFile::getInstance($asset, 'asset');

        if (empty($asset)) {
            return false;
        }

        $pattern = '/[\s\/,.]/';
        $title = preg_replace($pattern, '_', substr($asset->name, 0, strpos($asset->name, ".")));
        $tmp = explode('.', $asset->name);
        $ext = end($tmp);
        $asset->name = $asset->id . '_' . $title . '_' . ".{$ext}";

        return $asset;
    }

    /**
     * Delete asset file from server
     * @param Asset $asset
     * @return bool
     */
    public function deleteAsset(Asset $asset): bool
    {
        $file = $this->getAssetFile($asset);

        if (empty($file) || !file_exists($file)) {
            return false;
        }

        if (!unlink($file)) {
            return false;
        } else {
            $asset->asset_name = null;
            $asset->asset_url = null;
        }

        return true;
    }

    /**
     * Get asset file path
     * @param Asset $asset
     * @return string|null
     */
    public function getAssetFile(Asset $asset): ?string
    {
        $directory = $this->getWebRoot() . $this->getPath($asset);
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($asset->asset_id)) ? $directory . '/' . $asset->asset_id : null;
    }

    /**
     * Extract asset file
     * @param Asset $asset
     * @throws Exception
     */
    public function extract(Asset $asset)
    {
        $fileSource = $this->getAssetFile($asset);
        $extractDir = $this->getExtractDir($asset);

        $zip = new ZipArchive;
        $zip->open($fileSource);
        $zip->extractTo($extractDir);
        $zip->close();
    }

    /**
     * Get extract directory
     * @param Asset $asset
     * @return string|null
     * @throws Exception
     */
    public function getExtractDir(Asset $asset): ?string
    {
        $combinedName = $this->getExtractFolderName($asset);
        $directory = str_replace('backend', 'frontend', Yii::getAlias('@webroot')) . $this->getPath($asset) . '/' . $combinedName;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return $directory;
    }

    /**
     * Remove extract folder recursively
     * @param string $dir
     */
    public function removeExtractFolder(string $dir): void
    {
        $it = new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS);
        $files = new RecursiveIteratorIterator($it, RecursiveIteratorIterator::CHILD_FIRST);
        foreach ($files as $file) {
            if ($file->isDir()) {
                rmdir($file->getPathname());
            } else {
                unlink($file->getPathname());
            }
        }
        rmdir($dir);
    }

    // Utility methods for asset paths
    private function getWebRoot(): string
    {
        return str_replace('frontend', 'backend', Yii::getAlias('@webroot'));
    }

    private function getPath(Asset $asset): string
    {
        $officeUniqueId = $asset->office->unique_id;
        return '/uploads/asset/' . $officeUniqueId;
    }

    private function getExtractFolderName(Asset $asset): string
    {
        $title = str_replace('', '-', $asset->title);
        return $title . '_' . $asset->id;
    }


    public function getExtractUrl(Asset $asset): string
    {
        $indexFile = $this->getPath($asset) . '/' .
            $this->getExtractFolderName($asset).'/index.html';
        return Yii::$app->urlManager->baseUrl . $indexFile;
    }
}