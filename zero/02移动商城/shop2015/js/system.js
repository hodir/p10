$(function(){
    //头部无logoA
    $('#menu').click(function(){
        $(this).find('.line').toggleClass('active');
        $('.menu-list').slideToggle('fast');
    });
    //购物车
    (function(){
        $('.icon-delete').click(function(){
           $('.alert-delete').fadeIn('fast');
        })

        $('.edit-dete').click(function(){
            $('.alert-delete').fadeIn('fast');
            return false;
        })

        if($('div').hasClass('payment-total-bar')){
            $('article').css({'padding-bottom':'50px'})
        }
    })();

    //020102分类导航
    (function(){
        $('.box-hd .ul-index-list>li .item').click(function(){
            $(this).find('.arrow-down').toggleClass('arrow-up');

            $(this).parents('.ul-index-list').siblings('.ul-nav-list').slideToggle('fast');

            return false;
        })
    })();






})