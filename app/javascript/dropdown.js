document.addEventListener("turbo:load", () => {
  const dropdownContainers = document.querySelectorAll(".dropdown-container");

  dropdownContainers.forEach(container => {
    const button = container.querySelector("button");
    const dropdownMenu = container.querySelector(".dropdown-menu");

    // 初期状態は非表示
    dropdownMenu.style.display = "none";

    button.addEventListener("click", (event) => {
      event.stopPropagation(); // 他のクリックイベントに干渉しないようにする

      const isOpen = dropdownMenu.style.display === "block";

      // 他のドロップダウンを全部閉じる
      dropdownContainers.forEach(c => {
        const menu = c.querySelector(".dropdown-menu");
        menu.style.display = "none";
      });

      // クリックしたものだけトグル
      dropdownMenu.style.display = isOpen ? "none" : "block";
    });
  });

  // ページのどこかをクリックしたらすべて閉じる
  document.addEventListener("click", () => {
    dropdownContainers.forEach(container => {
      const menu = container.querySelector(".dropdown-menu");
      menu.style.display = "none";
    });
  });
});
