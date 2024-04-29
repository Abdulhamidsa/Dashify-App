<?php
// if (!isset($_SESSION['user']['user_id'])) {
//     throw new Exception(400);
// }
require_once __DIR__ . "/../layout/header.php";
?>
<!-- <a href="/login-partner" class="secondary_button link_switch_log">Login as a partner</a> -->
<a class="secondary_button link_switch_log" href="/">Home</a>

<div class="form_flex">
    <form class="form_sign" id="user_login_form">
        <h2>Login</h2>
        <label for="user_email">Email:</label>
        <input value="sbruen@example.org" type="email" id="user_email" name="user_email" required>
        <label for="user_password">Password:</label>
        <input value="123456789aA" type="password" id="user_password" name="user_password" required>
        <button class="primary_button" type="submit">Login</button>
        <p>Dont have an account? signup <a href="/signup-user">here</a></p>
    </form>
    <div class="result"></div>
</div>
<?php
require_once __DIR__ . "/../layout/footer.php";
?>