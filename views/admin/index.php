<?php
session_start();
$specificPageClass = 'index-user';
$page = 'Home';

if (!isset($_SESSION['admin']['admin_id'])) {
    header('Location: /');
    throw new Exception(400);
}
require_once __DIR__ . "/../layout/header.php";
?>
<main>
    <div class="dashboard_container">

        <span class="logo">Dashify.</span>
        <div class="dashboard" id="dashboard">
            <a href="#" data-container="container1" class="active">Home</a>
            <a href="#" data-container="container2">Partners</a>
            <a href="#" data-container="container3">Users</a>
        </div>
        <button id="signoutButton" class="logout"> Logout</button>
    </div>
    <div class="content">
        <?php include_once "home.php"; ?>
        <?php include_once "partners.php"; ?>
        <?php include_once "users.php"; ?>
    </div>
</main>
<?php
require_once __DIR__ . "/../layout/footer.php";
?>