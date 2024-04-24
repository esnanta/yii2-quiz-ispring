<?php

namespace common\models;

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
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user) {
                $this->addError($attribute, 'Check if user is online.');
            }
            elseif (!$user->validatePassword($this->password)){
                $this->addError($attribute, 'Incorrect username or password.');
            }
            else{

                $user->status = Participant::STATUS_ACTIVE;
                $user->last_login_at = date(Yii::$app->params['datetimeSaveFormat']);
                $user->generateAuthKey();
                $user->save();
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
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
            $this->_user = UserParticipant::findByUsername($this->username, Participant::STATUS_INACTIVE);
        }
        return $this->_user;
    }
}
