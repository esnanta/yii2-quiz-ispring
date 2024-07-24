<?php

namespace frontend\models;

use common\models\Assessment;
use common\models\AssessmentSearch as BaseAssessmentDetailSearch;
use yii\data\ActiveDataProvider;

/**
 * AssessmentDetailSearch represents the model behind the search form about `common\models\AssessmentDetail`.
 */
class AssessmentSearch extends BaseAssessmentDetailSearch
{
    public function search($params)
    {
        $query = Assessment::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'assessment_id' => $this->assessment_id,
            'subject_id' => $this->subject_id,
            'participant_id' => $this->participant_id,
            'earned_points' => $this->earned_points,
            'passing_score' => $this->passing_score,
            'passing_score_percent' => $this->passing_score_percent,
            'gained_score' => $this->gained_score,
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
