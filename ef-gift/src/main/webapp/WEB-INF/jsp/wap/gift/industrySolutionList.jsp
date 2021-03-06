<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <title>礼品频道</title>
</head>
<body>
<header id="header" class="am-header custom-header newheader">
  <div class="am-header-left am-header-nav">
    <a href="javascript:history.go(-1)" class="chevron-left"></a>
  </div>
  <!-- //End--chevron-left-->
  <h1 class="am-header-title">企业礼品</h1>
  <!-- //End--title-->
  <div class="am-header-right am-header-nav">
    <a href="#chevron-right" class="chevron-right" id="menu">
      <i class="line"></i>
    </a>
  </div>
  <div class="menu-list">
    <ul class="bd">
      <li><a href="http://j.efeiyi.com/ef-gift" title="礼品首页">礼品首页</a></li>
    </ul>
  </div>
</header>
<div class="gift gift-asp">
  <div data-am-widget="slider" class="am-slider am-slider-a4 img-slider" data-am-slider='{&quot;directionNav&quot;:false}' >
    <ul class="am-slides">
      <c:if test="${bannerList != null && bannerList != ''}">
        <c:forEach items="${bannerList}" var="banner">
          <li><a href="${banner.wapUrl}"><img src="http://gift-oss.efeiyi.com/${banner.imageUrl}@!gift-banner"></a></li>
        </c:forEach>
      </c:if>
    </ul>
  </div>
  <!--//End--轮播图-->
  <c:if test="${industrySolutionMap != null && industrySolutionMap != ''}">
    <c:forEach items="${industrySolutionMap}" var="industrySolution">
      <div class="bd ht">
        <div class="title">
          <h3>${industrySolution.key.solutionName}</h3>
          <h4>${industrySolution.key.introduction}</h4>
          <a class="btn-link" href="<c:url value="/industrySolutionRequest"/>" title="方案定制">方案定制</a>
        </div>
        <div class="bd list">
          <ul class="ul-col-2">
            <c:forEach items="${industrySolution.value}" var="productGiftIndustrySolution">
            <li><a href="" title=""><img src="http://pro.efeiyi.com/${productGiftIndustrySolution.productGift.productModel.productModel_url}" alt=""><span class="txt-abs"><em>${subjectProduct.product.name}</em></span></a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </c:forEach>
  </c:if>
  <!--//ENd--金融行业礼品方案-->
  <div class="bd ht ht-diy">
    <div class="title">
      <h3>定制流程</h3>
      <img class="bd" src="<c:url value="/scripts/wap/images/gift-path.png"/>" alt="">
      <a class="btn-link" href="tel:4008768766" title="马上咨询">马上咨询</a>
      <p>咨询热线：4008768766</p>
    </div>
  </div>
  <!--//ENd--定制流程-->

</div>
</body>
</html>
