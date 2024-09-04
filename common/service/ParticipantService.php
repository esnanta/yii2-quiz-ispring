<?php

namespace common\service;

use common\helper\LabelHelper;
use common\models\Participant;
use Yii;

class ParticipantService
{
    public static function checkDuplicate($dataList): array
    {
        $officeId = CacheService::getInstance()->getOfficeId();
        $resultList = [];

        foreach (array_filter($dataList) as $i=>$data){
            if(sizeof($data) > 2){
                $identityNumber = $data[0];
                $participantName = $data[1];

                $model = Participant::find()
                    ->where(['office_id' => $officeId, 'identity_number' => $identityNumber])
                    ->one();

                if ($model !== null) {
                    // Data exists
                    $resultList[] = [
                        'name' => $participantName,
                        'identity_number' => $identityNumber,
                        'status' => LabelHelper::getNo('<i class="fas fa-times"></i>')
                    ];
                } else {
                    // Data does not exist
                    $resultList[] = [
                        'name' => $participantName,
                        'identity_number' => $identityNumber,
                        'status' => LabelHelper::getYes('<i class="fas fa-check"></i>'). ' '.
                            LabelHelper::getYes(Yii::t('app', 'New'))
                    ];
                }
            }
        }
        return $resultList;
    }


    public static function displayDuplicate($duplicateData)
    {
        // Loop through the result and display each item in a Bootstrap table
        if (!empty($duplicateData)) {
            echo '<table class="table table-striped">';
            echo '<thead>';
            echo '<tr>';
            echo '<th>'.Yii::t('app', 'Participant').'</th>';
            echo '<th>'.Yii::t('app', 'Identity Number').'</th>';
            echo '<th>'.Yii::t('app', 'Status').'</th>';
            echo '</tr>';
            echo '</thead>';
            echo '<tbody>';

            foreach ($duplicateData as $data) {
                // Ensure $data is an array with 'name' and 'status' keys
                if (is_array($data) && isset($data['name']) && isset($data['status'])) {
                    echo '<tr>';
                    echo '<td>' . htmlspecialchars($data['name'], ENT_QUOTES, 'UTF-8') . '</td>'; // Participant's name
                    echo '<td>' . $data['identity_number'] . '</td>'; // Status icon HTML
                    echo '<td>' . $data['status'] . '</td>'; // Status icon HTML
                    echo '</tr>';
                } else {
                    // Handle cases where $data is not in the expected format
                    echo '<tr>';
                    echo '<td colspan="2" class="text-danger">Invalid data format</td>';
                    echo '</tr>';
                }
            }

            echo '</tbody>';
            echo '</table>';
        } else {
            echo '<div class="alert alert-info">No data found.</div>';
        }
    }
}