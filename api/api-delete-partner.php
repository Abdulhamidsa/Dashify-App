<?php
require_once __DIR__ . '/../database/_.php';
try {
    session_start();
    if (!isset($_SESSION['partner'])) {
        throw new Exception('Not logged in', 400);
    }
    $partner_id = $_SESSION['partner']['partner_id'];
    $db = _db();
    $q = $db->prepare('DELETE FROM partners WHERE partner_id = :partner_id');
    $q->bindValue(':partner_id', $partner_id);
    $q->execute();
    session_destroy();
    echo json_encode(['info' => 'Partner profile deleted successfully']);
} catch (Exception $e) {
    http_response_code($e->getCode());
    echo json_encode(['info' => $e->getMessage()]);
}
