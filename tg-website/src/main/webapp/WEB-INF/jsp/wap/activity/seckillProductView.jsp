<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/18 0018
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <title>秒杀-详情页-已开始</title>
    <style>

        .addsub .opt a {
            width: 23px;
            height: 23px;
            border: 1px #000 solid;
            float: left;
            position: relative;
        }

        .addsub .opt a:before {
            content: '';
            width: 12px;
            height: 1px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -6px;
            background: #000;
        }

        .addsub .opt a.add:after {
            content: '';
            width: 1px;
            height: 13px;
            position: absolute;
            top: 50%;
            margin-top: -6px;
            left: 50%;
            margin-left: -1px;
            background: #000;
        }

        .addsub .opt .ipt-txt {
            width: 30px;
            height: 23px;
            padding: 0 5px;
            text-align: center;
            line-height: 23px;
            float: left;
            border: 0;
            border-bottom: 1px #000 solid;
            border-top: 1px #000 solid;
            font-size: 11px;
        }

    </style>
    <script src="<c:url value="/scripts/wap/js/alert.js"/>"></script>
</head>
<body>
<header class="am-header custom-header">
    <div class="am-header-left am-header-nav">
        <a href="<c:url value="/miao"/>" class="chevron-left"></a>
    </div>
    <!-- //End--chevron-left-->
    <h1 class="am-header-title">${seckillProduct.productModel.product.name}[${seckillProduct.productModel.name}]</h1>
    <!-- //End--title-->
    <div class="am-header-right am-header-nav">
        <a href="#chevron-right" class="chevron-right" id="menu">
            <i class="line"></i>
        </a>
    </div>
    <!-- //End--chevron-left-->
    <div class="menu-list">
        <ul class="bd">
            <li><a href="http://mall.efeiyi.com" title="首页">商城首页</a></li>
            <li><a href="<c:url value="/miao"/>" title="首页">秒杀首页</a></li>
            <li><a href="http://i.efeiyi.com" title="个人中心">个&nbsp;人&nbsp;中&nbsp;心</a></li>
        </ul>
    </div>
</header>
<!--//End--header-->
<article class="custom">
    <div data-am-widget="slider" class="bd am-slider am-slider-a1" data-am-slider='{&quot;directionNav&quot;:false}'>
        <ul class="am-slides">
            <c:forEach items="${seckillProduct.productModel.product.productPictureList}" var="pic">
                <c:if test="${pic.status=='1'}">
                    <li><img src="http://pro.efeiyi.com/${pic.pictureUrl}@!miao-product-view"></li>
                </c:if>
            </c:forEach>
            <%--<li><img src="../shop2015/upload/seckill1.jpg"></li>--%>
            <%--<li><img src="../shop2015/upload/seckill1.jpg"></li>--%>
        </ul>
    </div>
    <!--//End--am-slider-->
    <div class="bd details seckill">
        <div class="bd des-title">
            <strong class="bd txt">${seckillProduct.productModel.product.name}
                <c:if test="${not empty seckillProduct.productModel.name}">[${seckillProduct.productModel.name}]</c:if></strong>
            <a href="#分享" class="share" style="right: 0px;">
                <i class="icon icon-share"></i>

                <p>分享</p>
            </a>

            <div id="cover"><em class="bg"></em><img src="<c:url value="/scripts/wap/upload/guide-share.png"/>" alt="">
            </div>
            <%--<a href="#收藏" class="addfav">--%>
            <%--<i class="icon icon-addfav"></i>--%>

            <%--<p>收藏</p>--%>
            <%--</a>--%>
        </div>
        <!-- //End--des-title-->

        <div class="bd des-price">
            <div class="s s1"><span>原&nbsp;&nbsp;&nbsp;价：</span>
                <del>￥${seckillProduct.productModel.price}</del>
            </div>
            <div class="s s2"><span>秒杀价：</span><em>￥</em><strong>${seckillProduct.price}</strong></div>
            <c:if test="${ not empty isShowTime && !isShowTime}">
                <div class="s s3">
                    <div class="status2">
                        <p><fmt:formatDate value="${seckillProduct.startDatetime}" pattern="MM月dd日 HH:mm:ss"/></p>

                        <p>开始秒杀</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty isShowTime && isShowTime}">
                <div class="s s3">
                    <div class="status3">
                        <p>距秒杀开始还有</p>

                        <p style="width: 60%;">
                            <strong id="time-h">00</strong>
                            <strong id="time-m">00</strong>
                            <strong id="time-s">00</strong>
                        </p>
                    </div>
                </div>
            </c:if>
            <c:if test="${miaoStatus=='3'}">
                <div class="s s3">
                    <div class="status2">
                        <p>商品已被抢光，用时</p>

                        <p>${minute}分${second}秒</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${miaoStatus=='2'}">
                <div class="s s3">
                    <div class="status1">剩余库存量<strong id="amount">${seckillProduct.usefulAmount}</strong>件</div>
                </div>

                <div class="s sadd">
                    <span>数     量：</span>
                    <div class="addsub" data-option='{"upLimit":"${seckillProduct.limitAmount}","inputName":"amount"}'
                         style="float: right;"></div>
                </div>

                <div class="s s4">
                    <strong>秒杀记录：</strong>

                    <div class="bd info">
                        <ul id="miaoRecord">
                            <li class="bd"><p>&nbsp;</p></li>
                            <li class="bd"><p>&nbsp;</p></li>
                            <li class="bd"><p>&nbsp;</p></li>
                            <li class="bd"><p>&nbsp;</p></li>
                        </ul>
                    </div>
                </div>
            </c:if>

            <div class="s s5"><span>秒杀规则：</span>每件商品限抢购${seckillProduct.limitAmount}件，下单成功后请在15分钟内完成支付</div>
            <c:if test="${!empty seckillProduct.productModel.product.tenant}">
                <div class="s s6">
                    <span>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</span>由由 ${seckillProduct.productModel.product.bigTenant.name}[${seckillProduct.productModel.product.bigTenant.address}]
                    发货并提供售后服务
                </div>
            </c:if>
            <c:if test="${miaoStatus=='2'}">
                <%--<c:if test="${recordStatus=='1'}">--%>
                    <div class="bd btn-bg" id="miaoBuy"><a onclick="submitMiaoBuy()" title="立即抢购">立即抢购</a></div>
                <%--</c:if>--%>
                <%--<c:if test="${recordStatus=='0'}">--%>
                    <%--<div class="bd btn-bg-no">您已参与秒杀</div>--%>
                <%--</c:if>--%>
            </c:if>
            <c:if test="${miaoStatus=='3'}">
                <div class="bd btn-bg-no">秒杀结束</div>
            </c:if>
            <c:if test="${miaoStatus=='1'}">
                <div class="bd btn-bg-no">即将开始</div>
            </c:if>
        </div>


        <!-- //End--des-price-seckill-->
        <div class="seckill-bor"></div>
        <div class="des-content des-content-seckill">
            <div class="des-tab">
                <span class="link active" title="详情">详情</span>
                <a href="#comment"><span class="link" title="评论">评论</span></a>
            </div>
            <!-- //End-des-tab-->
            <div class="bd title">详情</div>
            <div class="bd">
                <c:if test="${not empty seckillProduct.productModel.product.productDescription}">
                    ${seckillProduct.productModel.product.productDescription.content}
                </c:if>
                <c:if test="${not empty productPictureList&&fn:length(productPictureList)>0}">
                    <c:forEach items="${productPictureList}" var="productPicture">
                        <%--<p>--%>
                        <%--<img src="http://pro.efeiyi.com/${productPicture.pictureUrl}"/>--%>
                        <%--</p>--%>
                        <ul class="bd ul-img">
                            <li class="img"><img src="http://pro.efeiyi.com/${productPicture.pictureUrl}"/></li>
                        </ul>
                    </c:forEach>
                </c:if>

                <!-- //End---->
                <div class="discuss" id="comment">
                    <c:if test="${not empty purchaseOrderProductList&&fn:length(purchaseOrderProductList) >0}">
                    <div class="bd dis-title">【顾客评论】</div>
                    <ul class="ul-list">
                        <c:forEach items="${purchaseOrderProductList}" var="purchaseOrderProduct"
                                   varStatus="rec">
                            <c:if test="${not empty purchaseOrderProduct.purchaseOrderComment&&purchaseOrderProduct.purchaseOrderComment.status!='0'}">

                                <c:set var="user">
                                    ${purchaseOrderProduct.purchaseOrder.user.getUsername()}
                                </c:set>
                                <li class="item">
                                    <div class="user-info">
                                        <img src="../shop2015/upload/yonghm.jpg" alt="">

                                        <p class="name">${fn:substring(user, 0,3 )}****${fn:substring(user,7,11)}</p>

                                        <c:if test="${not empty purchaseOrderProduct.purchaseOrderComment.createDatetime}">
                                            <p class="time">2015-10-12 16:16<fmt:formatDate
                                                    value="${purchaseOrderProduct.purchaseOrderComment.createDatetime}"
                                                    pattern="yy-MM-dd HH:mm"/></p>
                                        </c:if>
                                    </div>
                                    <div class="seller">
                                        <p class="ask">${purchaseOrderProduct.purchaseOrderComment.content}</p>

                                            <%--<p class="answer"><span>3天后追加：</span>真的好漂亮，价格公平，绣的真是栩栩如生，货真价实太棒了！</p>--%>
                                    </div>
                                        <%--<div class="store">--%>
                                        <%--<p class="s-title">店主回复</p>--%>

                                        <%--<p class="s-info">谢谢您的支持与鼓励，我们定会竭尽所能，给您提供最专业的服务。</p>--%>
                                        <%--</div>--%>
                                </li>

                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                </c:if>
            </div>
            <!-- //End--box-des-->
        </div>
    </div>


    <!-- //End---->
</article>

<script>

    function submitMiaoBuy() {
        var submitInterface = "<c:url value="/miao/buy/${seckillProduct.id}/"/>" + $("input[name=amount]").val();
        ;
        window.location.href = submitInterface;
    }

    function getProductAmount() {
        ajaxRequest("<c:url value="/miao/amount.do"/>", {"productId": "${seckillProduct.id}"}, function (data) {
            $("#amount").html(data);
            setTimeout("getProductAmount()", 7500);
        }, function () {
        }, "post")
    }

    function getProductOrder() {
        ajaxRequest("<c:url value="/miao/order.do"/>", {"productModelId": "${seckillProduct.productModel.id}"}, function (data) {
            var out = "";
            if (data.length > 0) {
                var dataLength = 0;
                if (data.length <= 4) {
                    dataLength = data.length;
                } else {
                    dataLength = 4;
                }
                for (var i = 0; i < dataLength; i++) {
                    var phone = data[i].user.username;
                    var datetime = new Date(data[i].createDatetime);
                    phone = phone.substring(0, 3) + "****" + phone.substring(7, 11);
                    out += "<li class=\"bd\"><p>" + phone + "</p><p>" + dateFormat(datetime.getHours()) + ":" + dateFormat(datetime.getMinutes()) + ":" + dateFormat(datetime.getSeconds()) + "</p></li>"
                }
            }
            $("#miaoRecord").html(out);
            setTimeout("getProductOrder()", 8500);
        }, function () {
        }, "post")
    }

    function dateFormat(time) {
        var out = ""
        if (time < 10) {
            out = "0" + time;
        } else {
            out = time;
        }
        return out;
    }

    setTimeout("getProductOrder()", 1000);
    setTimeout("getProductAmount()", 1500);


    function timeEnd() {
        // $("#miaoStatus").html("本场秒杀正火热进行中...");
        $("#miaoBuy").show();
        window.location.href = window.location.href;
    }

    <% request.setAttribute("currentDate",new Date()); %>

    function show_time() {
        var time_start = new Date().getTime(); //设定当前时间
        var time_end = new Date("<fmt:formatDate value="${seckillProduct.startDatetime}"
                                             pattern="20YY/MM/dd HH:mm:ss"/>").getTime(); //设定目标时间
        // 计算时间差
        var time_distance = time_end - time_start;

        if (time_distance < 0) {
            timeEnd();
        } else {
            // 时
            var int_hour = Math.floor(time_distance / 3600000)
            time_distance -= int_hour * 3600000;
            // 分
            var int_minute = Math.floor(time_distance / 60000)
            time_distance -= int_minute * 60000;
            // 秒
            var int_second = Math.floor(time_distance / 1000)
            // 时分秒为单数时、前面加零
            if (int_hour < 10) {
                int_hour = "0" + int_hour;
            }
            if (int_minute < 10) {
                int_minute = "0" + int_minute;
            }
            if (int_second < 10) {
                int_second = "0" + int_second;
            }
            // 显示时间
            $("#time-h").html(int_hour);
            $("#time-m").html(int_minute);
            $("#time-s").html(int_second);
            // 设置定时器
            setTimeout("show_time()", 1000);
        }
    }

    //选择数量组建 有个三个可选部分，1 加号 2减号 3.输入框
    //加号减号分别有可选状态和不可选状态，代表着组建value的上下限
    //输入框有两种状态 1.可以输入 2.不可以输入 同样也共有上限下限
    //加减号的组件一版作为表单的一项 还有就是加号减号都有一些毁掉函数
    //js组件 通过js调用 确定组件再页面中的位置  需要父节点
    var ChooseCountComponent = function () {
        var parentDiv = $(".addsub");
        var options = new Object();
        options["upLimit"] = 100; //默认上限  当数值达到上限的时候 加号不可点
        options["downLimit"] = 0; //默认下限   当数值达到下限的时候 减号不可点
        options["inputStatus"] = 0; //0为不可输入  1为可输入
        options["defaultValue"] = 1;
        options["inputName"] = "";
        var componentOption = parentDiv.attr("data-option"); //json字符串
        if (typeof componentOption != "undefined") {
            componentOption = JSON.parse(componentOption);

            if (typeof componentOption["defaultValue"] == "string") {
                options["defaultValue"] = Number(componentOption["defaultValue"]);
            }
            if (typeof componentOption["upLimit"] == "string") {
                options["upLimit"] = Number(componentOption["upLimit"]);
            }
            if (typeof componentOption["downLimit"] == "string") {
                options["downLimit"] = Number(componentOption["downLimit"]);
            }
            if (typeof componentOption["inputStatus"] == "string") {
                options["inputStatus"] = Number(componentOption["inputStatus"]);
            }
            if (typeof componentOption["inputName"] == "string") {
                options["inputName"] = componentOption["inputName"];
            }
        }
        var html = '<div class="opt"><a class="sub" title="减" ></a><input name="' + options["inputName"] + '" class="ipt-txt" disabled type="text" value="' + options["defaultValue"] + '" /><a class="add" title="加" ></a></div>'
        //加号的事件
        var addAction = function (e) {
            var inputElement = $(e.target).parent().find(".ipt-txt");
            var actionOptions = options;
            var currentValue = Number(inputElement.val());
            if (Number(currentValue) < actionOptions["upLimit"]) {
                currentValue += 1;
                inputElement.val(currentValue);
            }
        }
        var subAction = function (e) {
            var inputElement = $(e.target).parent().find(".ipt-txt");
            var actionOptions = options;
            var currentValue = Number(inputElement.val());
            if (Number(currentValue) > actionOptions["downLimit"]) {
                currentValue -= 1;
                inputElement.val(currentValue);
            }
        }
        parentDiv.on("click", ".add", addAction);
        parentDiv.on("click", ".sub", subAction);
        parentDiv.html(html);
    }


    //    $().ready(function(){
    //    });


    $().ready(function () {
        $("img").each(function () {
            $(this).css("width", "100%")
        })
        <c:if test="${miaoStatus=='1'}">
        show_time();
        </c:if>
        ChooseCountComponent();

        <c:if test="${not empty stockAlert }">
            showAlert("提示","库存不足");
        </c:if>

    })

</script>

</body>
</html>
