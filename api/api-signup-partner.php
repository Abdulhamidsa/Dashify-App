<?php

require_once __DIR__ . '/../database/_.php';

try {
    // _validate_user_firstname();
    // _validate_user_lastname();
    // _validate_user_username();
    // _validate_user_email();
    // _validate_user_password();
    // _validate_user_confirm_password();

    $db = _db();
    // $db->beginTransaction();

    $partnerQ = $db->prepare(
        '
    INSERT INTO partners 
    (partner_id, partner_name, partner_email, partner_password, partner_mobile, partner_rating, partner_registration_number, partner_blocked, partner_created_at, partner_updated_at)
    VALUES (
      :partner_id,
      :partner_name, 
      :partner_email,
      :partner_password, 
      :partner_mobile,
      :partner_rating,
      :partner_registration_number,
      :partner_blocked,
      :partner_created_at,
      :partner_updated_at)'
    );
    $partnerQ->bindValue(':partner_id', null);
    $partnerQ->bindValue(':partner_name', $_POST['partner_name']);
    $partnerQ->bindValue(':partner_email', $_POST['partner_email']);
    $partnerQ->bindValue(':partner_password', password_hash($_POST['partner_password'], PASSWORD_DEFAULT));
    $partnerQ->bindValue(':partner_mobile', $_POST['partner_mobile']);
    $partnerQ->bindValue(':partner_rating', 0);
    $partnerQ->bindValue(':partner_registration_number', $_POST['partner_registration_number']);
    $partnerQ->bindValue(':partner_blocked', false);
    $partnerQ->bindValue(':partner_created_at', time());
    $partnerQ->bindValue(':partner_updated_at', 0);
    $partnerQ->execute();
    $partnerCounter = $partnerQ->rowCount();
    if ($partnerCounter != 1) {
        throw new Exception('Error inserting partner information', 500);
    }
    $partner_id = $db->lastInsertId();
    $addressQ = $db->prepare(
        '
    INSERT INTO partner_address 
    (partner_id, street, zip_code, city)
    VALUES (
      :partner_id,
      :street,
      :zip_code,
      :city)'
    );
    $addressQ->bindValue(':partner_id', $partner_id);
    $addressQ->bindValue(':street', $_POST['partner_address']);
    $addressQ->bindValue(':zip_code', $_POST['partner_zipcode']);
    $addressQ->bindValue(':city', $_POST['partner_city']);
    $addressQ->execute();

    $addressCounter = $addressQ->rowCount();
    if ($addressCounter != 1) {
        throw new Exception('Error inserting address information', 500);
    }

} catch (Exception $e) {
    try {
        // $db->rollBack();
        if (!ctype_digit($e->getCode())) {
            throw $e;
        }
        http_response_code($e->getCode());
        echo json_encode(['info' => $e->getMessage()]);
    } catch (Exception $ex) {
        http_response_code(500);
        echo json_encode(['info' => json_encode($ex)]);
    }
}
