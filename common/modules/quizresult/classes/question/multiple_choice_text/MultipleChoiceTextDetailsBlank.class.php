<?php

namespace common\modules\quizresult\classes\question\multiple_choice_text;

class MultipleChoiceTextDetailsBlank extends MultipleChoiceTextSurveyDetailsBlank
{
    /**
     * @var int default = -1
     */
    public $correctAnswerIndex = -1;

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        $this->correctAnswerIndex = $node->getAttribute('correctAnswerIndex');
    }
}