<?php

session_start();

if (isset($_SESSION['user']) || isset($_SESSION['partner']) || isset($_SESSION['admin'])) {
    $_SESSION = array();
    session_destroy();
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Not signed in']);
}
