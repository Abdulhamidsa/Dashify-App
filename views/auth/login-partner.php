<?php
require_once __DIR__ . "/../layout/header.php";
?>
<!-- <a href="/login-user" class="secondary_button link_switch_log">Login as a user</a> -->
<a class="secondary_button link_switch_log" href="/">Home</a>

<div class="form_flex">

    <form class="sign_form" id="partner_login_form">
        <h2>Partner Login</h2>
        <label for="partner_email">Email:</label>
        <input type="email" value="kling.enid@example.com" id="partner_email" name="partner_email">
        <label for="partner_password">Password:</label>
        <input type="password" id="partner_password" value="123456789aA" name="partner_password">
        <button class="primary_button" type="submit">Login</button>
        <p>Dont have an account? signup <a href="/signup-partner">here</a></p>
    </form>
    <div class="result"></div>
</div>
<?php
require_once __DIR__ . "/../layout/footer.php";
?>