<?php

namespace common\modules\quizresult\classes\question\numeric;

use quizresult\classes\question\Question;

class NumericSurveyQuestion extends Question
{
    public function isGradedByDefault()
    {
        return false;
    }

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        if ($node->hasAttribute('userAnswer')) {
            $this->userAnswer = $node->getAttribute('userAnswer');
        }
    }
}