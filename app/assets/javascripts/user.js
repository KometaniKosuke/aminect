$(function(){
    $('.js-deal-open').on('click',function(){
        $('.js-deal').fadeIn();
        return false;
    });
    $('.js-deal-close').on('click',function(){
        $('.js-deal').fadeOut();
        return false;
    });
});
