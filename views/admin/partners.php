<?php


?>

<div class="container" id="container2">
    <h2>Partners</h2>

    <form id="searchAllPartnerForm">
        <label for="allPartnerSearch">Search:</label>
        <input type="text" name="partnerSearch" id="allPartnerSearch">
        <!-- <button type="submit">Submit</button> -->
    </form>

    <table>
        <thead>
            <tr>
                <th>Partner ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th></th>
            </tr>
        </thead>
        <tbody id="allPartnerResultsBody"></tbody>
    </table>

    <div id="partnerDetails" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalText"></p>
        </div>
    </div>
</div>



<?php
require_once __DIR__ . "/../layout/footer.php";
?>