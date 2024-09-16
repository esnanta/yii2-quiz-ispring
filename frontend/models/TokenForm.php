<?php

namespace frontend\models;

use common\helper\LabelHelper;
use common\models\Schedule;
use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class TokenForm extends Model
{
    public string $token = 'Unset';
    public bool $is_token_equals = false;

    private string $tokenMessage = '';

    /**
     * {@inheritdoc}
     */
    public function rules(): array
    {
        return [
            [['token'], 'required'],
            [['token'], 'string', 'max' => 6],
            [['is_token_equals'], 'safe'],
        ];
    }

    public function checkTokenToSchedule(Schedule $schedule): bool {
        if($this->token == $schedule->token) {
            $this->is_token_equals = true;
            $this->tokenMessage = LabelHelper::getYes($this->token);
            return true;
        } else {
            $this->is_token_equals = false;
            $invalidMessage = LabelHelper::getNo(Yii::t('app', 'Token Invalid'));
            $token = LabelHelper::getWarning($this->token);
            $this->tokenMessage = $token.' '.$invalidMessage;
            return false;
        }
    }

    public function getCurrentToken(): string {
        return LabelHelper::getYes($this->token);
    }

    public function getStatus(): string {
        if($this->is_token_equals) {
            return LabelHelper::getYes($this->token);
        } else {
            $invalidMessage = LabelHelper::getNo(Yii::t('app', 'Token Invalid'));
            $token = LabelHelper::getWarning($this->token);
            return $token.' '.$invalidMessage;
        }
    }
}
