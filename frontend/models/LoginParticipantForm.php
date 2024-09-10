<?php

namespace frontend\models;

use common\models\Participant;
use common\models\Schedule;
use common\models\UserParticipant;
use Yii;
use yii\base\Model;
use yii\base\NotSupportedException;

/**
 * Login form
 */
class LoginParticipantForm extends Model
{
    public $username;
    public $password;
    public $token;
    public $rememberMe = true;

    private $_user;


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
            //['token', 'validateToken'],
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     * @throws NotSupportedException
     */
    public function validatePassword($attribute, $params): void
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if(!$user){
                $this->addError($attribute, Yii::t('app', 'Unregistered user'));
            } elseif ($user->status==Participant::STATUS_ACTIVE) {
                $this->addError($attribute, Yii::t('app', 'User is active'));
            } elseif (!$user->validatePassword($this->password)) {
                $this->addError($attribute, Yii::t('app', 'Incorrect username or password'));
            } else {

                $user->status = Participant::STATUS_ACTIVE;
                $user->last_login_at = date(Yii::$app->params['datetimeSaveFormat']);
                $user->generateAuthKey();
                $user->save();
            }
        }
    }

    /**
     * @throws NotSupportedException
     */
//    public function validateToken($attribute, $params): void
//    {
//        if (!$this->hasErrors()) {
//            // Check if token is present
//            if (empty($this->token)) {
//                $this->addError($attribute, Yii::t('app', 'Token is required'));
//                return;
//            }
//
//            // Replace with your actual validation logic
//            if (!$this->verifyToken($this->token)) {
//                $this->addError($attribute, Yii::t('app', 'Invalid token'));
//            }
//        }
//    }

    /**
     * @throws NotSupportedException
     */
//    private function verifyToken($token): bool
//    {
//        if ($this->_user === null) {
//            $this->_user = $this->getUser();
//        }
//
//        $schedule = Schedule::findOne(['office_id' => $this->_user->office_id, 'token' => $token]);
//        if ($schedule === null) {
//            return false;
//        } else {
//            return true;
//        }
//    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return bool whether the user is logged in successfully
     * @throws NotSupportedException
     */
    public function login()
    {
        if ($this->validate()) {
            // Check if token validation passed before login
            if (!$this->hasErrors()) {
                return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
            }
        }
        return false;
    }

    /**
     * Finds user by [[username]]
     *
     * @return UserParticipant
     * @throws NotSupportedException
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = UserParticipant::findByUsername($this->username);
        }
        return $this->_user;
    }

}
