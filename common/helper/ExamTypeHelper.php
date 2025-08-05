<?php

namespace common\helper;

use Yii;

class ExamTypeHelper
{
    public static function getExamTypeQuiz(): int
    {
        return 1;
    }
    public static function getExamTypeMidterm(): int
    {
        return 2;
    }
    public static function getExamTypeFinal(): int
    {
        return 3;
    }
    public static function getExamTypeTryout(): int
    {
        return 4;
    }

    public static function getArrayExamType()
    {
        return [
            self::getExamTypeQuiz() => Yii::t('app', 'Quiz'),
            self::getExamTypeMidterm()  => Yii::t('app', 'Midterm'),
            self::getExamTypeFinal()  => Yii::t('app', 'Final'),
            self::getExamTypeTryout()  => Yii::t('app', 'Tryout'),
        ];
    }

    public static function getOneExamType($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayExamType();

            switch ($_module) {
                case ($_module == self::getExamTypeQuiz()):
                    $returnValue = LabelHelper::getSuccess($arrayModule[$_module]);
                    break;
                case ($_module == self::getExamTypeMidterm()):
                    $returnValue = LabelHelper::getWarning($arrayModule[$_module]);
                    break;
                case ($_module == self::getExamTypeFinal()):
                    $returnValue = LabelHelper::getPrimary($arrayModule[$_module]);
                    break;
                case ($_module == self::getExamTypeTryout()):
                    $returnValue = LabelHelper::getNo($arrayModule[$_module]);
                    break;
                default:
                    $returnValue = LabelHelper::getDefault('-');
            }
            return $returnValue;
        }
        else
            return '-';
    }
}