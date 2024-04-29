<?php

require_once __DIR__ . '/../database/_.php';

try {
    _validate_user_firstname();
    _validate_user_lastname();
    _validate_user_username();
    _validate_user_email();
    _validate_user_password();
    _validate_user_confirm_password();

    $db = _db();
    // $db->beginTransaction();
    $userQ = $db->prepare(
        '
    INSERT INTO users 
    (user_id, user_firstname, user_lastname, user_username, user_email, user_mobile, user_password, user_created_at, user_updated_at, user_status)
    VALUES (
      :user_id,
      :user_firstname, 
      :user_lastname, 
      :user_username,
      :user_email,
      :user_mobile, 
      :user_password, 
      :user_created_at, 
      :user_updated_at,
      :user_status)'
    );
    $userQ->bindValue(':user_id', null);
    $userQ->bindValue(':user_firstname', $_POST['user_firstname']);
    $userQ->bindValue(':user_lastname', $_POST['user_lastname']);
    $userQ->bindValue(':user_username', $_POST['user_username']);
    $userQ->bindValue(':user_email', $_POST['user_email']);
    $userQ->bindValue(':user_mobile', $_POST['user_mobile']);
    $userQ->bindValue(':user_password', password_hash($_POST['user_password'], PASSWORD_DEFAULT));
    $userQ->bindValue(':user_created_at', time());
    $userQ->bindValue(':user_updated_at', 0);
    $userQ->bindValue(':user_status', 0);
    $userQ->execute();
    $userCounter = $userQ->rowCount();
    if ($userCounter != 1) {
        throw new Exception('Error inserting user information', 500);
    }
    $user_id = $db->lastInsertId();
    $addressQ = $db->prepare(
        '
    INSERT INTO user_address 
    (user_id, street, zip_code, city)
    VALUES (
      :user_id,
      :street,
      :zip_code,
      :city)'
    );
    $addressQ->bindValue(':user_id', $user_id);
    $addressQ->bindValue(':street', $_POST['user_address']);
    $addressQ->bindValue(':zip_code', $_POST['user_zipcode']);
    $addressQ->bindValue(':city', $_POST['user_city']);
    $addressQ->execute();
    if ($addressQ->errorInfo()[2]) {
        throw new Exception('Database error: ' . $addressQ->errorInfo()[2]);
    }
    $addressCounter = $addressQ->rowCount();
    if ($addressCounter != 1) {
        throw new Exception('Error inserting address information', 500);
    }
    // $db->commit();

} catch (Exception $e) {
    try {
        // $db->rollBack();
        if (!ctype_digit($e->getCode())) {
            throw $e; 
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode([
            'error' => [
                'message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTrace(),
            ]
        ]);
    }
}
