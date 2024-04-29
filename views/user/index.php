<?php
$specificPageClass = 'index-user';
$page = 'Home';
session_start();
if (!isset($_SESSION['user']['user_id'])) {
    header('Location: /login-user');
}
require_once __DIR__ . "/../layout/header.php";
?>
<main>
    <div class="dashboard_container user_dash">

        <span class="logo">Dashify.</span>
        <div class="dashboard" id="dashboard">
            <a href="#" data-container="container1" class="active">Home</a>
            <a href="#" data-container="container2">Orders</a>
            <a href="#" data-container="container3">Personal Infromation</a>
        </div>
        <button id="signoutButton" class="logout"> Logout</button>
    </div>
    <div class="content">
        <?php include_once "home.php"; ?>
        <?php include_once "orders.php"; ?>
        <?php include_once "info.php"; ?>
    </div>
</main>
<?php
require_once __DIR__ . "/../layout/footer.php";
?>