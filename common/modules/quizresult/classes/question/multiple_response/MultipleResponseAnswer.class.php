<?php

namespace common\modules\quizresult\classes\question\multiple_response;

class MultipleResponseAnswer extends MultipleResponseSurveyAnswer
{
    public $correct;

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        $this->correct = $node->getAttribute('correct') == 'true';
    }
}