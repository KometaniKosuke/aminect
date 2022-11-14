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
  $("#user_image").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
  $("#post_post_img").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
});
