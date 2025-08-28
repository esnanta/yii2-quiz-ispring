<?php

namespace common\service;

use common\helper\DateHelper;
use common\helper\LabelHelper;
use common\models\Profile;
use common\models\Schedule;
use common\models\User;
use Yii;

class UserService
{
    protected static bool $is_all_data_existed = true;

    /**
     * Create a new user with profile
     *
     * @param array $userData User data array with keys: username, email, name, office_id, group_id
     * @param string|null $plainPassword Optional plain password, if null will generate random
     * @param int $userType User type constant from Profile class
     * @return array ['success' => bool, 'user' => User|null, 'profile' => Profile|null, 'password' => string|null, 'errors' => array]
     */
    public function createUser(array $userData, string $plainPassword = null, int $userType = Profile::USER_TYPE_REGULAR): array
    {
        $transaction = Yii::$app->db->beginTransaction();

        try {
            // Generate password if not provided
            if (empty($plainPassword)) {
                $plainPassword = substr(str_shuffle(MD5(microtime())), 0, 8);
            }

            // Check if user already exists
            $existingUser = User::find()
                ->where(['username' => $userData['username']])
                ->orWhere(['email' => $userData['email']])
                ->one();

            if ($existingUser) {
                return [
                    'success' => false,
                    'user' => null,
                    'profile' => null,
                    'password' => null,
                    'errors' => ['User with this username or email already exists']
                ];
            }

            // Create new user
            $user = new User();
            $user->username = $userData['username'];
            $user->email = $userData['email'];
            $user->auth_key = Yii::$app->security->generateRandomString();
            $user->password_hash = Yii::$app->security->generatePasswordHash($plainPassword);
            $user->created_at = time();
            $user->updated_at = time();

            if (!$user->save()) {
                $transaction->rollBack();
                return [
                    'success' => false,
                    'user' => null,
                    'profile' => null,
                    'password' => null,
                    'errors' => $user->errors
                ];
            }

            // Assign user role
            Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                'item_name' => Yii::$app->params['userRoleRegular'],
                'user_id' => $user->id,
                'created_at' => time(),
            ])->execute();

            // Create profile
            $profile = new Profile();
            $profile->user_id = $user->id;
            $profile->name = $userData['name'] ?? '';
            $profile->office_id = $userData['office_id'] ?? null;
            $profile->group_id = $userData['group_id'] ?? null;
            $profile->public_email = $userData['email'] ?? null;
            $profile->password = $plainPassword; // Store plain password in profile
            $profile->user_type = $userType;

            if (!$profile->save()) {
                $transaction->rollBack();
                return [
                    'success' => false,
                    'user' => null,
                    'profile' => null,
                    'password' => null,
                    'errors' => $profile->errors
                ];
            }

            $transaction->commit();

            return [
                'success' => true,
                'user' => $user,
                'profile' => $profile,
                'password' => $plainPassword,
                'errors' => []
            ];

        } catch (\Exception|\Throwable $e) {
            $transaction->rollBack();
            Yii::error('User creation failed: ' . $e->getMessage());

            return [
                'success' => false,
                'user' => null,
                'profile' => null,
                'password' => null,
                'errors' => ['User creation failed: ' . $e->getMessage()]
            ];
        }
    }

    /**
     * Create multiple users from array data (for import functionality)
     *
     * @param array $usersData Array of user data arrays
     * @param int $officeId Office ID for all users
     * @param int $groupId Group ID for all users
     * @return array ['success' => bool, 'created_count' => int, 'errors' => array]
     */
    public function createUsersFromImport(array $usersData, int $officeId, int $groupId): array
    {
        $transaction = Yii::$app->db->beginTransaction();
        $createdCount = 0;
        $errors = [];

        try {
            foreach ($usersData as $i => $userData) {
                if (count($userData) < 3) {
                    continue; // Skip incomplete data
                }

                $username = $userData[1];
                $name = $userData[2];
                $email = $userData[3];

                $result = $this->createUser([
                    'username' => 'U' . $username,
                    'email' => $email,
                    'name' => $name,
                    'office_id' => $officeId,
                    'group_id' => $groupId,
                ]);

                if ($result['success']) {
                    $createdCount++;
                } else {
                    $errors[] = "Row " . ($i + 1) . ": " . implode(', ', $result['errors']);
                }
            }

            if (empty($errors)) {
                $transaction->commit();
                return [
                    'success' => true,
                    'created_count' => $createdCount,
                    'errors' => []
                ];
            } else {
                $transaction->rollBack();
                return [
                    'success' => false,
                    'created_count' => 0,
                    'errors' => $errors
                ];
            }

        } catch (\Exception|\Throwable $e) {
            $transaction->rollBack();
            Yii::error('Bulk user creation failed: ' . $e->getMessage());

            return [
                'success' => false,
                'created_count' => 0,
                'errors' => ['Bulk user creation failed: ' . $e->getMessage()]
            ];
        }
    }

    /**
     * Check if user exists by username or email
     *
     * @param string $username
     * @param string $email
     * @return bool
     */
    public function userExists(string $username, string $email): bool
    {
        return User::find()
            ->where(['username' => $username])
            ->orWhere(['email' => $email])
            ->exists();
    }

    /**
     * Generate a random password
     *
     * @param int $length
     * @return string
     */
    public function generatePassword(int $length = 8): string
    {
        return substr(str_shuffle(MD5(microtime())), 0, $length);
    }

    public static function checkDuplicate($dataList): array
    {
        $resultList = [];
        // Skip the first row (header)
        $rows = array_values(array_filter($dataList));
        foreach ($rows as $i => $data) {
            // Skip header row (first row)
            if ($i === 0) continue;
            if (sizeof($data) > 2) {
                $name = $data[2]; //title
                $username = $data[1]; //email
                $email = $data[3]; //email

                $model = User::find()->where(['username' => $username])
                    ->orWhere(['email' => $email])
                    ->one();

                if ($model !== null) {
                    (new UserService)->setIsAllDataExisted(true);
                    $resultList[] = [
                        'name' => $name,
                        'username' => $username,
                        'email' => $email,
                        'status' => LabelHelper::getYes('<i class="fas fa-check"></i>')
                    ];

                } else {
                    (new UserService)->setIsAllDataExisted(false);
                    $resultList[] = [
                        'name' => $name,
                        'username' => $username,
                        'email' => $email,
                        'status' => LabelHelper::getSuccess(Yii::t('app', 'New'))
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
            echo '<th>'.Yii::t('app', 'Title').'</th>';
            echo '<th>'.Yii::t('app', 'Username').'</th>';
            echo '<th>'.Yii::t('app', 'Email').'</th>';
            echo '<th>'.Yii::t('app', 'Status').'</th>';
            echo '</tr>';
            echo '</thead>';
            echo '<tbody>';

            foreach ($duplicateData as $data) {
                // Ensure $data is an array with 'name' and 'status' keys
                if (is_array($data) && isset($data['name']) && isset($data['status'])) {
                    echo '<tr>';
                    echo '<td>' . htmlspecialchars($data['name'], ENT_QUOTES, 'UTF-8') . '</td>'; // Participant's name
                    echo '<td>' . $data['username'] . '</td>'; // Status icon HTML
                    echo '<td>' . $data['email'] . '</td>'; // Status icon HTML
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

    public static function displaySchedule($groupId,$activePeriodId): void
    {
        // Loop through the result and display each item in a Bootstrap table
        if (!empty($groupId)) {

            $officeId = CacheService::getInstance()->getOfficeId();
            $listSchedules = Schedule::find()
                ->where([
                    'office_id' => $officeId,
                    'group_id' => $groupId,
                    'period_id' => $activePeriodId
                ])
                ->all();

            echo '<table class="table table-sm table-bordered">';
            echo '<thead>';
            echo '<tr>';
            echo '<th>'.Yii::t('app', '#').'</th>';
            echo '<th>'.Yii::t('app', 'Subject').'</th>';
            echo '<th>'.Yii::t('app', 'Date').'</th>';
            echo '<th>'.Yii::t('app', 'Start').'</th>';
            echo '<th>'.Yii::t('app', 'Sign').'</th>';
            echo '</tr>';
            echo '</thead>';
            echo '<tbody>';

            $counter = 1;
            foreach ($listSchedules as $schedule) {
                $listScheduleDetails = $schedule->scheduleDetails;
                foreach ($listScheduleDetails as $scheduleDetail) {
                    echo '<tr>';
                    echo '<td>'.$counter.'</td>';
                    echo '<td>'.$scheduleDetail->subject->title.'</td>';
                    echo '<td>'.DateHelper::formatDate($schedule->date_start).'</td>';
                    echo '<td>'.DateHelper::formatTime($schedule->date_start).'</td>';
                    echo '<td> </td>';
                    echo '</tr>';
                    $counter++;
                }
            }

            echo '</tbody>';
            echo '</table>';
        } else {
            echo '<div class="alert alert-info">No data found.</div>';
        }
    }

    private function setIsAllDataExisted($isDuplicate): void
    {
        //DEFAULT IS FALSE
        //RETURN ONLY TRUE VALUE
        if (!$isDuplicate) :
            self::$is_all_data_existed = $isDuplicate;
        endif;
    }

    // Method to get the value of is_duplicate
    public static function getIsAllDataExisted(): bool
    {
        return self::$is_all_data_existed;
    }
}
