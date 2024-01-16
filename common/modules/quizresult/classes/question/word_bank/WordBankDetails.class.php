<?php

namespace common\modules\quizresult\classes\question\word_bank;

class WordBankDetails extends WordBankSurveyDetails
{
    protected function getWordTagName()
    {
        return 'word';
    }

    protected function createWord()
    {
        return new WordBankDetailsWord();
    }
}