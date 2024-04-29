<?php
$specificPageClass = 'user';
$partner = $_SESSION['partner'];

?>

<div class="container container_partner" id="container2">
    <h2>Orders</h2>

    <form id="searchPartnerForm">
        <label for="partnerSearch">Search:</label>
        <input type="text" name="partnerSearch" id="partnerSearch">
        <!-- <button type="submit">Submit</button> -->
    </form>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User Name</th>
                <th>Placed Order</th>
                <th>Status</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody id="partnerResultsBody"></tbody>
    </table>

    <div class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p class="modalText"></p>
        </div>
    </div>
</div>



<?php
require_once __DIR__ . "/../layout/footer.php";
?>