document.addEventListener("turbo:load", () => {
  let hideTimeout; // タイマーを管理する変数

  // すべての dropdown-container を取得
  const dropdownContainers = document.querySelectorAll(".dropdown-container");

  dropdownContainers.forEach(container => {
    const dropdownMenu = container.querySelector(".dropdown-menu");

    container.addEventListener("mouseenter", () => {
      if (hideTimeout) {
        clearTimeout(hideTimeout);
        hideTimeout = null;
      }
       // 他のメニューを閉じる
      dropdownContainers.forEach(c => {
        const m = c.querySelector(".dropdown-menu");
        if (m !== dropdownMenu) m.style.display = "none";
      });
      dropdownMenu.style.display = "block";
    });

    container.addEventListener("mouseleave", () => {
      hideTimeout = setTimeout(() => {
        dropdownMenu.style.display = "none";
      }, 200);
    });
  });
});
