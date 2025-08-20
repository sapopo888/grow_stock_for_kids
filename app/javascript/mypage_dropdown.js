document.addEventListener("DOMContentLoaded", () => {
  let hideTimeout;

  const dropdownContainer = document.getElementById("dropdown-container");
  const dropdownMenu = document.getElementById("dropdown-menu");

  dropdownContainer.addEventListener("mouseenter", () => {
    if (hideTimeout) {
      clearTimeout(hideTimeout);
      hideTimeout = null;
    }

    dropdownMenu.style.display = "block";
  });

  dropdownContainer.addEventListener("mouseleave", () => {
    hideTimeout = setTimeout(() => {
      dropdownMenu.style.display = "none";
    }, 200);
  });
});
