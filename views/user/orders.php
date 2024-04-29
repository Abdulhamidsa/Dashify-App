<?php
$specificPageClass = 'user';
$user = $_SESSION['user'];

?>

<div class="container container_user" id="container2">
    <h2>Orders</h2>

    <form id="searchForm">
        <label for="search">Search:</label>
        <input type="text" name="search" id="search">
        <!-- <button type="submit">Submit</button> -->
    </form>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Placed Order</th>
                <th>Status</th>
                <th>Total</th>
                <th>Partner Name</th>
            </tr>
        </thead>
        <tbody id="resultsBody"></tbody>
    </table>


    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalText"></p>
        </div>
    </div>
</div>





<?php
require_once __DIR__ . "/../layout/footer.php";
?>