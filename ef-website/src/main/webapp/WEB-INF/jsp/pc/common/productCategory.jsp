<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/18
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="allsort">
<c:forEach items="${categoryList}" var="category" begin="0" end="9">
    <div class="item ">
        <c:if test="${category.id==projectCategory.id}">
         <h3 class="active link">
        <a href="<c:url value="/project/list/${category.id}"/>" title="">${category.name}</a><i class="icon-new icon-right"></i>
         </h3>
        </c:if>
        <c:if test="${category.id!=projectCategory.id}">
            <h3 class="active">
                <a href="<c:url value="/project/list/${category.id}"/>" title="">${category.name}</a><i class="icon-new icon-right"></i>
            </h3>
        </c:if>
        <div class="i-mc" style="display: none;">
            <div class="links">
                <c:forEach items="${projectMap.get(category.id)}" var="project">
                    <a href="<c:url value="/product/list/${project.id}"/>" title="">${project.name}</a>
                </c:forEach>
            </div>
        </div>



    </div>
</c:forEach>
</div>

<%--<div class="allsort" style="display: none;">--%>
    <%--<c:forEach items="${categoryList}" var="category" begin="0" end="8">--%>
        <%--<div class="item">--%>
            <%--<c:if test="${category.id==projectCategory.id}">--%>
            <%--<h3 class="active">--%>
                <%--</c:if>--%>
                    <%--<c:if test="${category.id!=projectCategory.id}">--%>
                    <%--<h3>--%>
                        <%--</c:if><i class="icon-new icon-left"></i><a href="<c:url value="/project/list/${category.id}"/>" title="">${category.name}</a><i class="icon-new icon-link"></i><i class="icon-new icon-right"></i></h3>--%>
            <%--<div class="i-mc" style="display: none;">--%>
                <%--<div class="links">--%>
                    <%--<c:forEach items="${projectMap.get(category.id)}" var="project">--%>
                        <%--<a href="<c:url value="/product/list/${project.id}"/>" title="">${project.name}</a>--%>
                    <%--</c:forEach>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>
<%--</div>--%>
<!--//End--nav-new-->
<style>

    .nav-new .cate .allsort .item .i-mc .links a {
        width: 18px;
        height: 120px;
        line-height: 16px;
        float: left;
        font-size: 14px;
        font-weight: bold;
        margin: 0 15px 10px 15px;
        overflow: hidden;
    }
    </style>