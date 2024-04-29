<?php
$specificPageClass = 'user';

$partner = $_SESSION['partner'];
require_once __DIR__ . "/../layout/header.php";
?>

<div class="container container_partner" id="container1">
    <span>Welcome</span>
    <h1><?= $partner['name'] ?></h1>
    <div class="banner">
        <div class="banner_text">
            <h2>You are getting more popular! </h2>
            <p>People are enjoying your food! you have an increase by 200% of tottal order per day</p>
            <i class="fa-solid fa-gift"></i>
        </div>

        <div class="img_container">
            <img src="media/woman-partner.png" alt="pictue of a woman pointing">
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