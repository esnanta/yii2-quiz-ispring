<?php

namespace common\modules\quizresult\classes\question\sequence;

use quizresult\classes\utils\XmlUtils;

class SequenceSurveyAnswer
{
    public $text;

    public $index;
    public $userDefinedPosition;
    public $originalIndex;

    public function initFromXmlNode(DOMElement $node)
    {
        $this->text = XmlUtils::getElementText($node);
    }
}