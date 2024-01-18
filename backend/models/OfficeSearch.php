<?php

namespace backend\models;

use common\helper\CacheCloud;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Office;
use kartik\daterange\DateRangeBehavior;

/**
 * OfficeSearch represents the model behind the search form about `backend\models\Office`.
 */
class OfficeSearch extends Office
{
    
    public $date_range;
    public $date_first;
    public $date_last;    
    
    public function behaviors()
    {
        return [
            [
                'class' => DateRangeBehavior::className(),
                'attribute' => 'created_at',
                'dateStartAttribute' => 'date_first',
                'dateEndAttribute' => 'date_last',
            ],          
        ];
    }  
    
    public function rules()
    {
        return [
            [['id', 'office_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'phone_number', 'fax_number', 'email', 'web', 'address', 'latitude', 'longitude', 'facebook', 'google_plus', 'instagram', 'twitter', 'description', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            //TAMBAHAN
            [['date_range'], 'match', 'pattern' => '/^.+\s\-\s.+$/'],
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
        $query = Office::find()->where(['id'=>$officeId]);
        
        if(Yii::$app->user->identity->isAdmin):
            $query = Office::find();
        endif;
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'office_id' => $this->office_id,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'is_deleted' => $this->is_deleted,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'fax_number', $this->fax_number])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'web', $this->web])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'latitude', $this->latitude])
            ->andFilterWhere(['like', 'longitude', $this->longitude])
            ->andFilterWhere(['like', 'facebook', $this->facebook])
            ->andFilterWhere(['like', 'google_plus', $this->google_plus])
            ->andFilterWhere(['like', 'instagram', $this->instagram])
            ->andFilterWhere(['like', 'twitter', $this->twitter])
            ->andFilterWhere(['like', 'description', $this->description]);
        
        if($this->date_first!=null && $this->date_last!=null):
            $query->andFilterWhere(['>=', 'created_at', date(Yii::$app->params['dateSaveFormat'].' 00:00:00', $this->date_first)])
                  ->andFilterWhere(['<', 'created_at', date(Yii::$app->params['dateSaveFormat'].' 23:59:59', $this->date_last)]);  
        endif;
        
        return $dataProvider;
    }
}
