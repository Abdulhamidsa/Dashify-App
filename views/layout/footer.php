<script src="main.js"></script>
<?php
if (isset($specificPageClass) && $specificPageClass === 'user') {
    echo '<script src="user.js"></script>';
}
?>
</body>

</html>