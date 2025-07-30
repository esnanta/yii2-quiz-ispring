<?php

namespace common\models;

use common\service\CacheService;
use yii\data\ActiveDataProvider;

/**
 * ProfileSearch represents the model behind the search form about `common\models\Profile`.
 */
class ProfileSearch extends Profile
{
    public ?string $username = null;

    public function rules()
    {
        return [
            [['user_id', 'office_id', 'group_id', 'user_type', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['name', 'identity_number', 'public_email', 'gravatar_email', 'gravatar_id', 'location', 'website', 'timezone', 'bio', 'asset_name', 'created_at', 'updated_at', 'deleted_at', 'uuid',
                'username'], 'safe'],
        ];
    }

    public function search($params)
    {
        $officeId = CacheService::getInstance()->getOfficeId();
        $query = Profile::find()->where(['office_id'=>$officeId])
            ->orderBy('user_id ASC')
            ->joinWith(['user']);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'user_id' => $this->user_id,
            'office_id' => $this->office_id,
            'group_id' => $this->group_id,
            'user_type' => $this->user_type,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'identity_number', $this->identity_number])
            ->andFilterWhere(['like', 'public_email', $this->public_email])
            ->andFilterWhere(['like', 'gravatar_email', $this->gravatar_email])
            ->andFilterWhere(['like', 'gravatar_id', $this->gravatar_id])
            ->andFilterWhere(['like', 'location', $this->location])
            ->andFilterWhere(['like', 'website', $this->website])
            ->andFilterWhere(['like', 'timezone', $this->timezone])
            ->andFilterWhere(['like', 'bio', $this->bio])
            ->andFilterWhere(['like', 'asset_name', $this->asset_name])
            ->andFilterWhere(['like', 'uuid', $this->uuid])
            ->andFilterWhere(['like', 'tx_user.username', $this->username]); // filter username

        return $dataProvider;
    }
}
