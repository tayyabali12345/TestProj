// app/assets/javascripts/image_preview.js
function previewImage(input) {
  var imagePreview = document.getElementById("imagePreview");
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      imagePreview.innerHTML = "<img src='" + e.target.result + "' width='100'>";
    };
    reader.readAsDataURL(input.files[0]);
  }
}
