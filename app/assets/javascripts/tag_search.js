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
});
