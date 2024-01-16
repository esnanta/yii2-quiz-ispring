<?php

namespace common\modules\quizresult\classes\question\fill_in_the_blank;

class FillInTheBlankDetails extends FillInTheBlankSurveyDetails
{
    protected function createBlank()
    {
        return new FillInTheBlankDetailsBlank();
    }
}