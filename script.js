// Constants 

const LIGHT_MODE = "light";
const DARK_MODE = "dark";

// Current lightmdoe/darkmode state
let currentMode = document.documentElement.getAttribute("data-theme");

// Connections to nodes
const modeToggleButton = document.querySelector(".color-mode-toggle");

// Toggle between light and dark mode
function toggleMode() {
  let currentMode = document.documentElement.getAttribute("data-theme");
  if (currentMode == DARK_MODE)
    document.documentElement.setAttribute("data-theme", LIGHT_MODE);
  else
    document.documentElement.setAttribute("data-theme", DARK_MODE);
}

// Connect the toggle function to the button
modeToggleButton.addEventListener("click", toggleMode);
