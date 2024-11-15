const LIGHT_MODE = "light";
const DARK_MODE = "dark";
const DEFAULT_HEADER_LINKS_SOURCE = "./header-links.html";
const DEFAULT_BRAND_LINK_TARGET = "./";

let brandLinkTarget = DEFAULT_BRAND_LINK_TARGET;
let headerLinksSource = DEFAULT_HEADER_LINKS_SOURCE;

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

export function setBrandLinkTarget(s) {
  brandLinkTarget = s;
}

export function setHeaderLinksSource(s) {
  headerLinksSource = s;
}

let loadSteps = 2;

function finalizeLoad() {
  --loadSteps;
  if (loadSteps <= 0) {
    $("#cover").hide();
  }
}

export function addHeaderLinks() {
  // We want to load in the links, but preserve the existing mode toggle button alongside them, so this function
  // handles saving it and re-adding it

  let headerLinksParent = $("#psdi-header .navbar__items--right");
  let modeToggle = $("#psdi-header .color-mode-toggle");

  headerLinksParent.load(headerLinksSource,
    function (response, status, xhr) {
      if (status == "error") {
        headerLinksParent[0].textContent = "ERROR: Could not load header links";
      }
      headerLinksParent[0].appendChild(modeToggle[0]);
      connectModeToggleButton();
      finalizeLoad();
    });
}

$(document).ready(function () {

  $("#cover").fadeOut(1000);

  $("#psdi-header").load("https://psdi-uk.github.io/css-template/psdi-common-header.html",
    function (response, status, xhr) {
      if (status != "error") {
        $("#psdi-header a.navbar__brand")[0].href = brandLinkTarget;
        addHeaderLinks();
      } else {
        $("#psdi-header")[0].textContent = "ERROR: Could not load page header";
      }
    });

  $("#psdi-footer").load("https://psdi-uk.github.io/css-template/psdi-common-footer.html",
    function (response, status, xhr) {
      if (status == "error") {
        $("#psdi-footer")[0].textContent = "ERROR: Could not load page footer";
      }
      finalizeLoad();
    });
});