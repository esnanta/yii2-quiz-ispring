<?php

namespace common\models;

use common\helper\CacheCloud;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Schedule;

/**
 * common\models\ScheduleSearch represents the model behind the search form about `common\models\Schedule`.
 */
 class ScheduleSearch extends Schedule
{
     /**
      * @var mixed|null
      */


     /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'office_id', 'period_id', 'group_id', 'room_id', 'is_asset','created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'date_start', 'date_end', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $officeId = CacheCloud::getInstance()->getOfficeId();
        $query = Schedule::find()->where(['office_id'=>$officeId])
            ->orderBy('id DESC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'group_id' => $this->group_id,
            'period_id' => $this->period_id,
            'room_id' => $this->room_id,
            'date_start' => $this->date_start,
            'date_end' => $this->date_end,
            'is_asset' => $this->is_asset,
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
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
