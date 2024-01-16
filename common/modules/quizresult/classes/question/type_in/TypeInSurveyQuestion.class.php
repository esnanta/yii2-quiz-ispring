<?php

namespace common\modules\quizresult\classes\question\type_in;

use quizresult\classes\question\Question;

class TypeInSurveyQuestion extends Question
{
    public function isGradedByDefault()
    {
        return false;
    }

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        if ($node->hasAttribute('userAnswer')) {
            $this->userAnswer = trim($node->getAttribute('userAnswer'));
        }
    }
}