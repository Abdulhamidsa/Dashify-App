<?php
require_once __DIR__ . '/../database/_.php';
try {
    $admin_email = $_POST['admin_email'];
    $db = _db();
    $q = $db->prepare('SELECT * FROM admins WHERE admin_email = :admin_email');
    $q->bindValue(':admin_email', $admin_email);
    $q->execute();
    $admin = $q->fetch();

    if (!$admin) {
        error_log('Admin not found: ' . $admin_email);
        throw new Exception('invalid credentials', 400);
    }

    if ($_POST['admin_password'] !== $admin['admin_password']) {
        error_log('Invalid password for admin: ' . $admin_email);
        throw new Exception('invalid credentials', 400);
    }

    session_start();
    $_SESSION['admin'] = [
        'admin_id' => $admin['admin_id'],
        'admin_email' => $admin['admin_email'],
    ];
    $admin = $_SESSION['admin'];
    echo json_encode($_SESSION['admin']);
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
