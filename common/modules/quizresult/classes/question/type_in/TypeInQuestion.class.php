<?php

namespace common\modules\quizresult\classes\question\type_in;

class TypeInQuestion extends TypeInSurveyQuestion
{
    public function isGradedByDefault()
    {
        return true;
    }

    public function initFromXmlNode(DOMElement $node)
    {
        parent::initFromXmlNode($node);

        $answersNode = $node->getElementsByTagName('acceptableAnswers')->item(0);
        $answersList = $answersNode ? $answersNode->getElementsByTagName('answer') : [];
        for ($i = 0; $i < $answersList->length; ++$i) {
            $answerNode = $answersList->item($i);
            if ($this->correctAnswer != '') {
                $this->correctAnswer .= '; ';
            }
            $this->correctAnswer .= trim($answerNode->textContent);
        }
    }
}