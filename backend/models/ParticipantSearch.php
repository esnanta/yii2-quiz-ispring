<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use backend\models\Participant;

/**
 * ParticipantSearch represents the model behind the search form about `backend\models\Participant`.
 */
class ParticipantSearch extends Participant
{
    public function rules()
    {
        return [
            [['id', 'office_id'], 'integer'],
            [['title', 'participant_name', 'password'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Participant::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'participant_name', $this->participant_name])
            ->andFilterWhere(['like', 'password', $this->password]);

        return $dataProvider;
    }
}
