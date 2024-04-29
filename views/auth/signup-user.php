<?php
$specificPageClass = 'signup-user';
require_once __DIR__ . "/../layout/header.php";

?>
<!-- <a href="/signup-partner" class="secondary_button link_switch_log">Signup as a partner</a> -->
<a class="secondary_button link_switch_log" href="/">Home</a>

<div class="form_flex">
    <form class="sign_form" novalidate id="user_signup_form">
        <h2>User Signup</h2>
        <label for="user_firstname">
            <p>First Name:</p>
            <span class="error error_firstname"></span>
        </label>
        <input type="text" id="user_firstname" name="user_firstname">

        <label for="user_lastname">
            <p>Last Name:</p>
            <span class="error error_lastname"></span>
        </label>
        <input type="text" id="user_lastname" name="user_lastname">

        <label for="user_username">
            <p>Username:</p>
            <span class="error error_username"></span>
        </label>
        <input type="text" id="user_username" name="user_username">

        <label for="user_email">
            <p>Email:</p>
            <span class="error error_email"></span>
        </label>
        <input type="email" id="user_email" name="user_email">

        <label for="user_password">
            <p>Password:</p>
            <span class="error error_password"></span>
        </label>
        <input type="password" id="user_password" name="user_password">

        <label for="user_confirm_password">
            <p>Confirm Password:</p>
            <span class="error error_confirm"></span>
        </label>
        <input type="password" name="user_confirm_password" id="user_confirm_password">
        <label for="user_address">
            <p>Address:</p>
            <span class="error error_address"></span>
        </label>
        <input type="text" id="user_address" name="user_address">

        <label for="user_city">
            <p>City:</p>
            <span class="error error_city"></span>
        </label>
        <input type="text" id="user_city" name="user_city">

        <label for="user_zipcode">
            <p>Zip Code:</p>
            <span class="error error_zipcode"></span>
        </label>
        <input type="number" id="user_zipcode" name="user_zipcode">



        <label for="user_mobile">
            <p>Phone:</p>
            <span class="error error_mobile"></span>
        </label>

        <div class="mobile_field">
            <input type="text" id="phonePrefix" value="+45" disabled>
            <input type="tel" id="user_mobile" name="user_mobile">
        </div>



        <input class="primary_button" type="submit" value="Sign Up">
        <p>Have an account already? signin <a href="/login-user">here</a></p>
    </form>

</div>


<?php
require_once __DIR__ . "/../layout/footer.php";
?>