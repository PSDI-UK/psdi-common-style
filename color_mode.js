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