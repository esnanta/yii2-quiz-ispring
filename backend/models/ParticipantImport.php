<?php

namespace backend\models;

use Yii;
use \backend\models\Participant;

/**
 * This is the model class for table "tx_participant".
 */
class ParticipantImport extends Participant
{
    public $archive_id;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['archive_id', 'group_id'], 'required'],

            [['office_id', 'group_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            //ADD ARCHIVE
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title', 'identity_number'], 'string', 'max' => 100],
            [['username'], 'string', 'max' => 50],
            [['password'], 'string', 'max' => 10],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'archive_id' => Yii::t('app', 'Archive'),
            'office_id' => Yii::t('app', 'Office ID'),
            'group_id' => Yii::t('app', 'Group ID'),
            'title' => Yii::t('app', 'Title'),
            'identity_number' => Yii::t('app', 'Identity Number'),
            'username' => Yii::t('app', 'Username'),
            'password' => Yii::t('app', 'Password'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
	
}
