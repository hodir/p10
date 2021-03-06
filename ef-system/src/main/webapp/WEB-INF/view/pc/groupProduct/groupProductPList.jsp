<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/25
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title></title>
    <script>
        <%--function removeProduct(productId){--%>
            <%--jQuery.ajax({--%>
                <%--type:"GET",--%>
                <%--url:'<c:url value="/basic/xmj.do?qm=removeProduct"/>',--%>
                <%--data:{id:productId},--%>
                <%--dataType:"json",--%>
                <%--success:function(data){--%>
                    <%--$("#"+productId).remove();--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    </script>
</head>
<body>


<div style="text-align: left" >
<security:authorize ifAnyGranted="admin,operational,c_operational,o_operational">
    <a class="am-btn am-btn-default am-btn-xs am-text-secondary"
       href="<c:url value="/basic/xm.do?qm=formGroupProduct" />"><span
            class="am-icon-pencil-square-o">新建团购商品</span>
    </a>
    </security:authorize>
</div>
<jsp:include page="/do/generateTabs.do?qm=${requestScope.qm}&conditions=${requestScope.conditions}"/>
<div class="admin-content">
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
        </div>
        <div class="am-u-sm-12">
            <table class="am-table am-table-striped am-table-hover table-main">
                <thead>
                <tr>
<security:authorize ifAnyGranted="admin,operational,c_operational,o_operational">
                    <th class="table-set" >操作</th>
</security:authorize>
                    <th class="table-title">团购商品</th>
                    <th class="table-title">团购价格</th>
                    <th class="table-title">成团人数</th>
                    <th class="table-title">成团天数</th>
                    <th class="table-title">创建时间</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${requestScope.pageInfo.list}" var="groupProduct">
                    <tr id="${groupProduct.id}">
                        <security:authorize ifAnyGranted="admin,operational,c_operational,o_operational">
                        <td width="16%">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"  href="<c:url value="/basic/xm.do?qm=formGroupProduct&id=${groupProduct.id}"/>">
                                        编辑
                                    </a>
                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" href="javascript:void (0);" onclick="showConfirm('提示','是否删除',function(){removeGroupProduct('${groupProduct.id}')})">
                                        删除
                                    </a>

                                </div>
                            </div>
                        </td>
                        </security:authorize>
                        <td class="am-hide-sm-only" width="16%">
                            ${groupProduct.productModel.name}
                        </td>
                        <td class="am-hide-sm-only" width="16%">
                                ${groupProduct.groupPrice}
                        </td>
                        <td class="am-hide-sm-only" width="16%">
                                ${groupProduct.memberAmount}
                        </td>
                        <td class="am-hide-sm-only" width="16%">
                                ${groupProduct.groupPurchaseTime}
                        </td>

                        <td class="am-hide-sm-only" width="20%">
                           <fmt:formatDate value="${groupProduct.createDateTime}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div style="clear: both">
        <c:url value="/basic/xm.do" var="url" />
        <ming800:pcPageList bean="${requestScope.pageInfo.pageEntity}" url="${url}">
            <ming800:pcPageParam name="qm" value="${requestScope.qm}"/>
            <ming800:pcPageParam name="conditions" value="${requestScope.conditions}"/>
        </ming800:pcPageList>
    </div>
</div>
<script>
    function toSendPacket(url){
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            dataType: "json",
            data:{},
            success: function (data) {
              alert("发送成功！");
            }
        });
    }
    function removeGroupProduct(divId){
        $.ajax({
            type: "get",
            url: '<c:url value="/basic/xmj.do?qm=removeGroupProduct"/>',
            cache: false,
            dataType: "json",
            data:{id:divId},
            success: function (data) {
                $("#"+divId).remove();
            }
        });
    }


</script>

</body>
</html>
