<?php
$specificPageClass = 'signup-user';

require_once __DIR__ . "/../layout/header.php";
?>
<!-- <a href="/signup-user" class="secondary_button link_switch_log">Signup as a user</a> -->
<a class="secondary_button link_switch_log" href="/">Home</a>

<div class="form_flex">

    <form id="partner_signup_form" class="sign_form">
        <h2>Partner Signup</h2>

        <label for="partner_name">
            <p>Buusinis Name:</p>
            <span class="error error_name"></span>
        </label>
        <input id="partner_name" type="text" name="partner_name"><br>


        <label for="partner_email">
            <p>email</p>
            <span class="error error_email"></span>
        </label>
        <input id="partner_email" type="email" name="partner_email"><br>

        <label for="partner_password">
            <p>password</p>
            <span class="error error_password"></span>
        </label>
        <input id="partner_password" type="password" name="partner_password">
        <label for="partner_confirm_password">
            <p>Confirm password</p>
            <span class="error error_confirm"></span>
        </label>
        <input id="partner_confirm_password" type="password" name="partner_confirm_password">

        <label for="partner_registration_number">
            <p>registration number:</p>
            <span class="error error_registration"></span>
        </label>
        <input id="partner_registration_number" type="text" name="partner_registration_number"><br>
        <label for="partner_address">
            <p>Address:</p>
            <span class="error error_address"></span>
        </label>
        <input type="text" id="partner_address" name="partner_address">
        <label for="partner_city">
            <p>City:</p>
            <span class="error error_city"></span>
        </label>
        <input type="text" id="partner_city" name="partner_city">


        <label for="partner_zipcode">
            <p>Zip Code:</p>
            <span class="error error_zipcode"></span>
        </label>
        <input type="number" id="partner_zipcode" name="partner_zipcode">



        <label for="partner_mobile">
            <p>Phone:</p>
            <span class="error error_mobile"></span>
        </label>
        <div class="mobile_field">
            <input type="text" id="phonePrefix" value="+45" disabled>
            <input type="tel" id="partner_mobile" name="partner_mobile">
        </div>





        <input class="primary_button" type="submit" value="Sign Up">
        <p>Have an account already? signin <a href="/login-partner">here</a></p>

    </form>

</div>




<?php
require_once __DIR__ . "/../layout/footer.php";
?>