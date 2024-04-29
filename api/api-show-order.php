<?php

require_once __DIR__ . '/../database/_.php';

session_start();

try {
    if (!isset($_SESSION['user']['user_id'])) {
        throw new Exception('User is not logged in', 401);
    }

    $userId = $_SESSION['user']['user_id'];

    $db = _db();

    $orderQ = $db->prepare(
        'SELECT * FROM orders 
            WHERE user_id = :user_id'
    );
    $orderQ->bindValue(':user_id', $userId);
    $orderQ->execute();
    $orders = $orderQ->fetchAll(PDO::FETCH_ASSOC);
    header('Content-Type: application/json');
    echo json_encode(['orders' => $orders]);
} catch (Exception $e) {
    http_response_code($e->getCode());
    echo json_encode(['error' => $e->getMessage()]);
}
