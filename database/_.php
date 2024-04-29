<?php
// ##############################
function _db()
{
    try {
        $user_name = "root";
        $user_password = "";
        $db_connection = "mysql:host=localhost; dbname=dashify; charset=utf8mb4";
        $db_options = array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        );
        return new PDO($db_connection, $user_name, $user_password, $db_options);
    } catch (PDOException $e) {
        throw new Exception('ups... system under maintainance', 500);
        exit();
    }
}
define('USERNAME_MIN', 2);
define('USERNAME_MAX', 20);
function _validate_user_username()
{
    $error = 'username min ' . USERNAME_MIN . ' max ' . USERNAME_MAX;

    if (!isset($_POST['user_username'])) {
        throw new Exception($error, 400);
    }
    $_POST['user_username'] = trim($_POST['user_username']);

    if (strlen($_POST['user_username']) < USERNAME_MIN) {
        throw new Exception($error, 400);
    }

    if (strlen($_POST['user_username']) > USERNAME_MAX) {
        throw new Exception($error, 400);
    }
}
// ############################
define('FIRSTNAME_MIN', 2);
define('FIRSTNAME_MAX', 20);
function _validate_user_firstname()
{
    $error = 'firstname min ' . FIRSTNAME_MIN . ' max ' . FIRSTNAME_MAX;
    if (!isset($_POST['user_firstname'])) {
        throw new Exception($error, 400);
    }
    $_POST['user_firstname'] = trim($_POST['user_firstname']);

    if (strlen($_POST['user_firstname']) < FIRSTNAME_MIN) {
        throw new Exception($error, 400);
    }
    if (strlen($_POST['user_firstname']) > FIRSTNAME_MAX) {
        throw new Exception($error, 400);
    }
}

// ##############################
define('USER_LASTNAME_MIN', 2);
define('USER_LASTNAME_MAX', 20);
function _validate_user_lastname()
{

    $error = 'user_lastname min ' . USER_LASTNAME_MIN . ' max ' . USER_LASTNAME_MAX;

    if (!isset($_POST['user_lastname'])) {
        throw new Exception($error, 400);
    }
    $_POST['user_lastname'] = trim($_POST['user_lastname']);

    if (strlen($_POST['user_lastname']) < USER_LASTNAME_MIN) {
        throw new Exception($error, 400);
    }

    if (strlen($_POST['user_lastname']) > USER_LASTNAME_MAX) {
        throw new Exception($error, 400);
    }
}
// ##############################
function _validate_user_email()
{
    $error = 'user_email invalid';
    if (!isset($_POST['user_email'])) {
        throw new Exception($error, 400);
    }
    $_POST['user_email'] = trim($_POST['user_email']);
    if (!filter_var($_POST['user_email'], FILTER_VALIDATE_EMAIL)) {
        throw new Exception($error, 400);
    }
}
// ##############################
define('USER_PASSWORD_MIN', 6);
function _validate_user_password()
{
    $error = 'Password must have at least one uppercase letter and one digit (6 characters minimum)';

    if (!isset($_POST['user_password'])) {
        throw new Exception($error, 400);
    }
    $userPassword = trim($_POST['user_password']);

    if (empty($userPassword)) {
        throw new Exception($error, 400);
    }
    if (strlen($userPassword) < USER_PASSWORD_MIN) {
        throw new Exception($error, 400);
    }
    if (!preg_match('/^(?=.*[A-Z])(?=.*\d).+$/', $userPassword)) {
        throw new Exception($error, 400);
    }
}
// ##############################
function _validate_user_confirm_password()
{
    $error = 'user_confirm_password must match the user_password';
    if (!isset($_POST['user_confirm_password'])) {
        throw new Exception($error, 400);
    }
    $_POST['user_confirm_password'] = trim($_POST['user_confirm_password']);
    if ($_POST['user_password'] != $_POST['user_confirm_password']) {
        throw new Exception($error, 400);
    }
}



define('PARTNER_NAME_MIN', 2);
define('PARTNER_NAME_MAX', 50);
function _validate_partner_name()
{
    $error = 'Partner name min ' . PARTNER_NAME_MIN . ' max ' . PARTNER_NAME_MAX;

    if (!isset($_POST['partner_name'])) {
        throw new Exception($error, 400);
    }
    $_POST['partner_name'] = trim($_POST['partner_name']);

    if (strlen($_POST['partner_name']) < PARTNER_NAME_MIN) {
        throw new Exception($error, 400);
    }

    if (strlen($_POST['partner_name']) > PARTNER_NAME_MAX) {
        throw new Exception($error, 400);
    }
}

function _validate_partner_email()
{
    $error = 'Partner email invalid';
    if (!isset($_POST['partner_email'])) {
        throw new Exception($error, 400);
    }
    $_POST['partner_email'] = trim($_POST['partner_email']);
    if (!filter_var($_POST['partner_email'], FILTER_VALIDATE_EMAIL)) {
        throw new Exception($error, 400);
    }
}

define('PARTNER_MOBILE_MIN', 8);
define('PARTNER_MOBILE_MAX', 10);
function _validate_partner_mobile()
{
    $error = 'Partner mobile min ' . PARTNER_MOBILE_MIN . ' max ' . PARTNER_MOBILE_MAX;

    if (!isset($_POST['partner_mobile'])) {
        throw new Exception($error, 400);
    }
    $_POST['partner_mobile'] = trim($_POST['partner_mobile']);

    if (strlen($_POST['partner_mobile']) < PARTNER_MOBILE_MIN) {
        throw new Exception($error, 400);
    }

    if (strlen($_POST['partner_mobile']) > PARTNER_MOBILE_MAX) {
        throw new Exception($error, 400);
    }
}

define('PARTNER_REGISTRATION_NUMBER_MIN', 2);
define('PARTNER_REGISTRATION_NUMBER_MAX', 20);
function _validate_partner_registration_number()
{
    $error = 'Partner registration number min ' . PARTNER_REGISTRATION_NUMBER_MIN . ' max ' . PARTNER_REGISTRATION_NUMBER_MAX;

    if (!isset($_POST['partner_registration_number'])) {
        throw new Exception($error, 400);
    }
    $_POST['partner_registration_number'] = trim($_POST['partner_registration_number']);

    if (strlen($_POST['partner_registration_number']) < PARTNER_REGISTRATION_NUMBER_MIN) {
        throw new Exception($error, 400);
    }

    if (strlen($_POST['partner_registration_number']) > PARTNER_REGISTRATION_NUMBER_MAX) {
        throw new Exception($error, 400);
    }
}


function validate($field, $value, $min, $max, $isEmail = false, $isPassword = false)
{
    $value = trim($value);

    if (empty($value)) {
        throw new Exception("$field is required", 400);
    }

    if (strlen($value) < $min) {
        throw new Exception("$field min length is $min", 400);
    }

    if (strlen($value) > $max) {
        throw new Exception("$field max length is $max", 400);
    }

    if ($isEmail && !filter_var($value, FILTER_VALIDATE_EMAIL)) {
        throw new Exception("$field is invalid", 400);
    }

    if ($isPassword && !preg_match('/^(?=.*[A-Z])(?=.*\d).+$/', $value)) {
        throw new Exception("Password must have at least one uppercase letter and one digit", 400);
    }
}
