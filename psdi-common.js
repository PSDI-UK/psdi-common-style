const LIGHT_MODE = "light";
const DARK_MODE = "dark";

// Load color mode from session storage and apply it
const mode = sessionStorage.getItem("mode");
document.documentElement.setAttribute("data-theme", mode);

function toggleMode() {
  let currentMode = document.documentElement.getAttribute("data-theme");
  let new_mode;

  if (currentMode == DARK_MODE) {
    new_mode = LIGHT_MODE;
  } else {
    new_mode = DARK_MODE;
  }

  document.documentElement.setAttribute("data-theme", new_mode);
  sessionStorage.setItem("mode", new_mode);
}

export function connectModeToggleButton() {
  // Connect the mode toggle function to the button
  const lModeToggleButton = document.querySelectorAll(".color-mode-toggle");
  lModeToggleButton.forEach(function (modeToggleButton) {
    modeToggleButton.addEventListener("click", toggleMode);
  });
}

export function addHeaderLinks() {
  // We want to load in the links, but preserve the existing mode toggle button alongside them, so this function
  // handles saving it and re-adding it

  let headerLinksParent = $("#psdi-header .navbar__items--right");
  let modeToggle = $("#psdi-header .color-mode-toggle");

  headerLinksParent.load("header-links.html",
    function (response, status, xhr) {
      if (status != "error") {
        headerLinksParent[0].appendChild(modeToggle[0]);
        connectModeToggleButton();
      }
    });
}

$(document).ready(function () {

  $("#psdi-header").load("psdi-common-header.html",
    function (response, status, xhr) {
      if (status != "error") {
        addHeaderLinks();
      }
    });

  $("#psdi-footer").load("psdi-common-footer.html");
});