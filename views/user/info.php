<?php
$specificPageClass = 'user';
$user = $_SESSION['user'];

require_once __DIR__ . "/../layout/header.php";
?>



<div class="popup popup_user" class="popup-hidden">
    <p class="popup-message"></p>
</div>


<div class="container container_user" id="container3">
    <h2>Update Personal Details</h2>

    <div>
        <form id="user_update_form" class="partner_update_form">
            <div>
                <label for="user_firstname">First Name:</label>
                <input type="text" id="user_firstname" name="user_firstname" value="<?= $user['user_firstname']; ?>" required>
                <label for="user_lastname">Last Name:</label>
                <input type="text" id="user_lastname" name="user_lastname" value="<?= $user['user_lastname']; ?>" required>
                <label for="user_mobile">Mobile:</label>
                <input type="text" id="user_mobile" name="user_mobile" value="<?= $user['user_mobile']; ?>" required>
                <label for="user_email">email</label>
                <input type="text" id="user_email" name="user_email" value="<?= $user['user_email']; ?>" required>
                <label for="user_username">username</label>
                <input type="text" id="user_username" name="user_username" value="<?= $user['user_username']; ?>" required>
            </div>
            <div>
                <button class="primary_button update_partner_button" type="submit">Save</button>
                <button class="primary_button editButton" type="button">Edit Information</button>
                <button id="deleteProfileButtonUser">Delete Profile</button>
            </div>
        </form>
    </div>
    <!-- <button type="submit">Update</button> -->
</div>


<?php
require_once __DIR__ . "/../layout/footer.php";
?>