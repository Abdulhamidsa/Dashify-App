<?php
require_once __DIR__ . '/../database/_.php';
try {
    session_start();
    if (!isset($_SESSION['user'])) {
        throw new Exception('Not logged in', 400);
    }
    $user_id = $_SESSION['user']['user_id'];
    $db = _db();
    $q = $db->prepare('DELETE FROM users WHERE user_id = :user_id');
    $q->bindValue(':user_id', $user_id);
    $q->execute();
    session_destroy();
    echo json_encode(['info' => 'Profile deleted successfully']);
} catch (Exception $e) {
    http_response_code($e->getCode());
    echo json_encode(['info' => $e->getMessage()]);
}
