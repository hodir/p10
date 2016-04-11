<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="<c:url value="/resources/jquery/jquery.qrcode.min.js"/>"></script>
    <title></title>
</head>
<body>
<%--<div id="native"></div>--%>

<div class="wh">
    <div class="scan-code">
        <div class="scan-text">
            <ul>
                <li class="tx1"><span>e飞蚁订单：${order.purchaseOrderPayment.purchaseOrder.serial}</span></li>
                <li class="tx2"><span><strong>${order.money}</strong>元</span></li>
            </ul>
        </div>
        <div class="scan-img">
            <div class="scan-img-left" id="native"></div>
            <div class="scan-img-right"></div>
        </div>
    </div>
</div>
<script>
    $('#native').qrcode({
        render: "div",
        text: "${codeUrl}"
    });

    var i = 5000;
    var wait = 5000;

    for (var j = 0; j < 15; j++) {
        wait += j * i;
        setTimeout(checkOrderStatus, wait);
    }

    function checkOrderStatus() {
        ajaxRequest("<c:url value="/order/orderCheck/${order.id}"/>", {}, function (data) {
            if (data) {
                window.location.href = "<c:url value="/order/myEfeiyi/view/${order.purchaseOrderPayment.purchaseOrder.id}"/>";
            }
        }, function () {
        }, "get")
    }

</script>
</body>
</html>