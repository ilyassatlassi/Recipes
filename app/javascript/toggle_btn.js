function initToggleBtn() {
  let toggleBtn = document.getElementById("toggle-btn");
  toggleBtn.checked = toggleBtn.dataset.public === "true";
  let form = document.getElementById("recipe-form");

  toggleBtn.addEventListener("change", function () {
    form.submit();
  });
}

initToggleBtn();