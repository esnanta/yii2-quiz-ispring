<?php
namespace backend\models\reports;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class ExportFuelSales extends Model
{

    public $option_date;
    public $work_shift_id;
    public $staff_id;
    public $warehouse_id;
    public $item_id;
    
    public $date_first;
    public $date_last;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['date_first', 'date_last', 'option_date'], 'required'],
            [['work_shift_id','staff_id','warehouse_id','item_id'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'date_first'        => 'Awal',
            'date_last'         => 'Akhir',
            'option_date'       => 'Tgl',
            
            'work_shift_id'     => Yii::t('app', 'Shift'),
            'staff_id'          => Yii::t('app', 'Staff'),
            'warehouse_id'      => Yii::t('app', 'Warehouse'),
            'item_id'           => Yii::t('app', 'Item'),
        ];
    }
}
