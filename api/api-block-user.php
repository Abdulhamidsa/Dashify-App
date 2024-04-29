<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../database/_.php';

try {
    $userId = $_GET['userId'];

    $db = _db();
    $q = $db->prepare("
    UPDATE users 
    SET user_status = !user_status 
    WHERE user_id = :user_id; 
  ");
    $q->bindValue(':user_id', $userId);
    $q->execute();

    echo json_encode(['info' => 'user updated']);
} catch (Exception $e) {
    $status_code = !ctype_digit($e->getCode()) ? 500 : $e->getCode();
    $message = strlen($e->getMessage()) == 0 ? 'error - ' . $e->getLine() : $e->getMessage();
    http_response_code($status_code);
    echo json_encode(['info' => $message]);
}
