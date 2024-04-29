<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../database/_.php';

try {

    $partnerId = $_GET['partnerId'];

    $db = _db();
    $q = $db->prepare("
    UPDATE partners 
    SET partner_blocked = !partner_blocked 
    WHERE partner_id = :partner_id; 
  ");
    $q->bindValue(':partner_id', $partnerId);
    $q->execute();

    echo json_encode(['info' => 'partner updated']);
} catch (Exception $e) {
    $status_code = !ctype_digit($e->getCode()) ? 500 : $e->getCode();
    $message = strlen($e->getMessage()) == 0 ? 'error - ' . $e->getLine() : $e->getMessage();
    http_response_code($status_code);
    echo json_encode(['info' => $message]);
}
