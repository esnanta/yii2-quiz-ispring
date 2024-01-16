<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use backend\models\TestResult;

/**
 * TestResultSearch represents the model behind the search form about `backend\models\TestResult`.
 */
class TestResultSearch extends TestResult
{
    public function rules()
    {
        return [
            [['id', 'office_id'], 'integer'],
            [['test1', 'test2', 'test3'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = TestResult::find();

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

        $query->andFilterWhere(['like', 'test1', $this->test1])
            ->andFilterWhere(['like', 'test2', $this->test2])
            ->andFilterWhere(['like', 'test3', $this->test3]);

        return $dataProvider;
    }
}
