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
$(function(){
    $('.js-delete-open').on('click',function(){
        $('.js-delete').fadeIn();
        return false;
    });
    $('.js-delete-close').on('click',function(){
        $('.js-delete').fadeOut();
        return false;
    });
});
