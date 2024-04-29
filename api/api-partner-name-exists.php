<?php
require_once __DIR__ . '/../database/_.php';

try {
    $name = $_POST['partner_name'];
    $db = _db();
    $q = $db->prepare('SELECT COUNT(*) FROM partners WHERE partner_name = :name');
    $q->bindValue(':name', $name);
    $q->execute();
    $exists = $q->fetchColumn() > 0;

    if ($exists) {
        http_response_code(400);
        echo json_encode(['error' => 'Buissnise name is already used']);
    } else {
        http_response_code(200);
        echo json_encode(['info' => 'Buissnise name is available']);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 500);
    echo json_encode(['info' => $e->getMessage()]);
}
