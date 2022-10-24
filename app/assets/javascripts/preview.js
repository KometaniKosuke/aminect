// 画像置き換え
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#alter-image').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#account_image").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
  $("#timetable_timetable_img").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
  $("#post_post_img").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
});
// 画像挿入
// document.addEventListener('DOMContentLoaded', () => {
//   const createImageHTML = (blob) => {
//     const imageElement = document.getElementById('new-image');
//     const blobImage = document.createElement('img');
//     blobImage.setAttribute('class', 'new-img')
//     blobImage.setAttribute('src', blob);
//     imageElement.appendChild(blobImage);
//   };
//   document.getElementById('post_post_img').addEventListener('change', (e) =>{
//     const imageContent = document.querySelector('new-img');
//     if (imageContent){
//       imageContent.remove();
//     }
//     const file = e.target.files[0];
//     const blob = window.URL.createObjectURL(file);
//     createImageHTML(blob);
//   });
// });
