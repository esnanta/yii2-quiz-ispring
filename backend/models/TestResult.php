<?php

namespace backend\models;

use Yii;
use \backend\models\base\TestResult as BaseTestResult;

/**
 * This is the model class for table "tx_test_result".
 */
class TestResult extends BaseTestResult
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id'], 'integer'],
            [['test1', 'test2', 'test3'], 'string'],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
