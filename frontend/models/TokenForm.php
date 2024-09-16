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
            return true;
        } else {
            return false;
        }
    }

    public function getCurrentTokenStatus(): string {
        if($this->is_token_equals) {
            return LabelHelper::getYes($this->token);
        } else {
            $invalidMessage = LabelHelper::getNo(Yii::t('app', 'Token Invalid'));
            $token = LabelHelper::getWarning($this->token);
            return $token.' '.$invalidMessage;
        }
    }
}
