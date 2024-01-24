<?php

namespace common\models;

use yii\base\InvalidCallException;
use yii\web\IdentityInterface;

//https://www.yiiframework.com/wiki/2545/using-multiple-models-in-an-identity
final class Identity implements IdentityInterface
{
    const TYPE_PARTICIPANT = 'participant';
    const TYPE_USER = 'user';

    const ALLOWED_TYPES = [self::TYPE_PARTICIPANT, self::TYPE_USER];

    private $_id;
    private $_authkey;
    private $_passwordHash;

    public static function findIdentity($id)
    {
        $parts = explode('-', $id);
        if (\count($parts) !== 2) {
            throw new InvalidCallException('id should be in form of Type-number');
        }
        [$type, $number] = $parts;

        if (!\in_array($type, self::ALLOWED_TYPES, true)) {
            throw new InvalidCallException('Unsupported identity type');
        }

        $model = null;
        switch ($type) {
            case self::TYPE_PARTICIPANT:
                $model = UserParticipant::find()->where(['id' => $number])->one();
                break;
            case self::TYPE_USER:
                $model = User::find()->where(['id' => $number])->one();
                break;
        }

        if ($model === null) {
            return false;
        }

        $identity = new Identity();
        $identity->_id = $id;
        $identity->_authkey = $model->authkey;
        $identity->_passwordHash = $model->password_hash;
        return $identity;
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        $model = UserParticipant::find()->where(['token' => $token])->one();
        if (!$model) {
            $model = User::find()->where(['token' => $token])->one();
        }

        if (!$model) {
            return false;
        }

        if ($model instanceof UserParticipant) {
            $type = self::TYPE_PARTICIPANT;
        } else {
            $type = self::TYPE_USER;
        }

        $identity = new Identity();
        $identity->_id = $type . '-' . $model->id;
        $identity->_authkey = $model->authkey;
        $identity->_passwordHash = $model->password_hash;
        return $identity;
    }

    public function validatePassword($password)
    {
        return password_verify($password, $this->_passwordHash);
    }

    public static function findByUsername($username)
    {
        $model = UserParticipant::find()->where(['username' => $username])->one();
        if (!$model) {
            $model = User::find()->where(['username' => $username])->one();
        }

        if (!$model) {
            return false;
        }

        if ($model instanceof UserParticipant) {
            $type = self::TYPE_PARTICIPANT;
        } else {
            $type = self::TYPE_USER;
        }

        $identity = new Identity();
        $identity->_id = $type . '-' . $model->id;
        $identity->_authkey = $model->authkey;
        $identity->_passwordHash = $model->password_hash;
        return $identity;
    }

    public static function findIdentityByEmail($email)
    {
        $model = UserParticipant::find()->where(['email' => $email])->one();
        if (!$model) {
            $model = User::find()->where(['email' => $email])->one();
        }

        if (!$model) {
            return false;
        }

        if ($model instanceof UserParticipant) {
            $type = self::TYPE_PARTICIPANT;
        } else {
            $type = self::TYPE_USER;
        }

        $identity = new Identity();
        $identity->_id = $type . '-' . $model->id;
        $identity->_authkey = $model->authkey;
        $identity->_passwordHash = $model->password_hash;
        return $identity;
    }

    public function getId()
    {
        return $this->_id;
    }

    public function getAuthKey()
    {
        return $this->_authkey;
    }

    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }
}