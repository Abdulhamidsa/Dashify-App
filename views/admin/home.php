<?php
$specificPageClass = 'user';
if (!isset($_SESSION['admin']['admin_id'])) {
    throw new Exception(400);
}
require_once __DIR__ . "/../layout/header.php";
?>

<div class="container" id="container1">

    <h2>Hey Boss!!</h2>
    <div class="banner">
        <div class="banner_text">
            <h2>We are doing great! </h2>
            <p>Our users happiness is increasing 200% of tottal satisfaction wow!</p>
            <i class="fa-solid fa-gift"></i>
        </div>
        <div class="img_container">
            <img src="media/admin.png" alt="pictue of a woman pointing">
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