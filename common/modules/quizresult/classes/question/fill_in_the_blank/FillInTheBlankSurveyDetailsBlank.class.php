<?php

namespace common\modules\quizresult\classes\question\fill_in_the_blank;

use quizresult\classes\question\AnswersCollection;

class FillInTheBlankSurveyDetailsBlank extends AnswersCollection
{
    public $userAnswer;

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        $this->userAnswer = trim($node->getAttribute('userAnswer'));
    }
}