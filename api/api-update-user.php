<?php
require_once __DIR__ . '/../database/_.php';
session_start();
if (!isset($_SESSION['user']['user_id'])) {
    throw new Exception('user not logged', 400);
}
$user_id = $_SESSION['user']['user_id'];

try {

    _validate_user_firstname();
    _validate_user_lastname();
    _validate_user_username();
    _validate_user_email();

    $db = _db();
    $query = $db->prepare(
        '
        UPDATE users
        SET
          user_firstname = :user_firstname,
          user_lastname = :user_lastname,
          user_username = :user_username,
          user_email = :user_email,
          user_mobile = :user_mobile,
          user_updated_at = :user_updated_at
        WHERE
          user_id = :user_id'
    );
    $query->bindValue(':user_id', $user_id);
    $query->bindValue(':user_firstname', $_POST['user_firstname']);
    $query->bindValue(':user_lastname', $_POST['user_lastname']);
    $query->bindValue(':user_username', $_POST['user_username']);
    $query->bindValue(':user_email', $_POST['user_email']);
    $query->bindValue(':user_mobile', $_POST['user_mobile']);
    $query->bindValue(':user_updated_at', time());
    $query->execute();

    $userCounter = $query->rowCount();
    if ($userCounter != 1) {
        throw new Exception('Error updating user information', 500);
    }
    $_SESSION['user']['user_firstname'] = $_POST['user_firstname'];
    $_SESSION['user']['user_lastname'] = $_POST['user_lastname'];
    $_SESSION['user']['user_username'] = $_POST['user_username'];
    $_SESSION['user']['user_email'] = $_POST['user_email'];
    $_SESSION['user']['user_mobile'] = $_POST['user_mobile'];

    echo json_encode(['info' => 'User information updated successfully', $user_id]);
} catch (Exception $e) {
    try {
        if (!ctype_digit($e->getCode())) {
            throw new Exception();
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $ex) {
        http_response_code(500);
        echo json_encode(['info' => json_encode($ex)]);
    }
}
