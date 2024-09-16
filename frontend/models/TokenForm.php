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
    public string $token = '';
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
            $this->is_token_equals = false;
            return false;
        }
    }

    public function getCurrentToken(): string {
        return LabelHelper::getYes($this->token);
    }

    public function getStatus(bool $isParticipantSubmitted): string {
        if($isParticipantSubmitted){
            return LabelHelper::getDefault('<i class="fas fa-check-circle"></i>');
        }

        if($this->is_token_equals) {
            return LabelHelper::getYes($this->token);
        } else {
            return LabelHelper::getNo(Yii::t('app', 'Token Invalid'));
        }
    }
}
