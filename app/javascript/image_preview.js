document.addEventListener("DOMContentLoaded", function() {
  const inputElement = document.getElementById("image-input");
  const previewElement = document.getElementById("image-preview");

  if (inputElement && previewElement) {
    inputElement.addEventListener("change", (event) => {
      const files = event.target.files;
      if (files.length === 0) {
        previewElement.innerHTML = "";
        return;
      }

      const file = files[0];
      const reader = new FileReader();

      reader.onload = (e) => {
        previewElement.innerHTML = `<img src="${e.target.result}" class="img-fluid" />`;
      };

      reader.readAsDataURL(file);
    });
  } else {
    if (!inputElement) {
      console.error("Element with ID 'image-input' was not found.");
    }
    if (!previewElement) {
      console.error("Element with ID 'image-preview' was not found.");
    }
  }
});
