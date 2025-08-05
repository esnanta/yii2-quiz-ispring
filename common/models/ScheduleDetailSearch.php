<?php

namespace common\models;

use common\service\CacheService;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * ScheduleDetailSearch represents the model behind the search form about `common\models\ScheduleDetail`.
 */
class ScheduleDetailSearch extends ScheduleDetail
{
    public function rules()
    {
        return [
            [['id', 'office_id', 'schedule_id', 'subject_id', 'question_type', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['remark', 'asset_name', 'asset_url', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
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
        $query = ScheduleDetail::find()->where(['office_id'=>$officeId]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'schedule_id' => $this->schedule_id,
            'subject_id' => $this->subject_id,
            'question_type' => $this->question_type,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'is_deleted' => $this->is_deleted,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'remark', $this->remark])
            ->andFilterWhere(['like', 'asset_name', $this->asset_name])
            ->andFilterWhere(['like', 'asset_url', $this->asset_url])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
