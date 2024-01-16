<?php

namespace common\modules\quizresult\classes\quiz_taker_info;
class QuizTakerInfoField
{
    private $title;
    private $value;

    public function __construct($title, $value)
    {
        $this->title = $title;
        $this->value = $value;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function getValue()
    {
        return $this->value;
    }
}