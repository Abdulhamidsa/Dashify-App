<?php

require_once __DIR__ . '/../database/_.php';

try {
    $email = $_POST['partner_email'];
    $db = _db();
    $q = $db->prepare('SELECT COUNT(*) FROM partners WHERE partner_email = :email');
    $q->bindValue(':email', $email);
    $q->execute();
    $exists = $q->fetchColumn() > 0;

    if ($exists) {
        http_response_code(400);
        echo json_encode(['error' => 'Email already exists']);
    } else {
        http_response_code(200);
        echo json_encode(['info' => 'Email is available']);
    }
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode(['error' => $e->getMessage()]);
}
