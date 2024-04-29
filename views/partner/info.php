<?php
$specificPageClass = 'user';

require_once __DIR__ . "/../layout/header.php";
?>



<div class="popup" class="popup-hidden">
    <p class="popup-message"></p>
</div>



<div class="container container_partner" id="container3">
    <h2>Update Personal Details</h2>
    <form id="partner_update_form" class="partner_update_form">
        <div>
            <div>
                <label for="partner_name">Business Name:</label>
                <p>
                    <input type="text" id="partner_name" name="partner_name" value="<?= $partner['name']; ?>">
                    <span class="error error_name"></span>
                </p>
            </div>

            <div>
                <label for="partner_mobile">Mobile:</label>
                <p>
                    <input type="text" id="partner_mobile" name="partner_mobile" value="<?= $partner['mobile']; ?>">
                    <span class="error error_mobile"></span>
                </p>
            </div>

            <div>
                <label for="partner_email">Email:</label>
                <p>
                    <input type="text" id="partner_email" name="partner_email" value="<?= $partner['email']; ?>">
                    <span class="error error_email"></span>
                </p>
            </div>
            <div class="password_update_partner">
                <label for="partner_password">New Password:</label>
                <p>
                    <input type="password" id="partner_password" value="<?= $partner['password'] ?>" name="partner_password">
                    <span class="error error_password"></span>
                </p>

            </div>


            <div>
                <label for="partner_street">Street:</label>
                <p>
                    <input type="text" id="partner_street" name="street" value="<?= $partner['street']; ?>">
                    <span class="error error_street"></span>
                </p>
            </div>
            <div>
                <label for="partner_registration_number">registration number:</label>
                <p>
                    <input type="text" id="partner_registration_number" name="partner_registration_number" value="<?= $partner['registration_number']; ?>">
                    <span class="error error_registration"></span>
                </p>
            </div>

            <div>
                <label for="partner_zipcode">Zip Code:</label>
                <p>
                    <input type="text" id="partner_zipcode" name="zip_code" value="<?= $partner['zip_code']; ?>">
                    <span class="error error_zipcode"></span>
                </p>
            </div>

            <div>
                <label for="partner_city">City:</label>
                <p>
                    <input type="text" id="partner_city" name="city" value="<?= $partner['city']; ?>">
                    <span class="error error_city"></span>
                </p>
            </div>
        </div>
        <div>
            <button class="primary_button update_partner_button" type="submit">Save</button>
            <button class="primary_button editButton" type="button">Edit Information</button>
            <button id="deleteProfileButton">Delete Profile</button>

        </div>

    </form>


</div>


<?php
require_once __DIR__ . "/../layout/footer.php";
?>