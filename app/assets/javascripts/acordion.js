// --------------------------------------------------------------
// const btn = document.getElementById('btn');
// btn.addEventListener('click', ()=>{
//   const target = document.getElementById('scroll-inner');
//   target.insertAdjacentHTML('beforeend', '<li>ADD ITEM</li>');
//   target.scrollTo(0, list.scrollHeight);
// }, false);
// -------------------------------------------------------------
jQuery(function ($) {

$('.js-accordion-title').on('click', function () {
  /*クリックでコンテンツを開閉*/
  $(this).next().slideToggle(200);
  /*矢印の向きを変更*/
  $(this).toggleClass('open');
});

});

$(document).ready(function() {
  $("p").text("jQuery稼働テスト(稼働中)");
});
