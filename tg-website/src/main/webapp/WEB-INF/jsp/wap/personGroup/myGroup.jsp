<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/27
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>我的参团</title>
  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">
  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/wap/css/amazeui.min.css?v=20150831"/>">
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/wap/css/app.css?v=20150831"/>">
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/wap/css/myorder.css?v=20150831"/>">
</head>
<body>
<header class="am-header custom-header">
  <div class="am-header-left am-header-nav">
    <a href="javascript:history.go(-1)" class="chevron-left"></a>
  </div>
  <!-- //End--chevron-left-->
  <h1 class="am-header-title">我的团</h1>
  <!-- //End--title-->
</header>
<!--//End--header-->
<div class="ag-list ae" style="padding-bottom: 60px;">
  <ul class="ag-new ae">
    <li class="active">我的开团</li>
    <li>我的参团</li>
  </ul>
  <div class="ag-new2 ae">
    <div class="ag-ck">
      <ul class="offered ae">
        <c:forEach items="${myCreateProductList}" var="member" varStatus="rec">
          <c:if test="${member.status!=2}">
          <li>
            <a href="<c:url value='/group/shareGroup.do'/>?groupProductId=${member.myGroup.groupProduct.id}&groupId=${member.myGroup.id}&memberId=${member.id}">
              <p> ${member.myGroup.groupProduct.productModel.product.name} ${member.myGroup.groupProduct.productModel.name}</p>
              <p>${fn:substring(member.myGroup.createDateTime,0 ,19 )}</p>
              <c:if test="${member.myGroup.status==1}">
                <p>${member.myGroup.groupMemberList.size()}人/${member.myGroup.groupProduct.memberAmount}人成团</p>
                <span>进行中</span>
              </c:if>
              <c:if test="${member.myGroup.status==3}">
                <p>组团成功</p>
                <span>拼团结束</span>
              </c:if>
              <c:if test="${member.myGroup.status==5}">
                <p>组团失败</p>
                <span>拼团结束</span>
              </c:if>
              <c:if test="${member.myGroup.status==4}">
                <p>${member.myGroup.groupMemberList.size()}人/${member.myGroup.groupProduct.memberAmount}人成团</p>
                <span>进行中</span>
              </c:if>
            </a>
          </li>
          </c:if>
        </c:forEach>
      </ul>
    </div>
    <div class="ag-ck" style="display: none">
      <ul class="offered ae">
        <c:forEach items="${groupJoinList}" var="member" varStatus="rec">
          <a href="<c:url value='/group/shareGroup.do'/>?groupProductId=${member.myGroup.groupProduct.id}&groupId=${member.myGroup.id}&memberId=${member.id}">
            <li>
              <p>${member.myGroup.groupProduct.productModel.product.name}[${member.myGroup.groupProduct.productModel.name}]</p>
              <p>${fn:substring(member.myGroup.createDateTime,0 ,19 )}</p>
              <c:if test="${member.status!=2&&member.myGroup.status=='1'}">
                <p>${member.myGroup.groupMemberList.size()}人/${member.myGroup.groupProduct.memberAmount}人成团</p>
              </c:if>
              <c:if test="${member.status!=2&&member.myGroup.status=='4'}">
                <p>${member.myGroup.groupMemberList.size()}人/${member.myGroup.groupProduct.memberAmount}人成团</p>
              </c:if>
              <c:if test="${member.status!=2&&member.myGroup.status=='3'}">
                <p>组团成功</p>
              </c:if>
              <c:if test="${member.status!=2&&member.myGroup.status=='5'}">
                <p>组团失败</p>
              </c:if>
              <c:forEach items="${member.myGroup.groupMemberList}" var="memberTemp" varStatus="rec">
                <c:if test="${memberTemp.level==0}">
                  <c:set var="user">
                    ${memberTemp.user.getUsername()}
                  </c:set>
                </c:if>
              </c:forEach>
              <p>团长:${fn:substring(user, 0,3 )}****${fn:substring(user,7,11)}</p>
              <c:if test="${member.myGroup.status=='1'}">
               <span>
                进行中
               </span>
              </c:if>
              <c:if test="${member.myGroup.status!='1'}">
               <span>
                拼团结束
               </span>
              </c:if>
            </li>
          </a>
        </c:forEach>
      </ul>
    </div>
  </div>
</div>
<!--悬浮订单-->
<div class="met-nav ae">
  <a href="<c:url value="/tuan.do"/>"><p><i class="met-1con m-icon"></i></p><p>团购首页</p></a>
  <a href="<c:url value="/person/myGroup.do"/>"><p><i class="met-2con m-icon"></i></p><p>我的团</p></a>
  <a href="<c:url value="/person/myPurchaseOrder.do"/>"><p><i class="met-3con m-icon"></i></p><p>我的订单</p></a>
  <a href="<c:url value="/person/personInfoView.do"/>"><p><i class="met-4con m-icon"></i></p><p>个人中心</p></a>
</div>
<!--//End--footer-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/scripts/wap/js/jquery.min.js"/>"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<c:url value="/scripts/wap/js/amazeui.min.js"/>"></script>
<!--自定义js--Start-->
<script src="<c:url value="/scripts/wap/js/system.js?v=20150831"/>"></script>
<script src="<c:url value="/scripts/wap/js/myorder.js?v=20150831"/>"></script>
<!--自定义js--End-->
<!--自定义js--End-->
</body>
</html>