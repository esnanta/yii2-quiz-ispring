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
                $plainPassword = $this->generatePassword();
            }

            // Check if user already exists
            if ($this->userExists($userData['username'], $userData['email'])) {
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
     * Create multiple users from array data using bulk insert (for import functionality)
     *
     * @param array $usersData Array of user data arrays
     * @param int $officeId Office ID for all users
     * @param int $groupId Group ID for all users
     * @return array ['success' => bool, 'created_count' => int, 'errors' => array]
     */
    public function createUsersFromImportBulk(array $usersData, int $officeId, int $groupId): array
    {
        $createdCount = 0;
        $errors = [];
        $userBatch = [];
        $batchSize = 100;

        foreach ($usersData as $i => $userData) {
            // Skip incomplete data
            if (count($userData) < 4 || empty($userData[1]) || empty($userData[2]) || empty($userData[3])) {
                continue;
            }

            $parsedData = $this->parseImportUserData($userData);
            if (!$parsedData) {
                $errors[] = "Row " . ($i + 2) . ": Invalid data format"; // +2 because of 0-based index and header
                continue;
            }

            // Check for duplicates before adding to batch
            if ($this->userExists('U' . $parsedData['username'], $parsedData['email'])) {
                $errors[] = "Row " . ($i + 2) . ": User with username '{$parsedData['username']}' or email '{$parsedData['email']}' already exists.";
                continue;
            }

            $userBatch[] = $parsedData;

            if (count($userBatch) >= $batchSize) {
                $result = $this->processUserBatch($userBatch, $officeId, $groupId);
                $createdCount += $result['created_count'];
                $errors = array_merge($errors, $result['errors']);
                $userBatch = []; // Reset batch
            }
        }

        // Process any remaining users in the last batch
        if (!empty($userBatch)) {
            $result = $this->processUserBatch($userBatch, $officeId, $groupId);
            $createdCount += $result['created_count'];
            $errors = array_merge($errors, $result['errors']);
        }

        return [
            'success' => empty($errors),
            'created_count' => $createdCount,
            'errors' => $errors
        ];
    }

    /**
     * Process a batch of users for bulk insertion.
     *
     * @param array $userBatch
     * @param int $officeId
     * @param int $groupId
     * @return array
     */
    private function processUserBatch(array $userBatch, int $officeId, int $groupId): array
    {
        $transaction = Yii::$app->db->beginTransaction();
        $createdCount = 0;
        $errors = [];

        try {
            $userRows = [];
            $profileRows = [];
            $authAssignmentRows = [];
            $plainPasswords = [];

            foreach ($userBatch as $parsedData) {
                $plainPassword = $this->generatePassword();
                $user = new User();
                $user->username = 'U' . $parsedData['username'];
                $user->email = $parsedData['email'];
                $user->auth_key = Yii::$app->security->generateRandomString();
                $user->password_hash = Yii::$app->security->generatePasswordHash($plainPassword);
                $user->created_at = time();
                $user->updated_at = time();
                $user->flags = 0; // Set default value for flags

                if ($user->validate()) {
                    $userRows[] = $user->getAttributes();
                    $plainPasswords[$user->username] = $plainPassword;
                } else {
                    $errorMessages = [];
                    foreach($user->errors as $field => $fieldErrors) {
                        $errorMessages[] = "$field: " . implode(', ', $fieldErrors);
                    }
                    $errors[] = "Validation failed for username '{$parsedData['username']}': " . implode('; ', $errorMessages);
                }
            }

            if (empty($userRows)) {
                $transaction->rollBack();
                return ['created_count' => 0, 'errors' => $errors];
            }

            // Bulk insert users
            $userCommand = Yii::$app->db->createCommand()->batchInsert(User::tableName(), array_keys($userRows[0]), $userRows);
            $insertedUserRows = $userCommand->execute();

            if ($insertedUserRows > 0) {
                // Fetch inserted users to get their IDs
                $usernames = array_column($userRows, 'username');
                $insertedUsers = User::find()->where(['username' => $usernames])->all();

                foreach ($insertedUsers as $user) {
                    $profileRows[] = [
                        'user_id' => $user->id,
                        'name' => $userBatch[array_search($user->username, array_column($userBatch, 'username'))]['name'],
                        'office_id' => $officeId,
                        'group_id' => $groupId,
                        'public_email' => $user->email,
                        'password' => $plainPasswords[$user->username],
                        'user_type' => Profile::USER_TYPE_REGULAR,
                    ];
                    $authAssignmentRows[] = [
                        'item_name' => Yii::$app->params['userRoleRegular'],
                        'user_id' => $user->id,
                        'created_at' => time(),
                    ];
                }

                // Bulk insert profiles
                Yii::$app->db->createCommand()->batchInsert(Profile::tableName(), array_keys($profileRows[0]), $profileRows)->execute();
                // Bulk insert auth assignments
                Yii::$app->db->createCommand()->batchInsert('tx_auth_assignment', array_keys($authAssignmentRows[0]), $authAssignmentRows)->execute();

                $createdCount += count($insertedUsers);
            }

            $transaction->commit();
        } catch (\Exception|\Throwable $e) {
            $transaction->rollBack();
            $errors[] = 'Bulk insert failed: ' . $e->getMessage();
            Yii::error('Bulk user creation failed: ' . $e->getMessage());
        }

        return ['created_count' => $createdCount, 'errors' => $errors];
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

    /**
     * Parse user data from import format
     *
     * @param array $userData Raw data array
     * @return array|null Parsed data with keys: username, name, email or null if invalid
     */
    private function parseImportUserData(array $userData): ?array
    {
        if (count($userData) < 4) {
            return null;
        }

        return [
            'username' => $userData[1],
            'name' => $userData[2],
            'email' => $userData[3]
        ];
    }

    /**
     * Check for duplicate users in import data
     *
     * @param array $dataList Array of import data
     * @return array Array of user data with duplicate status
     */
    public static function checkDuplicate($dataList): array
    {
        $resultList = [];
        $service = new self();

        // Assume $dataList is already filtered by ReadFilter (columns A-D, max 20 rows)
        $rows = array_values(array_filter($dataList));
        foreach ($rows as $i => $data) {
            // Skip header row (first row)
            if ($i === 0) continue;
            // Only process if $data is array and has at least 4 columns
            if (!is_array($data) || count($data) < 4) continue;
            // If any cell in columns A-D is empty, stop looping immediately
            if (empty($data[0]) || empty($data[1]) || empty($data[2]) || empty($data[3])) {
                break;
            }

            $parsedData = $service->parseImportUserData($data);
            if (!$parsedData) {
                continue;
            }

            $model = User::find()->where(['username' => $parsedData['username']])
                ->orWhere(['email' => $parsedData['email']])
                ->one();

            if ($model !== null) {
                $service->setIsAllDataExisted(true);
                $resultList[] = [
                    'name' => $parsedData['name'],
                    'username' => $parsedData['username'],
                    'email' => $parsedData['email'],
                    'status' => LabelHelper::getYes('<i class="fas fa-check"></i>')
                ];
            } else {
                $service->setIsAllDataExisted(false);
                $resultList[] = [
                    'name' => $parsedData['name'],
                    'username' => $parsedData['username'],
                    'email' => $parsedData['email'],
                    'status' => LabelHelper::getSuccess(Yii::t('app', 'New'))
                ];
            }
        }
        return $resultList;
    }

    /**
     * Display duplicate check results in a table format
     *
     * @param array $duplicateData Array of duplicate check results
     */
    public static function displayDuplicate($duplicateData): void
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
                // Ensure $data is an array with required keys
                if (is_array($data) && isset($data['name']) && isset($data['status'])) {
                    echo '<tr>';
                    echo '<td>' . htmlspecialchars($data['name'], ENT_QUOTES, 'UTF-8') . '</td>';
                    echo '<td>' . htmlspecialchars($data['username'], ENT_QUOTES, 'UTF-8') . '</td>';
                    echo '<td>' . htmlspecialchars($data['email'], ENT_QUOTES, 'UTF-8') . '</td>';
                    echo '<td>' . $data['status'] . '</td>';
                    echo '</tr>';
                } else {
                    echo '<tr>';
                    echo '<td colspan="4" class="text-danger">Invalid data format</td>';
                    echo '</tr>';
                }
            }

            echo '</tbody>';
            echo '</table>';
        } else {
            echo '<div class="alert alert-info">No data found.</div>';
        }
    }

    /**
     * Display schedule for a group
     *
     * @param int $groupId Group ID
     * @param int $activePeriodId Active period ID
     */
    public static function displaySchedule($groupId, $activePeriodId): void
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

    /**
     * Set the all data existed flag
     *
     * @param bool $isDuplicate Whether data is duplicate
     */
    private function setIsAllDataExisted(bool $isDuplicate): void
    {
        //DEFAULT IS FALSE
        //RETURN ONLY TRUE VALUE
        if (!$isDuplicate) {
            self::$is_all_data_existed = $isDuplicate;
        }
    }

    /**
     * Get the all data existed flag
     *
     * @return bool
     */
    public static function getIsAllDataExisted(): bool
    {
        return self::$is_all_data_existed;
    }
}
