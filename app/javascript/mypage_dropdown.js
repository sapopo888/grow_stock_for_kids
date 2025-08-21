document.addEventListener("turbo:load", () => {
  let hideTimeout; // タイマーを管理する変数

  const dropdownContainer = document.getElementById("dropdown-container");
  const dropdownMenu = document.getElementById("dropdown-menu");

  dropdownContainer.addEventListener("mouseenter", () => {
    // 非表示のタイマーがある場合はキャンセル
    if (hideTimeout) {
      clearTimeout(hideTimeout);
      hideTimeout = null;
    }
    // メニューを表示
    dropdownMenu.style.display = "block";
  });

  dropdownContainer.addEventListener("mouseleave", () => {
    // 少し遅延してからメニューを非表示にする
    hideTimeout = setTimeout(() => {
      dropdownMenu.style.display = "none";
    }, 200);
  });
});
