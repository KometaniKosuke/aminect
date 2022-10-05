$(function () {
  searchWord = function(){
    var searchText = $(this).val(), // 検索ボックスに入力された値
      targetText;

    $('.target-area p').each(function() {
      targetText = $(this).text();

      // 検索対象となるリストに入力された文字列が存在するかどうかを判断
      if (targetText.indexOf(searchText) != -1) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  };
  $('#search-text').on('input', searchWord);

  $("#button4").click(function () {
    $("#search-text").val(""); // クリア
    $('.target-area p').each(function() {
      targetText = $(this).text();
      $(this).show();
    });
  });
});

$(window).on('load', function(){
  var searchText = getParam('tagname'), // 検索ボックスに入力された値
    targetText;
  if (searchText==null){
    searchText = "";
  }
  $('.target-area p').each(function() {
    targetText = $(this).text();

    // 検索対象となるリストに入力された文字列が存在するかどうかを判断
    if (targetText.indexOf(searchText) != -1) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
});
// ---------------------------------------------------------------- //
function getParam(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
