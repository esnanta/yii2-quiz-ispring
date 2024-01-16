<?php

namespace common\modules\quizresult\classes\question\multiple_choice_text;

class MultipleChoiceTextDetails extends MultipleChoiceTextSurveyDetails
{
    protected function createBlank()
    {
        return new MultipleChoiceTextDetailsBlank();
    }
}