$(function(){
    //����
    //(function(){
    //    $('.header .nav li').hover(function(){
    //        $(this).find('.bgbor').show();
    //        $(this).addClass('hover').find('.nav-links').stop().slideDown('fast');
    //    },function(){
    //        $(this).find('.bgbor').hide();
    //        $(this).removeClass('hover').find('.nav-links').stop().slideUp('fast');
    //    })
    //})();
    ////����ͼ
    //(function(){
    //    var $liImg=$('.focus .slider-main li');
    //    var $liNav=$('.focus .slider-nav li');
    //    var index=0;
    //    var timer=null;
    //    var iSpeed=3000;
    //    $liNav.mousedown(function(){
    //        clearInterval(timer);
    //        index=$(this).index();
    //        $liImg.eq(index).fadeIn(500).siblings('li').fadeOut(500);
    //        $(this).addClass('active').siblings('li').removeClass('active');
    //    });
    //    $liNav.mouseup(function(){
    //        timer=setInterval(autoFocus,iSpeed);
    //    })
    //    function autoFocus(){
    //        index++;
    //        if(index>$liImg.length-1){index=0;}
    //        $liImg.eq(index).fadeIn(500).siblings('li').fadeOut(500);
    //        $liNav.eq(index).addClass('active').siblings('li').removeClass('active');
    //    }
    //    timer=setInterval(autoFocus,iSpeed);
    //})();
    ////����
    //(function(){
    //    $('.shop-sort .link2 dt').click(function(){
    //        $(this).toggleClass('active').siblings('dd').stop().slideToggle('fast');
    //    })
    //})();
    ////��Ʒ����ҳ
    //(function(){
    //    var simgLi=$('.preview .slider-img li');
    //    var BimgLi=$('.preview .slider-main li');
    //    var index=0;
    //    var timer=null;
    //    var iSpeed=3000;
    //    simgLi.mousedown(function(){
    //        clearInterval(timer);
    //        index=$(this).index();
    //        BimgLi.eq(index).fadeIn('200').siblings().fadeOut('200');
    //        $(this).addClass('active').siblings('li').removeClass('active');
    //    });
    //    simgLi.mouseup(function(){
    //        timer=setInterval(autoRun,iSpeed);
    //    })
    //    timer=setInterval(autoRun,iSpeed);
    //    //�Զ��ֲ�
    //    function autoRun(){
    //        index++;
    //        if(index>simgLi.length-1){
    //            index=0;
    //        }
    //        BimgLi.eq(index).fadeIn('200').siblings().fadeOut('200');
    //        simgLi.eq(index).addClass('active').siblings('li').removeClass('active');
    //    }
    //    //�ղ�
    //    var $add=$('.preview .collect .icon');
    //    var $hover=$add.siblings('.hover');
    //    var $active=$add.siblings('.active');
    //    $add.hover(function(){
    //        $(this).addClass('icon-active');
    //        if($active.is(':hidden')){
    //            $hover.show();
    //        }else{
    //            $hover.hide();
    //        }
    //    },function(){
    //        $(this).removeClass('icon-active');
    //    });
    //    $add.click(function(){
    //        $(this).addClass('icon-active2');
    //        $hover.hide();
    //        $active.show();
    //    })
    //    //�̶�����
    //    $(window).scroll(function(){
    //        var d=$(document).scrollTop();
    //        if(d>900){
    //            $('.tab-wrap').css({'position':'fixed','top':'0'})
    //        }else{
    //            $('.tab-wrap').css({'position':'','top':''})
    //        }
    //    });
    //    $('.product-intro .detail .part:last').css({'border':'0'});
    //    //���
    //    $('.tab-items li a').click(function(){
    //        var pos=$($(this).attr('href')).offset().top;
    //        $("html,body").animate({scrollTop:pos-75},500);
    //        return false;
    //    });
    //    //���ѡ��
    //    $('.itemInfo .ul-list li').click(function(){
    //        $(this).addClass('active');
    //    })
    //
    //})();
    ////ע��--Э��
    //(function(){
    //    $('#protocol').click(function(){
    //        $('.thickframe').show();
    //        return false;
    //    })
    //    $('#closeBox,.btnt .btn-img').click(function(){
    //        $('.thickframe').hide();
    //        return false;
    //    })
    //})();
    //�ҵĶ���
    (function(){
        $('#orderNum .item:last tr').css({'border':'0'});
        $('.clearing-site span .btn-cart-add').click(function(){
            $(this).siblings('.active-pop').show();
            $('.clase, .sh-bg').click(function(){
                $(this).parents('.active-pop').hide();
            })
            // return false;
        })
    })();
    //�ջ���ַ
    (function(){
        $('.my-order .extra-r>a').click(function(){
            $(this).siblings('.active-pop').show();
            $('.my-order .clase, .my-order .sh-bg').click(function(){
                $(this).parents('.active-pop').hide();
            })
            return false;
        })
    })();
    //��Ʒ����
    (function(){
        $('.nav-item .title').click(function(){
            $(this).find('.icon').toggleClass('icon-active');
            $(this).siblings('.ul-list').stop().slideToggle(200);
            $(this).parents('.nav-item').find('.ul-list')
        })
    })();

})

//�ջ���ַ
$(function(){
    $('.my-order .extra-r>a').click(function(){
        $(this).siblings('.active-pop').show();
        $('.my-order .clase, .my-order .sh-bg').click(function(){
            $(this).parents('.active-pop').hide();
        })
        return false;
    })
})
//������Ϣ
$(function(){
    $('#act-q').click(function(){
        $(this).siblings('.list-express').slideToggle();

    })
})
//�����е����Ǵ��js
var GradList = document.getElementById("quacorgrading").getElementsByTagName("input");
for(var i=0;i < GradList.length;i++){
    GradList[i].onmouseover = function(){
        for(var Qi=0;Qi<GradList.length;Qi++){
            GradList[Qi].style.backgroundPosition = '-36px -21px';
        }
        for(var Qii=0;Qii<this.name;Qii++){
            GradList[Qii].style.backgroundPosition = '-5px -21px';
        }
        document.getElementById("QuacorGradingValue").innerHTML = '<b><font size="5" color="#fd7d28">'+this.name+'</font></b>分';
    }
}
//������ѡ��
$(function(){
    $('.evaluation .mutual .parameter .data .data-list .tally .djml').click(function(){
        $(this).toggleClass('cl-active')
    })
})
//
$(function(){
    $('.act-ui').click(function(){
        $(this).parents('.table').siblings('.mutual').slideToggle();
        return false;
    })
})
//
$(function(){
    $('.kd').click(function(){
        $(this).parents('.binding').sibling('.binding-list').slideToggle();
    })
})