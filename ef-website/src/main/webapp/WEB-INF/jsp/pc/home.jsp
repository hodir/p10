<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/17
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <title>e飞蚁-领先的非物质文化遗产电商平台</title>
    <meta name="keywords" content="e飞蚁,非物质文化遗产,中国非物质文化遗产,非物质文化遗产网,非遗博览园,非遗节,非遗产品,非遗大师,传统工艺,非遗"/>
    <meta name="description" content="e飞蚁，中国领先的非物质文化遗产电商与交流平台，汇聚诸多传承人和各类传统工艺"/>
</head>
<body>


<!-- //End--topbar-->
<div id="slide2016" class="slide2016" style="margin-top:20px;">
    <div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{"controlNav":false}' data-am-flexslider="{playAfterPaused: 2000}" data-am-slider='{&quot;directionNav&quot;:false}'>
        <ul class="am-slides" >
            <c:forEach items="${bannerList}" var="banner" varStatus="status">
            <li><a href="javascript:vido(0)"><img src="http://pro.efeiyi.com/${banner.imageUrl}"></a></li>
            </c:forEach>
        </ul>
    </div>
</div>


<div class="homenew hd">
    <div class="deduce ae">
        <ul class="list-top">
            <c:if test="${not empty marketingActivityQueryList&&fn:length(marketingActivityQueryList)>0}">
                <c:forEach items="${marketingActivityQueryList}" var="marketingActivity" begin="0" end="3">
                    <li><a href="${marketingActivity.redirect}" target="_blank"><img class="imgfilter" alt="非遗"
                                                                                     src="http://pro.efeiyi.com/${marketingActivity.img}@!pc-home-marketing-activity"></a>
                    </li>
                </c:forEach>
            </c:if>
        </ul>
        <ul class="list-bottom ae">
            <c:if test="${not empty hotSaleList&&fn:length(hotSaleList)>0}">
                <c:forEach items="${hotSaleList}" var="hotSale" begin="0" end="7">
                    <li>
                        <a href="${hotSale.redirect}" target="_blank" title="非遗">
                            <strong>${hotSale.name}</strong>
                            <span class="mask"></span>
                            <img class="imgfilter" alt="非遗" src="http://pro.efeiyi.com/${hotSale.img}">
                        </a>
                        <span class="money"><em>￥</em><font>${hotSale.price}</font></span>
                    </li>
                </c:forEach>
            </c:if>
        </ul>
    </div>
    <!-- 放banner-->
    <div><a href="${bannerActivityList[0].redirect}" target="_blank" title="非遗"><img
            src="http://pro.efeiyi.com/${bannerActivityList[0].img}@!pc-banner-advertisement" alt="非遗"/></a></div>
    <div class="max-cat ae">
        <!--一个类别-->
        <c:forEach items="${recommendedCategoryList}" var="projectCategory">
            <div class="category ae">
                <div class="cat-left">
                    <div class="cat-title">${projectCategory.name}</div>
                    <div class="cat-txt ">${projectCategory.context}</div>
                        <%--<div class="cat-txt c-tx2">不困于情</div>--%>
                    <div class="c-o-list">
                        <c:forEach items="${projectMap.get(projectCategory.id)}" var="project">
                            <a href="<c:url value="/product/list/${project.id}"/>" target="_blank" title="非遗">${project.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <ul class="cat-right">
                    <c:forEach items="${recommendMap.get(projectCategory.id)}" var="projectCategoryProductModel"
                               varStatus="status">
                        <li>
                            <a href="<c:url value="/product/hot/${projectCategoryProductModel.productModel.id}"/>"
                               target="_blank">
                                <strong>${projectCategoryProductModel.productModel.product.name}</strong>
                                <img class="imgfilter" alt="非遗"
                                     src="http://pro.efeiyi.com/${projectCategoryProductModel.productModel.product.getProductPicture().pictureUrl}@!pc-recommend-list">
                            </a>
                            <span class="cat-money"><em>￥</em><font>${projectCategoryProductModel.productModel.price.intValue()}</font></span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
        <!--一个类别-->
    </div>
</div>
<!--//End--homenew-->
</div>
<script type="text/javascript">
    $().ready(function () {
        ;
        $(".allsort").show()
        $(".cate").removeAttr("id");
    })
</script>
</body>
</html>