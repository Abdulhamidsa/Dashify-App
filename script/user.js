document.getElementById("container1").classList.add("active");
document.querySelector(".dashboard a[data-container='container1']").classList.add("active");
document.getElementById("dashboard").addEventListener("click", function (event) {
  if (event.target.tagName === "A") {
    let containerId = event.target.getAttribute("data-container");
    let containers = document.querySelectorAll(".container");
    containers.forEach(function (container) {
      container.classList.remove("active");
    });
    let selectedContainer = document.getElementById(containerId);
    selectedContainer.classList.add("active");
    let links = document.querySelectorAll(".dashboard a");
    links.forEach(function (link) {
      link.classList.remove("active");
    });
    event.target.classList.add("active");
  }
});
function enableEdit() {
  const inputs = document.querySelectorAll("input[disabled]");
  inputs.forEach((input) => input.removeAttribute("disabled"));
  document.getElementById("saveButton").style.display = "block";
}
