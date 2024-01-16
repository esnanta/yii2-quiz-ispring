<?php

namespace common\modules\quizresult\classes\question\likert_scale;
class LikertScaleMatch
{
    public $statementIndex;
    public $labelIndex;

    public function initFromXmlNode(DOMElement $node)
    {
        $this->statementIndex = $node->getAttribute('statementIndex');
        $this->labelIndex = $node->getAttribute('labelIndex');
    }
}