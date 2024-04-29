<?php
// if (!isset($_SESSION['admin']['admin_id'])) {
//     throw new Exception(400);
// }
require_once __DIR__ . "/../layout/header.php";
?>
<!-- <a href="/login-user" class="secondary_button link_switch_log">Login as a user</a> -->
<a class="secondary_button link_switch_log" href="/">Home</a>

<div class="form_flex">
    <form class="form_sign" id="admin_login_form">
        <h2>Admin Login</h2>
        <label for="admin_email">Email:</label>
        <input type="email" value="dashify@admin.com" id="admin_email" name="admin_email" required>
        <label for="admin_password">Password:</label>
        <input type="password" value="123456789aA" id="admin_password" name="admin_password" required>
        <button class="primary_button" type="submit">Login</button>
    </form>
    <div class="result"></div>
</div>
<?php
require_once __DIR__ . "/../layout/footer.php";
?>