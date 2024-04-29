<?php
// session_start();
// header('Content-Type: application/json');
// require_once __DIR__ . '/../database/_.php';

// try {
//     $db = _db();

//     // Validate order_id from the GET request
//     $orderId = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;

//     // Check if the user has permission to view products of the specified order
//     $userId = $_SESSION['user']['user_id'];
//     $qCheckPermission = $db->prepare('SELECT COUNT(*) as count FROM orders WHERE user_id = :user_id AND order_id = :order_id');
//     $qCheckPermission->bindValue(':user_id', $userId);
//     $qCheckPermission->bindValue(':order_id', $orderId);
//     $qCheckPermission->execute();
//     $permissionResult = $qCheckPermission->fetch(PDO::FETCH_ASSOC);

//     if (!$permissionResult || $permissionResult['count'] == 0) {
//         // User doesn't have permission to view products of this order
//         http_response_code(403); // Forbidden
//         echo json_encode(['error' => 'Permission denied']);
//         exit;
//     }

//     // Fetch products for the specified order
//     $q = $db->prepare('
//         SELECT product_name, product_price
//         FROM products
//         WHERE product_id IN (
//             SELECT product_id FROM orders WHERE order_id = :order_id
//         )
//     ');

//     $q->bindValue(':order_id', $orderId);
//     $q->execute();
//     $products = $q->fetchAll(PDO::FETCH_ASSOC);

//     echo json_encode($products);
// } catch (Exception $e) {
//     $status_code = !ctype_digit($e->getCode()) ? 500 : $e->getCode();
//     $message = strlen($e->getMessage()) == 0 ? 'error - ' . $e->getLine() : $e->getMessage();
//     http_response_code($status_code);
//     echo json_encode(['error' => $message]);
// }
