<?php
require_once __DIR__ . '/../database/_.php';
try {

    $partner_email = $_POST['partner_email'];
    $db = _db();
    $q = $db->prepare('SELECT * FROM partners WHERE partner_email = :partner_email');
    $q->bindValue(':partner_email', $partner_email);
    $q->execute();
    $partner = $q->fetch();

    if (!$partner) {
        error_log('Partner not found: ' . $partner_email);
        throw new Exception('invalid credentials', 400);
    }

    if (!password_verify($_POST['partner_password'], $partner['partner_password'])) {
        error_log('Invalid password for partner: ' . $partner_email);
        throw new Exception('invalid credentials', 400);
    }
    if ($partner['partner_blocked'] === 1) {
        throw new Exception('User is blocked', 403);
    }
    $q = $db->prepare('SELECT * FROM partner_address WHERE partner_id = :partner_id');
    $q->bindValue(':partner_id', $partner['partner_id']);
    $q->execute();
    $partner_address = $q->fetch();

    session_start();
    $_SESSION['partner'] = [
        'id' => $partner['partner_id'],
        'name' => $partner['partner_name'],
        'email' => $partner['partner_email'],
        'mobile' => $partner['partner_mobile'],
        'registration_number' => $partner['partner_registration_number'],
        'street' => $partner_address['street'],
        'zip_code' => $partner_address['zip_code'],
        'city' => $partner_address['city'],
        'password' => $_POST['partner_password'],
    ];
    echo json_encode($_SESSION['partner']);
} catch (Exception $e) {
    try {
        if (!$e->getCode() || !$e->getMessage()) {
            throw new Exception();
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $ex) {
        http_response_code(500);
        echo json_encode($ex);
    }
}
