<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/20
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="<c:url value="/scripts/assets/css/myorder.css"/>" type="text/css " rel="stylesheet">
</head>
<body>
<div class="wr wh">
    <!--结算-->
    <div class="my-clearing">
        <h1>填写并核对订单信息</h1>
        <!--地址-->
        <div class="clearing-site">
            <span class="clearing-left">收货人信息</span>
        <span class="clearing-right">
            <a href="#">新增收货地址</a>
             <div class="active-pop" style="display: none">
                 <div class="pop-up">
                     <div class="pop-h">编辑收货人信息
                         <i class="clase" title="关闭"></i>
                     </div>
                     <div class="m-form">
                         <form id="newAddress">
                             <ul>
                                 <li>
                                     <label>收货人：</label>
                                     <input type="text" name="consignee">
                                     <span>请您填写收货人姓名</span>
                                 </li>
                                 <li>
                                     <label>所在地区：</label>

                                     <form>
                                         <select class="cars" id="province" name="province.id" onchange="provinceChange(this)">
                                             <option value="请选择">请选择</option>
                                         </select>
                                         <select class="car1" id="city" name="city.id">
                                             <option value="请选择">请选择</option>
                                         </select>
                                         <%--<select name="cars" class="car2">--%>
                                         <%--<option value="请选择">请选择</option>--%>
                                         <%--<option value="saab">Saab</option>--%>
                                         <%--<option value="fiat">Fiat</option>--%>
                                         <%--<option value="audi">Audi</option>--%>
                                         <%--</select>--%>
                                         <span>请您填写所在地区</span>
                                     </form>


                                 </li>
                                 <li>
                                     <label>详细地址：</label>
                                     <input type="text" name="details">
                                     <span>请您填写详细地址</span>
                                 </li>
                                 <li>
                                     <label>手机号码：</label>
                                     <input type="text" name="phone">
                                     <%--<label>固定号码：</label>--%>
                                     <%--<input type="text">--%>
                                     <span>请您填写电话号码</span>
                                 </li>
                                 <li>
                                     <label>邮箱：</label>
                                     <input type="text" name="email">
                                     <span>请您填写邮箱</span>
                                 </li>
                                 <li>
                                     <label></label>
                                     <strong>用来接收订单提醒邮件，便于您及时了解订单情况</strong>
                                 </li>
                                 <li>
                                     <label></label>
                                     <input type="button" class="dj-btn" onclick="submitNewAddress()" value="保存收货人信息">
                                 </li>
                             </ul>
                         </form>
                     </div>
                     <div class="sh-bg"></div>
                 </div>
             </div>
        </span>
        </div>
        <div class="page-clearing" id="address">
            <c:forEach items="${addressList}" var="address">

                <div class="page-default">
            <span>
                <c:if test="${address.status=='2'}">
                <div id="${address.id}" class="default-text default-active" name="addressItem" onchange="chooseAddress(this)">
                    </c:if>
                    <c:if test="${address.status=='1'}">
                    <div class="default-text" name="addressItem" onchange="chooseAddress(this)">
                        </c:if>
                        <strong>${address.consignee} ${address.province.name}</strong>
                            <%--<i class="triangle" style="display: block"></i>--%>
                        </a>
                    </div>
            </span>
                    <span>${address.consignee}</span>
                    <span>${address.province.name}</span>
                    <span>${address.city.name}</span>
                    <span>${address.details}</span>
                    <span>${address.phone}</span>
                </div>
            </c:forEach>
            <%--<div class="dj-p">--%>
            <%--<a href="#">展开地址--%>
            <%--<span class="triangle-bg"></span>--%>
            <%--</a>--%>

            <%--</div>--%>
        </div>
        <!--支付-->
        <div class="clearing-site divtop">
            <span class="clearing-left">支付方式</span>
        </div>
        <div class="page-clearing ">
            <li id="zhifubao" class="alipay wechat-active" onclick="zhifubao(this)">
                <span>支 付 宝</span>
                <i class="triangle" style="display: block"></i>
            </li>
            <li id="weixin" class="alipay " onclick="weixin(this)">
                <span>微   信</span>
            </li>
        </div>
        <!--支付-->
        <!--订货清单-->
        <div class="clearing-site divtop">
            <span class="clearing-left">订货清单</span>
        <span class="clearing-right">
            <a href="#">返回修改购物车</a>
        </span>
        </div>
        <c:forEach items="${tenantList}" var="tenant">

            <div class="page-inventory">
                <div class="page-store">
                    <a href="#">${tenant.name}</a>
                        <%--<a href="#">收起店铺--%>
                        <%--<span class="triangle-bg"></span>--%>
                        <%--</a>--%>
                </div>
                <div class="page-Commodity">
                    <table>
                        <c:forEach items="${productMap.get(tenant.id)}" var="product">
                            <tr>
                                <td width="542">
                                    <div class="cols1 page-pdl">
                                        <img src="../我的购物车/u/img-tx2.png" alt=""/>

                                        <div class="info">
                                            <p><a href="#">${product.productModel.product.project.name}</a></p>

                                            <p><a href="#">${product.productModel.product.name}
                                                <c:forEach items="${product.productModel.productPropertyValueList}"
                                                           var="ppv">-${ppv.projectPropertyValue.value}</c:forEach></a>
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td width="171"><span
                                        class="moneycl">${(product.productModel.price.intValue())*product.amount}</span>
                                </td>
                                <td width="137">
                                    <span>x${product.amount}</span>
                                </td>
                                <td width="102"><span>有货</span></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="page-leaveword">
                    <label>给店家留言</label>
                    <input id="${tenant.id}Message" name="message" type="text" value="限45个字" maxlength="45">
                    <span>0/45</span>
                </div>
            </div>
        </c:forEach>
        <!--订货清单-->
        <!--发票-->
        <!--<div class="clearing-site divtop">-->
        <!--<span class="clearing-left">-->
        <!--<input type="checkbox" class="middle-active"  value="全部">-->
        <!--开具发票-->
        <!--</span>-->
        <!--</div>-->
        <!--<div class="page-clearing">-->

        <!--</div>-->
        <!--发票-->
        <!--结算-->
        <div class="System">
            <div class="System-text">
                <span><a href="#" onclick="submitOrder('${purchaseOrder.id}')">提交订单</a> </span>
                <span>应付金额：<strong>${cart.totalPrice.intValue()}</strong> 元</span>
            </div>
        </div>
        <!--结算-->
    </div>
</div>

<script>

    var payment = "1";

    function zhifubao(element) {
        $(element).attr("class", "alipay wechat-active");
        $("#weixin").attr("class", "alipay");
        $("#weixin").find("i").remove();
        $(element).append('<i class="triangle" style="display: block"></i>')
        payment = "1";
    }

    function weixin(element) {
        $(element).attr("class", "alipay wechat-active");
        $("#zhifubao").attr("class", "alipay");
        $("#zhifubao").find("i").remove();
        $(element).append('<i class="triangle" style="display: block"></i>')
        payment = "3";
    }
    function submitOrder(orderId) {
        var messageObject = new Object();
        var addressId = $(".default-active").attr("id");
        $("input[name=message]").each(function () {
            messageObject[$(this).attr("id")] = $(this).val();
        })
        var message = "";
        for (var key in messageObject) {
            message += key + ":" + messageObject[key] + ";"
        }
        message = encodeURIComponent(message);
        console.log(message);
        var url = "/confirm/" + orderId + "?payment=" + payment + "&address=" + addressId + "&" + message;
    }


    $(function () {
        $('.clearing-site span a').click(function () {
            $(this).siblings('.active-pop').show();
            $('.clase, .sh-bg').click(function () {
                $(this).parents('.active-pop').hide();
            })
            return false;
        })

        //网页加载的时候把城市的数据取回来
        ajaxRequest("<c:url value="/address/listProvince.do"/>", {}, function(data){
            var out = '<option value="">请选择</option>';
            for(var i = 0; i<data.length ; i++){
                out+= '<option value="'+data[i]["id"]+'">'+data[i]["name"]+'</option>';
            }
            $("#province").html(out);
        }, function () {
        }, "post")

    })

    function provinceChange(element){
        var provinceId = $(element).val();
        ajaxRequest("<c:url value="/address/listCity.do"/>", {provinceId:provinceId}, function(data){
            var out = '<option value="">请选择</option>';
            for(var i = 0; i<data.length ; i++){
                out+= '<option value="'+data[i]["id"]+'">'+data[i]["name"]+'</option>';
            }
            $("#city").html(out);
        }, function () {
        }, "post")
    }

    function newAddress(it ) {
        var out = ' <div class="page-default"> <span> <div id="' + (it.id) + '" class="default-text"> <strong>' + (it.consignee) + ' ' + (it.province.name) + '</strong> </a> </div> </span> <span>' + (it.consignee) + '</span> <span>' + (it.province.name) + '</span> <span>' + (it.city.name) + '</span> <span>' + (it.details) + '</span> <span>' + (it.phone) + '</span> </div>';
        return out;
    }

    function submitNewAddress() {
        var param = $("#newAddress").serialize();
        var success = function (data) {
            console.log(data)
            var html = newAddress(data);
            $("#address").append(html);
            $(".active-pop").hide();
        }
        ajaxRequest("<c:url value="/order/addAddress.do"/>", param, success, function () {
        }, "post")
    }

    function chooseAddress(element){
        $("div[name=addressItem]").each(function(){
            $(this).attr("class","default-text");
        })
    }



</script>
</body>
</html>