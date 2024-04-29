<?php
require_once __DIR__ . '/../database/_.php';

try {
    $username = $_POST['user_username'];
    $db = _db();
    $q = $db->prepare('SELECT COUNT(*) FROM users WHERE user_username = :username');
    $q->bindValue(':username', $username);
    $q->execute();
    $exists = $q->fetchColumn() > 0;

    if ($exists) {
        http_response_code(400);
        echo json_encode(['error' => 'Username is already used']);
    } else {
        http_response_code(200);
        echo json_encode(['info' => 'Username is available']);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 500);
    echo json_encode(['info' => $e->getMessage()]);
}
