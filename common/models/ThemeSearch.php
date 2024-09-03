<?php

namespace common\models;

use common\service\CacheService;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * ThemeSearch represents the model behind the search form about `common\models\Theme`.
 */
class ThemeSearch extends Theme
{
    public function rules()
    {
        return [
            [['id', 'office_id', 'theme_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'content', 'asset_name', 'description', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
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
        $query = Theme::find()->where(['office_id'=>$officeId]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'theme_type' => $this->theme_type,
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
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'asset_name', $this->asset_name])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
