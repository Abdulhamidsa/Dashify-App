<?php


?>

<div class="container" id="container3">
    <h2>Users</h2>

    <form id="searchAllUsersForm">
        <label for="allUsersSearch">Search:</label>
        <input type="text" name="userSearch" id="allUsersSearch">
        <!-- <button type="submit">Submit</button> -->
    </form>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Firstname</th>
                <th>Email</th>
                <th>Mobile</th>
                <th></th>
            </tr>
        </thead>
        <tbody id="allUsersResultsBody"></tbody>
    </table>

    <div id="userDetails" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalTextUser"></p>
        </div>
    </div>
</div>



<?php
require_once __DIR__ . "/../layout/footer.php";
?>