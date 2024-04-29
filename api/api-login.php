<?php
require_once __DIR__ . '/../database/_.php';
try {

    _validate_user_email();
    _validate_user_password();
    $user_email = $_POST['user_email'];
    $db = _db();
    $q = $db->prepare('SELECT * FROM users WHERE user_email = :user_email');
    $q->bindValue(':user_email', $user_email);
    $q->execute();
    $user = $q->fetch();

    if (!$user) {
        error_log('User not found: ' . $user_email);
        throw new Exception('invalid credentials', 400);
    }

    if (!password_verify($_POST['user_password'], $user['user_password'])) {
        error_log('Invalid password for user: ' . $user_email);
        throw new Exception('invalid credentials', 400);
    }

    // Fetch the user's address
    $q = $db->prepare('SELECT * FROM user_address WHERE user_id = :user_id');
    $q->bindValue(':user_id', $user['user_id']);
    $q->execute();
    $user_address = $q->fetch();

    session_start();
    $_SESSION['user'] = [
        'user_id' => $user['user_id'],
        'user_username' => $user['user_username'],
        'user_email' => $user['user_email'],
        'user_firstname' => $user['user_firstname'],
        'user_lastname' => $user['user_lastname'],
        'user_mobile' => $user['user_mobile'],
        'user_address' => [
            'street' => $user_address['street'],
            'zip_code' => $user_address['zip_code'],
            'city' => $user_address['city'],
        ],
    ];
    $user = $_SESSION['user'];
    echo json_encode($_SESSION['user']);
} catch (Exception $e) {
    try {
        if (!$e->getCode() || !$e->getMessage()) {
            throw new Exception();
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $ex) {
        http_response_code(500);
        echo json_encode($ex);
    }
}
