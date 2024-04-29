<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../database/_.php';

try {
    $db = _db();
    $q = $db->prepare('SELECT * FROM partners');
    $q->execute();
    $partners = $q->fetchAll();

    foreach ($partners as $key => $partner) {
        $q = $db->prepare('SELECT * FROM partner_address WHERE partner_id = :partner_id');
        $q->bindValue(':partner_id', $partner['partner_id'], PDO::PARAM_INT);
        $q->execute();
        $address = $q->fetch();

        if ($address) {
            $partners[$key]['address'] = $address;
        }
    }

    echo json_encode($partners);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['info' => $e->getMessage()]);
}
