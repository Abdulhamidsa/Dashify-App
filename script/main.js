document.addEventListener("DOMContentLoaded", (event) => {
  const userEmailElement = _("#user_signup_form #user_email");
  const userUsernameElement = _("#user_signup_form #user_username");
  const userSignupFormElement = _("#user_signup_form");
  const partnerSignupFormElement = _("#partner_signup_form");
  const userLoginFormElement = _("#user_login_form");
  const partnerLoginFormElement = _("#partner_login_form");
  const adminLoginFormElement = _("#admin_login_form");
  const userUpdateFormElement = _("#user_update_form");
  const partnerUpdateFormElement = _("#partner_update_form");
  const signoutButtonElement = _("#signoutButton");
  const searchFormElement = _("#searchForm");
  const searchFormElementPartner = _("#searchPartnerForm");
  const searchInputElement = _("#search");
  const searchInputElementPartner = _("#partnerSearch");

  // const userEmailBlurListener = (event) => {
  //   checkIfExists("/api/api-is-email-exists.php", event.target.form, event.target);
  // };

  // const userUsernameInputListener = (event) => {
  //   checkIfExists("/api/api-is-username-exists.php", event.target.form, event.target);
  // };

  const userSignupFormSubmitListener = (event) => {
    signup("user", event);
  };

  const partnerSignupFormSubmitListener = async (event) => {
    event.preventDefault();
    if (await validatePartnerForm(event.target)) {
      signup("partner", event);
    }
  };
  const userLoginFormSubmitListener = (event) => {
    loginUser(event);
  };
  const partnerLoginFormSubmitListener = (event) => {
    loginPartner(event);
  };
  const adminLoginFormSubmitListener = (event) => {
    loginAdmin(event);
  };

  const userUpdateFormSubmitListener = (event) => {
    updateUser(event);
  };
  // const partnerUpdateFormSubmitListener = (event) => {
  //   updatePartner(event);
  // };

  const partnerUpdateFormSubmitListener = async (event) => {
    event.preventDefault();
    if (await validateUpdatePartnerForm(event.target)) {
      updatePartner(event);
    }
  };
  const signoutButtonClickListener = (event) => {
    signout(event);
  };

  const searchFormSubmitListener = (event) => {
    event.preventDefault();
    const searchTerm = searchInputElement.value;
    searchOrders(searchTerm);
  };
  const searchFormSubmitListenerPartner = (event) => {
    event.preventDefault();
    const searchTerm = searchInputElementPartner.value;
    searchPartnerOrders(searchTerm);
  };

  const searchInputListener = function () {
    const searchTerm = this.value;
    searchOrders(searchTerm);
  };
  const searchInputListenerPartner = function () {
    const searchTerm = this.value;
    searchPartnerOrders(searchTerm);
  };

  // if (userEmailElement) {
  //   userEmailElement.addEventListener("blur", userEmailBlurListener);
  // }

  // if (userUsernameElement) {
  //   userUsernameElement.addEventListener("input", userUsernameInputListener);
  // }

  if (userSignupFormElement) {
    userSignupFormElement.addEventListener("submit", userSignupFormSubmitListener);
  }
  if (partnerSignupFormElement) {
    partnerSignupFormElement.addEventListener("submit", partnerSignupFormSubmitListener);
  }

  if (userLoginFormElement) {
    userLoginFormElement.addEventListener("submit", userLoginFormSubmitListener);
  }
  if (partnerLoginFormElement) {
    partnerLoginFormElement.addEventListener("submit", partnerLoginFormSubmitListener);
  }
  if (adminLoginFormElement) {
    adminLoginFormElement.addEventListener("submit", adminLoginFormSubmitListener);
  }

  if (userUpdateFormElement) {
    userUpdateFormElement.addEventListener("submit", userUpdateFormSubmitListener);
  }
  if (partnerUpdateFormElement) {
    partnerUpdateFormElement.addEventListener("submit", partnerUpdateFormSubmitListener);
  }

  if (signoutButtonElement) {
    signoutButtonElement.addEventListener("click", signoutButtonClickListener);
  }

  if (searchFormElement) {
    searchOrders("");
    searchFormElement.addEventListener("submit", searchFormSubmitListener);
  }
  if (searchFormElementPartner) {
    searchPartnerOrders("");
    searchFormElementPartner.addEventListener("submit", searchFormSubmitListenerPartner);
  }

  if (searchInputElement) {
    searchInputElement.addEventListener("input", searchInputListener);
  }
  if (searchInputElementPartner) {
    searchInputElementPartner.addEventListener("input", searchInputListenerPartner);
  }
  const deleteProfileButtonElementUser = _("#deleteProfileButtonUser");

  if (deleteProfileButtonElementUser) {
    deleteProfileButtonElementUser.addEventListener("click", deleteUserProfile);
  }
  const deleteProfileButtonElementPartner = _("#deleteProfileButtonPartner");

  if (deleteProfileButtonElementPartner) {
    deleteProfileButtonElementPartner.addEventListener("click", deletePartnerProfile);
  }
});

async function deleteUserProfile() {
  try {
    const response = await fetch("/api/api-delete-user.php", {
      method: "POST",
      body: JSON.stringify({ action: "delete" }),
    });
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    const data = await response.json();
    alert(data.info);
    window.location.href = "/";
  } catch (error) {
    console.error("There has been a problem with your fetch operation:", error);
  }
}
async function deletePartnerProfile() {
  try {
    const response = await fetch("/api/api-delete-partner.php", {
      method: "POST",
      body: JSON.stringify({ action: "delete" }),
    });
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    const data = await response.json();
    alert(data.info);
    window.location.href = "/";
  } catch (error) {
    console.error("There has been a problem with your fetch operation:", error);
  }
}
// Utility functions
function _(q, from = document) {
  return from.querySelector(q);
}
function __(q, from = document) {
  return from.querySelectorAll(q);
}
const LOGIN_API_URL = "/api/api-login.php";
const UPDATE_USER_API_URL = "/api/api-update-user.php";
const UPDATE_PARTNER_API_URL = "/api/api-update-partner.php";
const LOGIN_API_PARTNER_URL = "/api/api-login-partner.php";
const ADMIN_LOGIN_API_URL = "/api/api-login-admin.php";

// Validation functions
function validateUsername(username) {
  return /^[a-zA-Z0-9][a-zA-Z0-9\s]{0,18}[a-zA-Z0-9]$/.test(username.trim());
}

function validateName(name) {
  return /^[a-zA-Z][a-zA-Z\s]{0,18}[a-zA-Z]$/.test(name.trim());
}

function validateEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function validatePassword(password) {
  return /^(?=.*[A-Z])(?=.*\d).{6,}$/.test(password);
}

function validateZipCode(zipCode) {
  return /^\d{4}$/.test(zipCode);
}

function validateAddress(address) {
  return address.trim() !== "";
}

function validateCity(city) {
  return isNaN(city.trim());
}

function validateMobile(mobile) {
  return /^\d{1,8}$/.test(mobile);
}
function validateRegistrationNumber(registrationNumber) {
  return registrationNumber.trim() !== "" && registrationNumber.length <= 9;
}
function getErrorElement(input) {
  return _(`.error_${input.id.split("_")[1]}`);
}

function updateErrorMessage(input, message, isError) {
  const errorElement = getErrorElement(input);

  const colorClass = isError ? "error-red" : "error-green";
  input.classList.remove("error-red", "error-green", "username-available");
  input.classList.add(colorClass);
  // console.log(input);
  // console.log(errorElement);
  errorElement.textContent = message;
}

function removeErrorMessage(input) {
  const errorElement = getErrorElement(input);
  errorElement.textContent = "";
  input.classList.remove("error-red", "error-green");
}

async function submitForm(signupType, form) {
  let isValid;
  if (signupType === "user") {
    isValid = await validateUserForm(form);
  } else {
    isValid = await validatePartnerForm(form);
  }

  if (isValid) {
    const apiUrl = signupType === "user" ? "/api/api-signup-user.php" : "/api/api-signup-partner.php";
    const conn = await fetch(apiUrl, {
      method: "POST",
      body: new FormData(form),
    });
    const data = await conn.text();
    if (conn.ok) {
      window.location.href = signupType === "user" ? "/login-user" : "/login-partner";
    }
  }
}

// Event handlers
async function signup(signupType, event) {
  event.preventDefault();
  await submitForm(signupType, event.target);
}

// Form validation
async function validateUpdatePartnerForm(form) {
  const fields = [
    { name: "name", validate: validateName, message: "Business Name must be 2 to 20 characters" },
    { name: "email", validate: validateEmail, message: "Invalid email address" },
    { name: "mobile", validate: validateMobile, message: "Invalid mobile number" },
    { name: "registration_number", validate: validateRegistrationNumber, message: "Registration Number is required" },
    { name: "street", validate: validateAddress, message: "Invalid street" },
    { name: "zipcode", validate: validateZipCode, message: "Invalid zip code" },
    { name: "password", validate: validatePassword, message: "Password must be at least 8 characters" },
    { name: "city", validate: validateCity, message: "Invalid city name" },
  ];

  let isValid = true;

  for (const field of fields) {
    const input = form[`partner_${field.name}`];
    const value = input.value;
    if (input.disabled) {
      continue;
    }

    if (!field.validate(value)) {
      updateErrorMessage(input, field.message, true);
      isValid = false;
    } else {
      removeErrorMessage(input);
    }
  }

  return isValid;
}
async function validateUserForm(form) {
  const fields = [
    { name: "username", validate: validateUsername, message: "Username must be 2 to 20 characters" },
    { name: "firstname", validate: validateName, message: "First name must be 2 to 20 characters" },
    { name: "lastname", validate: validateName, message: "Last name must be 2 to 20 characters" },
    { name: "email", validate: validateEmail, message: "Invalid email address" },
    { name: "password", validate: validatePassword, message: "Password must have at least one uppercase letter and one digit (6 characters minimum)" },
    { name: "confirm_password", validate: (value) => value === form.user_password.value, message: "Passwords do not match" },
    { name: "zipcode", validate: validateZipCode, message: "Invalid zip code" },
    { name: "mobile", validate: validateMobile, message: "Invalid mobile number" },
    { name: "address", validate: validateAddress, message: "Invalid address" },
    { name: "city", validate: validateCity, message: "Invalid city name" },
  ];

  let isValid = true;

  for (const field of fields) {
    const input = form[`user_${field.name}`];
    const value = input.value;

    if (!field.validate(value)) {
      updateErrorMessage(input, field.message, true);
      isValid = false;
    } else {
      removeErrorMessage(input);

      if (field.name === "username" || field.name === "email") {
        const apiUrl = `/api/api-is-${field.name}-exists.php`;
        const conn = await fetch(apiUrl, {
          method: "POST",
          body: new FormData(form),
        });

        if (!conn.ok) {
          updateErrorMessage(input, `${field.name.charAt(0).toUpperCase() + field.name.slice(1)} is alreadys used`, true);
          isValid = false;
        } else {
          updateErrorMessage(input, "", false);
        }
      }
    }
  }

  return isValid;
}
async function validatePartnerForm(form) {
  const fields = [
    { name: "name", validate: validateName, message: "Business Name must be 2 to 20 characters" },
    { name: "email", validate: validateEmail, message: "Invalid email address" },
    { name: "password", validate: validatePassword, message: "Password must have at least 8 characters" },
    { name: "confirm_password", validate: (value) => value === form.partner_password.value, message: "Passwords do not match" },
    { name: "mobile", validate: validateMobile, message: "Invalid mobile number" },
    { name: "registration_number", validate: validateRegistrationNumber, message: "Registration Number is required" },
    { name: "zipcode", validate: validateZipCode, message: "Invalid zip code" },
    { name: "city", validate: validateCity, message: "Invalid city name" },
    { name: "mobile", validate: validateMobile, message: "Invalid mobile number" },
    { name: "address", validate: validateAddress, message: "Invalid address" },
  ];

  let isValid = true;

  for (const field of fields) {
    const input = form[`partner_${field.name}`];
    const value = input.value;

    if (!field.validate(value)) {
      updateErrorMessage(input, field.message, true);
      isValid = false;
    } else {
      removeErrorMessage(input);

      if (field.name === "name" || field.name === "email") {
        const apiUrl = `/api/api-partner-${field.name}-exists.php`;
        const conn = await fetch(apiUrl, {
          method: "POST",
          body: new FormData(form),
        });

        if (!conn.ok) {
          updateErrorMessage(input, `${field.name.charAt(0).toUpperCase() + field.name.slice(1)} is alreadys used`, true);
          isValid = false;
        } else {
          updateErrorMessage(input, "", false);
          console.log("email is available");
        }
      }
    }
  }

  return isValid;
}
document.addEventListener("DOMContentLoaded", function () {
  const use_old_password = document.getElementById("use_old_password");
  const partner_password = document.getElementById("partner_password");
  const editButton = _(".editButton");
  const saveButton = _(".update_partner_button");
  const form = _(".partner_update_form");
  if (!form) {
    return;
  }
  const inputs = form.querySelectorAll("input");
  inputs.forEach((input) => (input.disabled = true));

  // if (use_old_password && partner_password) {
  //   use_old_password.addEventListener("click", function () {
  //     partner_password.disabled = this.checked;
  //   });
  // }

  editButton.addEventListener("click", function () {
    inputs.forEach((input) => (input.disabled = false));
    this.style.display = "none";
    saveButton.style.display = "block";
  });

  form.addEventListener("submit", async function (event) {
    event.preventDefault();
    if (await validateUpdatePartnerForm(form)) {
      inputs.forEach((input) => (input.disabled = true));
      saveButton.style.display = "none";
      editButton.style.display = "block";
      form.submit();
    }
  });
});

async function loginUser(event) {
  event.preventDefault();
  const userEmail = _("#user_email").value;
  const userPassword = _("#user_password").value;

  const data = {
    user_email: userEmail,
    user_password: userPassword,
  };

  try {
    const response = await fetch(LOGIN_API_URL, {
      method: "POST",
      body: new URLSearchParams(data),
    });

    const result = await response.json();

    if (response.ok && result.user_email) {
      _(".result").innerText = "Login successful! Redirecting...";
      setTimeout(() => {
        window.location.href = "/user";
      }, 2000);
    } else {
      _(".result").innerText = result.info || "Login failed. Please check your credentials.";
    }
  } catch (error) {
    _(".result").innerText = "Login failed. Please check your credentials.";
    console.error("Error:", error);
  }
}
async function loginPartner(event) {
  event.preventDefault();

  const partnerEmail = _("#partner_email").value;
  const partnerPassword = _("#partner_password").value;

  const data = {
    partner_email: partnerEmail,
    partner_password: partnerPassword,
  };

  try {
    const response = await fetch(LOGIN_API_PARTNER_URL, {
      method: "POST",
      body: new URLSearchParams(data),
    });

    const result = await response.json();

    if (response.status === 403) {
      alert(result.info);
      return;
    }

    if (response.status === 400) {
      _(".result").innerText = result.info;
      return;
    }

    if (response.ok) {
      _(".result").innerText = "Login successful! Redirecting...";
      setTimeout(() => {
        window.location.href = "/partner";
      }, 2000);
    } else {
      _(".result").innerText = "Login failed. Please check your credentials.";
      console.error("Login failed");
    }
  } catch (error) {
    console.error("Error:", error);
  }
}
async function loginAdmin(event) {
  event.preventDefault();
  const adminEmail = _("#admin_email").value;
  const adminPassword = _("#admin_password").value;

  const data = {
    admin_email: adminEmail,
    admin_password: adminPassword,
  };

  try {
    const response = await fetch(ADMIN_LOGIN_API_URL, {
      method: "POST",
      body: new URLSearchParams(data),
    });

    const result = await response.json();

    if (response.ok && result.admin_email) {
      _(".result").innerText = "Login successful! Redirecting...";
      setTimeout(() => {
        window.location.href = "/admin";
      }, 2000);
    } else {
      _(".result").innerText = result.info || "Login failed. Please check your credentials.";
    }
  } catch (error) {
    _(".result").innerText = "Login failed. Please check your credentials.";
    console.error("Error:", error);
  }
}
async function signout(event) {
  event.preventDefault();

  const response = await fetch("/api/api-logout.php", {
    method: "POST",
  });

  const data = await response.json();

  if (data.status === "success") {
    window.location.href = "/";
  } else {
    console.error(data.message);
  }
}

async function updateUser(event) {
  event.preventDefault();
  const conn = await fetch(UPDATE_USER_API_URL, {
    method: "POST",
    body: new FormData(event.target),
  });
  const popup = _(".popup");
  const popupMessage = _(".popup-message");
  if (!conn.ok) {
    popupMessage.textContent = "Update failed. Try again?";
  } else {
    popupMessage.textContent = "Update successful!";
  }
  popup.classList.remove("popup-hidden");
  popup.classList.add("popup-visible");
  setTimeout(() => {
    popup.classList.remove("popup-visible");
    popup.classList.add("popup-hidden");
    window.location.reload();
  }, 2000);
}
async function updatePartner(event) {
  event.preventDefault();
  const conn = await fetch(UPDATE_PARTNER_API_URL, {
    method: "POST",
    body: new FormData(event.target),
  });
  const popup = _(".popup");
  const popupMessage = _(".popup-message");
  if (!conn.ok) {
    popupMessage.textContent = "Update failed. Try again?";
  } else {
    popupMessage.textContent = "Update successful!";
  }
  popup.classList.remove("popup-hidden");
  popup.classList.add("popup-visible");
  setTimeout(() => {
    popup.classList.remove("popup-visible");
    popup.classList.add("popup-hidden");
    window.location.reload();
  }, 2000);
}
async function searchOrders(searchTerm) {
  try {
    const response = await fetch(`/api/api-search-user.php?query=${searchTerm}&statement=searchOrders`);

    if (!response.ok) {
      throw new Error("Network response was not ok");
    }

    const data = await response.json();

    const resultsBody = _("#resultsBody");
    resultsBody.innerHTML = "";

    const addedOrderIds = new Set();

    data.forEach((order) => {
      if (!addedOrderIds.has(order.order_id)) {
        const orderRow = document.createElement("tr");
        orderRow.innerHTML = `
          <td>${order.order_id}</td>
          <td>${order.order_date}</td>
          <td>${order.order_status}</td>
          <td>${order.order_total} DKK</td>
          <td>${order.partner_name}</td>
        `;

        resultsBody.appendChild(orderRow);
        addedOrderIds.add(order.order_id);
      }
    });
  } catch (error) {
    console.error("Error fetching:", error);
  }
}
async function searchPartnerOrders(searchTerm) {
  try {
    const response = await fetch(`/api/api-search-partner.php?query=${searchTerm}&statement=searchOrders`);

    if (!response.ok) {
      throw new Error("Network response was not ok");
    }

    const data = await response.json();

    const resultsBody = _("#partnerResultsBody");
    resultsBody.innerHTML = "";

    const processedOrderIds = new Set();

    data.forEach((order) => {
      if (!processedOrderIds.has(order.order_id)) {
        processedOrderIds.add(order.order_id);

        const orderRow = document.createElement("tr");
        orderRow.innerHTML = `
        <td>${order.order_id}</td>
        <td class="user-name" data-user-id="${order.user_id}">${order.user_firstname} ${order.user_lastname}</td>
        <td>${order.order_date}</td>
        <td>${order.order_status}</td>
        <td>${order.order_total} DKK</td>
      `;

        orderRow.addEventListener("click", () => {
          const modal = _(".modal");
          const modalContent = modal.querySelector(".modal-content");
          modalContent.innerHTML = `
            <span class="close">&times;</span>
            <table>
              <tr><th>Order ID</th><td>${order.order_id}</td></tr>
              <tr><th>User</th><td>${order.user_firstname} ${order.user_lastname}</td></tr>
              <tr><th>Product</th><td>${order.product_name}</td></tr>
              <tr><th>Unit Price</th><td>${order.product_price} DKK</td></tr>
            </table>
          `;
          modal.style.display = "block";
          modal.querySelector(".close").addEventListener("click", () => {
            modal.style.display = "none";
          });
        });

        resultsBody.appendChild(orderRow);
      }
    });
  } catch (error) {
    console.error("Error fetching:", error);
  }
}
async function displayUserOrders(userId) {
  const response = await fetch(`/api/api-search-partner.php?query=${userId}&statement=searchUserOrders`);

  if (!response.ok) {
    throw new Error("Network response was not ok");
  }

  const data = await response.json();
}

document.addEventListener("input", async function (event) {
  if (event.target.id === "allPartnerSearch") {
    const searchPartnerFormElement = document.getElementById("searchAllPartnerForm");
    const searchTermElement = document.getElementById("allPartnerSearch");
    const resultsBodyElement = document.getElementById("allPartnerResultsBody");

    if (searchPartnerFormElement && searchTermElement && resultsBodyElement) {
      event.preventDefault();
      const searchTerm = searchTermElement.value;
      resultsBodyElement.innerHTML = "";

      try {
        const partners = await fetchPartners(searchTerm);
        partners.forEach((partner) => {
          const row = document.createElement("tr");
          row.innerHTML = `
            <td>${partner.partner_id}</td>
            <td>${partner.partner_name}</td>
            <td>${partner.partner_email}</td>
            <td>${partner.partner_mobile}</td>
            <td><button onclick="showPartnerDetails(${partner.partner_id})">Details</button></td>
            <td><button onclick="fetchPartnerOrders(${partner.partner_id})">Show Orders</button></td>
            <td><button style="color: ${partner.partner_blocked === 0 ? "" : "red"};" onclick="blockPartner(${partner.partner_id}, event)">${partner.partner_blocked === 0 ? "Block" : "Unblock"}</button></td>
          `;
          resultsBodyElement.appendChild(row);
        });
      } catch (error) {
        console.error("Error:", error);
      }
    }
  }
});

async function fetchPartners(searchTerm) {
  const response = await fetch(`/api/api-search-all-partners.php?query=${searchTerm}`);
  const partners = await response.json();
  return partners;
}

async function fetchAllPartners() {
  try {
    const response = await fetch("/api/api-show-all-partners.php");
    const partners = await response.json();

    const tbody = document.getElementById("allPartnerResultsBody");
    tbody.innerHTML = "";

    partners.forEach((partner) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${partner.partner_id}</td>
        <td>${partner.partner_name}</td>
        <td>${partner.partner_email}</td>
        <td>${partner.partner_mobile}</td>
        <td><button onclick="showPartnerDetails(${partner.partner_id})">Details</button></td>
        <td><button onclick="fetchPartnerOrders(${partner.partner_id})">Show Orders</button></td>
<td><button style="color: ${partner.partner_blocked === 0 ? "" : "red"};" onclick="blockPartner(${partner.partner_id}, event)">${partner.partner_blocked === 0 ? "Block" : "Unblock"}</button></td>    `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error("Error fetching partners:", error);
  }
}
async function fetchAllUsers() {
  try {
    const response = await fetch("/api/api-show-all-users.php");
    const users = await response.json();
    const tbody = document.getElementById("allUsersResultsBody");
    tbody.innerHTML = "";
    users.forEach((user) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${user.user_id}</td>
        <td>${user.user_firstname} ${user.user_lastname}</td>
        <td>${user.user_email}</td>
        <td>${user.user_mobile}</td>
        <td><button onclick="showUserDetails(${user.user_id})">Details</button></td>
        <td><button style="color: ${user.user_status === 0 ? "" : "red"};" onclick="blockUser(${user.user_id}, event)">${user.user_status === 0 ? "Block" : "Unblock"}</button></td>
      `;
      tbody.appendChild(row);
    });
  } catch (error) {
    console.error("Error fetching users:", error);
  }
}
fetchAllUsers();
async function fetchPartnerOrders(partnerId) {
  try {
    const response = await fetch(`/api/api-show-partner-data.php?query=${partnerId}`);
    const orders = await response.json();

    const detailsElement = document.getElementById("modalText");
    detailsElement.innerHTML = "";

    const addedOrderIds = new Set();

    orders.forEach((order, index) => {
      if (!addedOrderIds.has(order.order_id)) {
        detailsElement.innerHTML += `
          <h3>Order ${index + 1}:</h3>
          <table>
            <tr><th>Order ID</th><td>${order.order_id}</td></tr>
            <tr><th>User ID</th><td>${order.user_id}</td></tr>
            <tr><th>Order Date</th><td>${order.order_date}</td></tr>
            <tr><th>Order Status</th><td>${order.order_status}</td></tr>
          </table>
        `;
        addedOrderIds.add(order.order_id);
      }
    });

    const modal = _("#partnerDetails");
    modal.style.display = "block";

    span.addEventListener("click", function () {
      modal.style.display = "none";
    });

    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };
  } catch (error) {
    console.error("Error fetching partner orders:", error);
  }
}
async function showPartnerDetails(partnerId) {
  try {
    const response = await fetch(`/api/api-search-all-partners.php?query=${partnerId}`);
    const partnerDetails = await response.json();
    const data = partnerDetails[0];

    const detailsElement = _("#modalText");
    detailsElement.innerHTML = `
      <table>
        <tr><th>Name</th><td>${data.partner_name}</td></tr>
        <tr><th>Email</th><td>${data.partner_email}</td></tr>
        <tr><th>Mobile</th><td>${data.partner_mobile}</td></tr>
        <tr><th>Street</th><td>${data.address.street}</td></tr>
        <tr><th>Zip Code</th><td>${data.address.zip_code}</td></tr>
        <tr><th>City</th><td>${data.address.city}</td></tr>
        <tr><th>Rating</th><td>${data.partner_rating}</td></tr>
        <tr><th>Registration Number</th><td>${data.partner_registration_number}</td></tr>
        <tr><th>Status</th><td>${data.partner_blocked === 0 ? "Active" : "Blocked"}</td></tr>
        <tr><th>Created At</th><td>${data.partner_created_at}</td></tr>
        <tr><th>Updated At</th><td>${data.partner_updated_at}</td></tr>
      </table>
    `;

    const modal = _("#partnerDetails");
    modal.style.display = "block";

    const span = _(".close");
    span.onclick = function () {
      modal.style.display = "none";
    };

    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };
  } catch (error) {
    console.error("Error fetching partner details:", error);
  }
}

async function blockPartner(partnerId, event) {
  try {
    const response = await fetch(`/api/api-block-partner.php?partnerId=${partnerId}`);

    if (response.status === 200) {
      const button = event.target;
      if (button.textContent === "Block") {
        button.textContent = "Unblock";
        button.style.color = "red";
      } else {
        button.textContent = "Block";
        button.style.color = "";
      }
    } else {
      const result = await response.json();
      console.error("Error blocking/unblocking partner:", result.info);
    }
  } catch (error) {
    console.error("Error:", error);
  }
}

fetchAllPartners();

document.addEventListener("input", async function (event) {
  if (event.target.id === "allUsersSearch") {
    const searchUserFormElement = document.getElementById("searchAllUsersForm");
    const searchTermElementUser = document.getElementById("allUsersSearch");
    const resultsBodyElementUser = document.getElementById("allUsersResultsBody");

    if (searchUserFormElement && searchTermElementUser && resultsBodyElementUser) {
      event.preventDefault();
      const searchTerm = searchTermElementUser.value;
      resultsBodyElementUser.innerHTML = "";

      try {
        const users = await fetchUsers(searchTerm);
        users.forEach((user) => {
          const row = document.createElement("tr");
          row.innerHTML = `
            <td>${user.user_id}</td>
            <td>${user.user_firstname} ${user.user_lastname}</td>
            <td>${user.user_email}</td>
            <td>${user.user_mobile}</td>
            <td><button onclick="showUserDetails(${user.user_id})">Details</button></td>
            <td><button style="color: ${user.user_status === 0 ? "" : "red"};" onclick="blockUser(${user.user_id}, event)">${user.user_status === 0 ? "Block" : "Unblock"}</button></td>
          `;
          resultsBodyElementUser.appendChild(row);
        });
      } catch (error) {
        console.error("Error:", error);
      }
    }
  }
});

async function fetchUsers(searchTerm) {
  const response = await fetch(`/api/api-search-all-users.php?query=${searchTerm}`);
  const users = await response.json();
  return users;
}

async function showUserDetails(userId) {
  try {
    const response = await fetch(`/api/api-search-all-users.php?query=${userId}`);
    const userDetails = await response.json();
    const data = userDetails[0];
    const detailsElement = document.getElementById("modalTextUser");
    detailsElement.innerHTML = `
      <table>
        <tr><th>Name</th><td>${data.user_firstname} ${data.user_lastname}</td></tr>
        <tr><th>Email</th><td>${data.user_email}</td></tr>
        <tr><th>Mobile</th><td>${data.user_mobile}</td></tr>
        <tr><th>Status</th><td>${data.user_status === 0 ? "Active" : "Blocked"}</td></tr>
        <tr><th>Created At</th><td>${data.user_created_at}</td></tr>
        <tr><th>Updated At</th><td>${data.user_updated_at}</td></tr>
      </table>
    `;

    const modal = document.getElementById("userDetails");
    modal.style.display = "block";

    const span = _(".close");
    span.addEventListener("click", function () {
      modal.style.display = "none";
    });

    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };
  } catch (error) {
    console.error("Error fetching user details:", error);
  }
}

async function blockUser(userId, event) {
  try {
    const response = await fetch(`/api/api-block-user.php?userId=${userId}`);

    if (response.status === 200) {
      const button = event.target;
      if (button.textContent === "Block") {
        button.textContent = "Unblock";
        button.style.color = "red";
      } else {
        button.textContent = "Block";
        button.style.color = "";
      }
    } else {
      const result = await response.json();
      console.error("Error blocking/unblocking user:", result.info);
    }
  } catch (error) {
    console.error("Error:", error);
  }
}
