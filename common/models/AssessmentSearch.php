<?php

namespace common\models;

use common\helper\CacheCloud;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\Assessment;

/**
 * AssessmentDetailSearch represents the model behind the search form about `common\models\AssessmentDetail`.
 */
class AssessmentSearch extends Assessment
{
    public function rules()
    {
        return [
            [['id', 'office_id', 'schedule_id','schedule_detail_id','participant_id', 'period_id','subject_id', 'subject_type', 'is_completed','created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['app_version', 'quiz_title', 'quiz_type', 'username', 'time_limit', 'used_time', 'time_spent', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
            [['earned_points', 'passing_score', 'passing_score_percent', 'gained_score', 'evaluate_score'], 'number'],
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
        $query = Assessment::find()->where(['office_id'=>$officeId]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'period_id' => $this->period_id,
            'schedule_id' => $this->schedule_id,
            'schedule_detail_id' => $this->schedule_detail_id,
            'subject_id' => $this->subject_id,
            'subject_type' => $this->subject_type,
            'participant_id' => $this->participant_id,
            'is_completed' => $this->is_completed,
            'earned_points' => $this->earned_points,
            'passing_score' => $this->passing_score,
            'passing_score_percent' => $this->passing_score_percent,
            'gained_score' => $this->gained_score,
            'evaluate_score' => $this->evaluate_score,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'is_deleted' => $this->is_deleted,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'app_version', $this->app_version])
            ->andFilterWhere(['like', 'quiz_title', $this->quiz_title])
            ->andFilterWhere(['like', 'quiz_type', $this->quiz_type])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'time_limit', $this->time_limit])
            ->andFilterWhere(['like', 'used_time', $this->used_time])
            ->andFilterWhere(['like', 'time_spent', $this->time_spent])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
