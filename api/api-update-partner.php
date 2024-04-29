<?php
require_once __DIR__ . '/../database/_.php';
session_start();
if (!isset($_SESSION['partner']['id'])) {
    throw new Exception('partner not logged', 400);
}
$partner_id = $_SESSION['partner']['id'];

try {
    // _validate_partner_name();
    // _validate_partner_mobile();
    // _validate_partner_email();

    // _validate_partner_street();
    // _validate_partner_zipcode();
    // _validate_partner_registration_number();
    _validate_partner_name();
    // _validate_partner_email();
    // _validate_partner_mobile();
    // _validate_partner_registration_number();

    $db = _db();
    $query = $db->prepare(
        '
    UPDATE partners
    INNER JOIN partner_address ON partners.partner_id = partner_address.partner_id
    SET
    partners.partner_name = :partner_name,
    partners.partner_email = :partner_email,
    partners.partner_mobile = :partner_mobile,
    partners.partner_password = :partner_password,
    partners.partner_registration_number = :partner_registration_number,
    partners.partner_updated_at = :partner_updated_at,
    partner_address.street = :street,
    partner_address.city = :city,
    partner_address.zip_code = :zip_code
WHERE
  partners.partner_id = :partner_id'
    );
    $query->bindValue(':partner_id', $partner_id);
    $query->bindValue(':partner_name', $_POST['partner_name']);
    $query->bindValue(':partner_email', $_POST['partner_email']);
    $query->bindValue(':partner_mobile', $_POST['partner_mobile']);
    $query->bindValue(':partner_registration_number', $_POST['partner_registration_number']);
    $query->bindValue(':partner_password', password_hash($_POST['partner_password'], PASSWORD_DEFAULT));
    $query->bindValue(':partner_updated_at', time());
    $query->bindValue(':street', $_POST['street']);
    $query->bindValue(':zip_code', $_POST['zip_code']);
    $query->bindValue(':city', $_POST['city']);
    $query->execute();

    $partnerCounter = $query->rowCount();
    if (!$query->execute()) {
        throw new Exception('Error updating partner information', 500);
    }
    $_SESSION['partner']['id'] = $partner_id;
    $_SESSION['partner']['name'] = $_POST['partner_name'];
    $_SESSION['partner']['email'] = $_POST['partner_email'];
    $_SESSION['partner']['mobile'] = $_POST['partner_mobile'];
    $_SESSION['partner']['registration_number'] = $_POST['partner_registration_number'];
    $_SESSION['partner']['street'] = $_POST['street'];
    $_SESSION['partner']['zip_code'] = $_POST['zip_code'];
    $_SESSION['partner']['city'] = $_POST['city'];
    echo json_encode(['info' => 'Partner information updated successfully', $partner_id]);
} catch (Exception $e) {
    try {
        if (!ctype_digit($e->getCode())) {
            throw new Exception('Error code is not a digit');
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $ex) {
        http_response_code(500);
        echo json_encode(['info' => $ex->getMessage()]);
    }
}
