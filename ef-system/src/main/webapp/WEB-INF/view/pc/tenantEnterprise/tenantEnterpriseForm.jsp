<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/29
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>

<div class="am-g">

    <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        <div class="am-panel am-panel-default">
        </div>
    </div>

    <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form action="<c:url value="/basic/xmm.do"/>" method="post" class="am-form am-form-horizontal"
              enctype="multipart/form-data">
            <input type="hidden" name="tenantType" value="11">
            <input type="hidden" value="saveOrUpdateEnterpriseTenant" name="qm">
            <input type="hidden" name="id" value="${object.id}">
            <div class="am-form-group">
                <label for="serial" class="am-u-sm-3 am-form-label">商家编号</label>

                <div class="am-u-sm-9">
                    <c:if test="${serial == '1'}">
                        <input type="text" id="serial" name="serial" placeholder="自动生成" value="${object.serial}" readonly="readonly">
                    </c:if>
                    <c:if test="${serial != '1'}">
                        <input type="text" id="serial" name="serial" placeholder="自动生成" value="${serial}" readonly="readonly">
                    </c:if>

                </div>
            </div>
            <div class="am-form-group">
                <label for="name" class="am-u-sm-3 am-form-label">商家名称</label>

                <div class="am-u-sm-9">
                    <input type="text" id="name" name="name" placeholder="个人商家名称" value="${object.name}" required>
                </div>
            </div>
            <div class="am-form-group">
                <label for="logo" class="am-u-sm-3 am-form-label">Logo</label>

                <div class="am-u-sm-9">
                    <input type="file" id="logo" name="logo" placeholder="Logo"
                           value="${object.logoUrl}">
                </div>
                <c:if test="${!empty object.logoUrl}">
                    <img src="http://tenant.efeiyi.com/${object.logoUrl}@!tenant-manage-photo">
                </c:if>
            </div>
            <div class="am-form-group">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <button type="submit" class="am-btn am-btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    $(function(){
        var t = '${object.tenantType}';
        $("input[name='tenantType'][value='"+t+"']").attr("checked",true);
    });

</script>
</body>
</html>
