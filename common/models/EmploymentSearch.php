<?php

namespace common\models;

use common\service\CacheService;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * EmploymentSearch represents the model behind the search form about `common\models\Employment`.
 */
class EmploymentSearch extends Employment
{
    public function rules()
    {
        return [
            [['id', 'office_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'description', 'sequence', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $officeId = CacheService::getInstance()->getOfficeId();
        $query = Employment::find()->where(['office_id'=>$officeId]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'is_deleted' => $this->is_deleted,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'sequence', $this->sequence]);

        return $dataProvider;
    }
}
