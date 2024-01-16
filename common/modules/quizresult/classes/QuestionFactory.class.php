<?php

namespace common\modules\quizresult\classes;

use IQuestion;
use quizresult\classes\question\drag_n_drop\DragAndDropQuestion;
use quizresult\classes\question\essay\EssayQuestion;
use quizresult\classes\question\fill_in_the_blank\FillInTheBlankQuestion;
use quizresult\classes\question\fill_in_the_blank\FillInTheBlankSurveyQuestion;
use quizresult\classes\question\hotspot\HotspotQuestion;
use quizresult\classes\question\likert_scale\LikertScaleQuestion;
use quizresult\classes\question\matching\MatchingQuestion;
use quizresult\classes\question\matching\MatchingSurveyQuestion;
use quizresult\classes\question\multiple_choice\MultipleChoiceQuestion;
use quizresult\classes\question\multiple_choice\MultipleChoiceSurveyQuestion;
use quizresult\classes\question\multiple_choice_text\MultipleChoiceTextQuestion;
use quizresult\classes\question\multiple_choice_text\MultipleChoiceTextSurveyQuestion;
use quizresult\classes\question\multiple_response\MultipleResponseQuestion;
use quizresult\classes\question\multiple_response\MultipleResponseSurveyQuestion;
use quizresult\classes\question\numeric\NumericQuestion;
use quizresult\classes\question\numeric\NumericSurveyQuestion;
use quizresult\classes\question\QuestionType;
use quizresult\classes\question\sequence\SequenceQuestion;
use quizresult\classes\question\sequence\SequenceSurveyQuestion;
use quizresult\classes\question\true_false\TrueFalseQuestion;
use quizresult\classes\question\true_false\TrueFalseSurveyQuestion;
use quizresult\classes\question\type_in\TypeInQuestion;
use quizresult\classes\question\type_in\TypeInSurveyQuestion;
use quizresult\classes\question\word_bank\WordBankQuestion;
use quizresult\classes\question\word_bank\WordBankSurveyQuestion;
use quizresult\classes\utils\Version;

class QuestionFactory
{
    const TYPE_IN_RENAMED_IN_VERSION = '9.0';

    /**
     * @param DOMElement $questionNode
     * @param string $version
     * @return IQuestion|null
     */
    public static function CreateFromXmlNode(DOMElement $questionNode, $version)
    {
        $question = null;

        switch ($questionNode->nodeName) {
            case QuestionType::TRUE_FALSE:
                $question = new TrueFalseQuestion();
                break;
            case QuestionType::MULTIPLE_CHOICE:
                $question = new MultipleChoiceQuestion();
                break;
            case QuestionType::MULTIPLE_RESPOSE:
                $question = new MultipleResponseQuestion();
                break;
            case QuestionType::SEQUENCE:
                $question = new SequenceQuestion();
                break;
            case QuestionType::FILL_IN_THE_BLANK:
                $question = new FillInTheBlankQuestion();
                break;
            case QuestionType::LEGACY_TYPE_IN_OR_NEW_FILL_IN_THE_BLANK:
                if (Version::IsVersionOlderThan($version, self::TYPE_IN_RENAMED_IN_VERSION)) {
                    $question = new TypeInQuestion();
                } else {
                    $question = new FillInTheBlankQuestion();
                }
                break;
            case QuestionType::TYPE_IN:
                $question = new TypeInQuestion();
                break;
            case QuestionType::MATCHING:
                $question = new MatchingQuestion();
                break;
            case QuestionType::NUMERIC:
                $question = new NumericQuestion();
                break;
            case QuestionType::MULTIPLE_CHOICE_TEXT:
                $question = new MultipleChoiceTextQuestion();
                break;
            case QuestionType::WORD_BANK:
                $question = new WordBankQuestion();
                break;
            case QuestionType::ESSAY:
                $question = new EssayQuestion();
                break;
            case QuestionType::HOTSPOT:
                $question = new HotspotQuestion();
                break;
            case QuestionType::YES_NO:
                $question = new TrueFalseSurveyQuestion();
                break;
            case QuestionType::PICK_ONE:
                $question = new MultipleChoiceSurveyQuestion();
                break;
            case QuestionType::PICK_MANY:
                $question = new MultipleResponseSurveyQuestion();
                break;
            case QuestionType::SHORT_ANSWER:
                $question = new TypeInSurveyQuestion();
                break;
            case QuestionType::RANKING:
                $question = new SequenceSurveyQuestion();
                break;
            case QuestionType::NUMERIC_SURVEY:
                $question = new NumericSurveyQuestion();
                break;
            case QuestionType::MATCHING_SURVEY:
                $question = new MatchingSurveyQuestion();
                break;
            case QuestionType::WHICH_WORD:
                $question = new WordBankSurveyQuestion();
                break;
            case QuestionType::LIKERT_SCALE:
                $question = new LikertScaleQuestion();
                break;
            case QuestionType::MULTIPLE_CHOICE_TEXT_SURVEY:
                $question = new MultipleChoiceTextSurveyQuestion();
                break;
            case QuestionType::FILL_IN_THE_BLANK_SURVEY:
                $question = new FillInTheBlankSurveyQuestion();
                break;
            case QuestionType::DRAG_AND_DROP_QUESTION:
                $question = new DragAndDropQuestion();
                break;
        }

        if ($question != null) {
            $question->initFromXmlNode($questionNode);
        }

        return $question;
    }
}