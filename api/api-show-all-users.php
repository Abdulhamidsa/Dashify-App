<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../database/_.php';

try {
    $db = _db();
    $q = $db->prepare('SELECT * FROM users');
    $q->execute();
    $users = $q->fetchAll();

    foreach ($users as $key => $user) {
        $q = $db->prepare('SELECT * FROM user_address WHERE user_id = :user_id');
        $q->bindValue(':user_id', $user['user_id'], PDO::PARAM_INT);
        $q->execute();
        $address = $q->fetch();

        if ($address) {
            $users[$key]['address'] = $address;
        }
    }

    echo json_encode($users);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['info' => $e->getMessage()]);
}