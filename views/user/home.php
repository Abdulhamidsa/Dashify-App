<?php
$specificPageClass = 'user';
if (!isset($_SESSION['user']['user_id'])) {
    throw new Exception(400);
    header('Location: /login');
}
require_once __DIR__ . "/../layout/header.php";
?>

<div class="container container_user" id="container1">
    <span>Welcome</span>
    <h1><?= $_SESSION['user']['user_username'] ?></h1>
    <div class="banner">
        <div class="banner_text">
            <h2>Craving Delicious Food?</h2>
            <p>Order now and enjoy crazyyyy deals on your favorite meals during christmas!</p>
            <i class="fa-solid fa-gift"></i>
        </div>

        <div class="img_container">
            <img src="../../media/woman.png" alt="">
        </div>
        <div>
            <div class="circle circle1"></div>
            <div class="circle circle2"></div>
            <div class="circle circle3"></div>
        </div>
    </div>
</div>



<?php
require_once __DIR__ . "/../layout/footer.php";
?>