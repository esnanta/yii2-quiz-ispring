<?php

namespace backend\models;

use common\helper\CacheCloud;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use backend\models\Staff;

/**
 * StaffSearch represents the model behind the search form about `backend\models\Staff`.
 */
class StaffSearch extends Staff
{
    public function rules()
    {
        return [
            [['id', 'user_id', 'office_id', 'employment_id', 'gender_status', 'active_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'initial', 'identity_number', 'phone_number', 'address', 'asset_name', 'email', 'description', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $officeId = CacheCloud::getInstance()->getOfficeId();
        $query = Staff::find()->where(['office_id'=>$officeId]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'office_id' => $this->office_id,
            'employment_id' => $this->employment_id,
            'gender_status' => $this->gender_status,
            'active_status' => $this->active_status,
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
            ->andFilterWhere(['like', 'initial', $this->initial])
            ->andFilterWhere(['like', 'identity_number', $this->identity_number])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'asset_name', $this->asset_name])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
