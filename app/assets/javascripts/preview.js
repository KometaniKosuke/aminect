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
  $("#timetable_timetable_img").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
  $("#account_image").change(function() {
    $('#alter-image').removeClass('hidden');
    readURL(this);
  });
});
