<?php

namespace backend\models;

use Yii;
use \backend\models\base\Participant as BaseParticipant;

/**
 * This is the model class for table "tx_participant".
 */
class Participant extends BaseParticipant
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id'], 'integer'],
            [['title'], 'string', 'max' => 15],
            [['participant_name'], 'string', 'max' => 100],
            [['password'], 'string', 'max' => 10],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
