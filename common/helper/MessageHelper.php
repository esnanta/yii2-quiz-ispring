<?php
namespace common\helper;

use Yii;

class MessageHelper
{
    public static function getFlashAccessDenied()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Access Denied! You do not have permission to access this page.'
            )]
        );
    }

    public static function getFlashDeleteSuccess()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Data has been deleted.'
            )]
        );
    }

    public static function getFlashDeleteFailed()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Failed to delete data.'
            )]
        );
    }
    public static function getFlashDeleteForbidden()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Related data must be deleted first. Delete forbidden.'
            )]
        );
    }

    public static function getFlashSaveSuccess()
    {
        Yii::$app->getSession()->setFlash(
            'success',
            ['message' => Yii::t(
                'app',
                'Data saved successfully.'
            )]
        );
    }
    public static function getFlashSaveFailed()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Failed to save data.'
            )]
        );
    }

    public static function getFlashUpdateSuccess()
    {
        Yii::$app->getSession()->setFlash(
            'success',
            ['message' => Yii::t(
                'app',
                'Update success.'
            )]
        );
    }
    public static function getFlashUpdateFailed()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Update failed.'
            )]
        );
    }
    public static function getFlashAssetNotFound(): void
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Asset not found.'
            )]
        );
    }

    public static function getFlashFeatureDisabled()
    {
        Yii::$app->getSession()->setFlash(
            'warning',
            ['message' => Yii::t(
                'app',
                'This feature has been disabled for security reason.'
            )]
        );
    }
    public static function getFlashCropImage()
    {
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t(
                'app',
                'Crop your image before saving.'
            )]
        );
    }
    public static function getFlashLoginInfo()
    {
        $username = '"Guest"';
        if (Yii::$app->user->getIsGuest()==false) {
            $tmpUsername    = Yii::$app->user->identity->username;
            $roles          = '';
            $authAssignments = AuthAssignment::find()->where(['user_id'=>Yii::$app->user->id])->all();
            foreach ($authAssignments as $authAssignmentModel) {
//                $roles = '<span class="label label-default">'.$authAssignmentModel.'</span>';
            }
            $username = $tmpUsername.', role '.$roles;
        }
        Yii::$app->getSession()->setFlash(
            'danger',
            ['message' => Yii::t('app', 'Login as {username}',['username'=>$username])]
        );
    }


    public static function getTimeElapsedString($_ptime)
    {
        $ptime = strtotime($_ptime);
        $etime = time() - $ptime;
        if ($etime < 1) {
            return 'less than 1 second ago';
        }

        $a = array( 12 * 30 * 24 * 60 * 60  =>  'year',
            30 * 24 * 60 * 60       =>  'month',
            24 * 60 * 60            =>  'day',
            60 * 60                 =>  'hour',
            60                      =>  'minute',
            1                       =>  'second'
        );

        foreach ($a as $secs => $str) {
            $d = $etime / $secs;
            if ($d >= 1) {
                $r = round($d);
                return 'about ' . $r . ' ' . $str . ( $r > 1 ? 's' : '' ) . ' ago';
            }
        }
    }
}