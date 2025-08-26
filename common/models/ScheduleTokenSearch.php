<?php

namespace common\models;

use common\service\CacheService;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\ScheduleToken;

/**
 * ScheduleTokenSearch represents the model behind the search form about `common\models\ScheduleToken`.
 */
class ScheduleTokenSearch extends ScheduleToken
{
    public function rules()
    {
        return [
            [['id', 'office_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['token', 'token_interval', 'date_start', 'date_end', 'description',
                'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
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
        $query = ScheduleToken::find()->where(['office_id'=>$officeId])
            ->orderBy('id DESC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'token_interval' => $this->token_interval,
            'date_start' => $this->date_start,
            'date_end' => $this->date_end,
            'description' => $this->description,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'is_deleted' => $this->is_deleted,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'token', $this->token])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
