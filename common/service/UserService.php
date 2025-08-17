<?php

namespace common\service;

use common\models\Profile;
use common\models\User;
use Yii;
use yii\db\Exception;

class UserService
{
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

                $username = $userData[0];
                $name = $userData[1];
                $email = $userData[2];

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
}
