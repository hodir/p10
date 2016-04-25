<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>礼物筛选</title>
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/css/amazeui.min.css"/>">
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/css/layout.css"/>">
  <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/css/gift.css"/>">
</head>
<body>
<div class="top2016">
  <div class="hd">
    <div class="tips fl"><i class="min-logo"></i>汇聚东方工艺精粹</div>
    <div class="search-gift">
      <form action="">
        <input type="text" value="" placeholder="搜索" class="ipt">
        <input type="submit" value="" class="icon2016-gift btn">
      </form>
      <div class="gift-link">
        <a href="">剪纸</a>
        <span class="icon2016-gift"></span>
        <a href="">景泰蓝</a>
        <span class="icon2016-gift"></span>
        <a href="">湘绣</a>
        <span class="icon2016-gift"></span>
        <a href="">苏绣</a>
        <span class="icon2016-gift"></span>
        <a href="">铜雕</a>
        <span class="icon2016-gift"></span>
        <a href="">鼻烟壶</a>
        <span class="icon2016-gift"></span>
        <a href="">金银丝镶嵌</a>
      </div>
    </div>
  </div>
</div>
<!--//End--topbar-->
<div class="nav2016 bgc">
  <div class="hd bgf">
    <div id="cate" class="cate">
      <div class="dt"><span href="" title="">全部商品<i class="icon2016 icon-arrow"></i></span></div>
      <div class="dd" style="display:none">
        <div class="layer">
          <ul>
            <li class="title"><strong>陶冶烧造：</strong></li>
            <li><a href="">唐三彩</a></li>
            <li><a href="">紫砂</a></li>
            <li><a href="">越窑青瓷</a></li>
            <li><a href="">景泰蓝</a></li>
            <li><a href="">龙泉青瓷</a></li>
            <li><a href="">景德镇陶瓷</a></li>
            <li><a href="">铂玉瓷</a></li>
            <li><a href="">南宋官窑瓷</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>传统美术：</strong></li>
            <li><a href="">唐卡</a></li>
            <li><a href="">剪纸</a></li>
            <li><a href="">绢人</a></li>
            <li><a href="">内画</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>金石錾锻：</strong></li>
            <li><a href="">藏书澄泥石刻</a></li>
            <li><a href="">花丝镶嵌</a></li>
            <li><a href="">铜雕</a></li>
            <li><a href="">金银丝镶嵌</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>如胶似漆：</strong></li>
            <li><a href="">平遥推光漆器</a></li>
            <li><a href="">厦门漆线雕</a></li>
            <li><a href="">漆器</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>织染印秀：</strong></li>
            <li><a href="">苏绣</a></li>
            <li><a href="">蜀绣</a></li>
            <li><a href="">蓝印花布</a></li>
            <li><a href="">丝雕</a></li>
            <li><a href="">庆阳香包绣</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>琢玉成器：</strong></li>
            <li><a href="">北京玉雕</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>木作编扎：</strong></li>
            <li><a href="">竹编</a></li>
            <li><a href="">南阳藤编</a></li>
            <li><a href="">东阳木雕</a></li>
          </ul>
        </div>
        <div class="layer">
          <ul>
            <li class="title"><strong>文房四宝：</strong></li>
            <li><a href="">粉蜡扎</a></li>
            <li><a href="">端砚</a></li>
            <li><a href="">连四纸</a></li>
          </ul>
        </div>

        <div class="layer">
          <ul>
            <li class="title"><strong>创意生活：</strong></li>
            <li><a href="">传统家具</a></li>
            <li><a href="">香道</a></li>
            <li><a href="">传统手工皂</a></li>
            <li><a href="">办公用品</a></li>
            <li><a href="">尼布藏香</a></li>
            <li><a href="">茶道用品</a></li>
            <li><a href="">摆件</a></li>
            <li><a href="">荷香</a></li>
            <li><a href="">芦苇画</a></li>
            <li><a href="">皮包皮具</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!--//End--分类-->
    <div class="navitems">
      <ul>
        <li><a href="<c:url value="/home.do"/>" title="">首页</a></li>
        <li><a href="<c:url value="/industrySolution.do"/>" title="">企业礼品</a></li>
        <li><a href="" title="">国礼轶事</a></li>
        <li><a href="" title="">礼尚往来</a></li>
        <li><a href="" title="">礼品专区</a></li>
      </ul>
    </div>
    <!--//End--导航-->

    <!--//End--搜索-->
  </div>
</div>
<!--//End--nav2016-->
<div class="gift2016">
  <div class="screen">
    <div class="min-nav">
      <p><a href="">首页</a><i>></i><a href="" class="pitch-on">礼品选购</a></p>
    </div>
    <div class="gift-screen">
      <div class="list-group">
        <div class="head">送礼场合 :</div>
        <ul class="body">
          <li class="active"><a href="javascript:void(0)">全部</a></li>
          <li><a href="javascript:void(0)">商务</a></li>
          <li><a href="javascript:void(0)">外事</a></li>
          <li><a href="javascript:void(0)">情人节</a></li>
          <li><a href="javascript:void(0)">新年</a></li>
          <li><a href="javascript:void(0)">圣诞</a></li>
          <li><a href="javascript:void(0)">结婚</a></li>
          <li><a href="javascript:void(0)">乔迁</a></li>
          <li><a href="javascript:void(0)">生日</a></li>
          <li><a href="javascript:void(0)">纪念日</a></li>
        </ul>
      </div>
      <div class="list-group">
        <div class="head">送礼对象 :</div>
        <ul class="body">
          <li ><a href="javascript:void(0)">全部</a></li>
          <li class="active"><a href="javascript:void(0)">男人</a></li>
          <li><a href="javascript:void(0)">女人</a></li>
          <li><a href="javascript:void(0)">儿童</a></li>
          <li><a href="javascript:void(0)">老人</a></li>
          <li><a href="javascript:void(0)">岳母</a></li>
          <li><a href="javascript:void(0)">父母</a></li>
          <li><a href="javascript:void(0)">外国人</a></li>
          <li><a href="javascript:void(0)">IT男</a></li>
          <li><a href="javascript:void(0)">文艺女</a></li>
          <li><a href="javascript:void(0)">怪蜀黍</a></li>
        </ul>
      </div>
      <div class="list-group">
        <div class="head">商品分类 :</div>
        <ul class="body">
          <li class="active"><a href="javascript:void(0)">全部</a></li>
          <li><a href="javascript:void(0)">陶冶烧造</a></li>
          <li><a href="javascript:void(0)">木作编扎</a></li>
          <li><a href="javascript:void(0)">织染印绣</a></li>
          <li><a href="javascript:void(0)">传统美术</a></li>
          <li><a href="javascript:void(0)">琢玉成器</a></li>
          <li><a href="javascript:void(0)">金石錾段</a></li>
        </ul>
      </div>
      <div class="list-group">
        <div class="head">商品价格 :</div>
        <ul class="body">
          <li class="active"><a href="javascript:void(0)">全部</a></li>
          <li><a href="javascript:void(0)">百元以内</a></li>
          <li><a href="javascript:void(0)">100~1000</a></li>
          <li><a href="javascript:void(0)">1000~5000</a></li>
          <li><a href="javascript:void(0)">5000~1万</a></li>
          <li><a href="javascript:void(0)">1万~10万</a></li>
          <li><a href="javascript:void(0)">10万以上</a></li>
        </ul>
      </div>
    </div>
    <div class="gift-sort">
      <ul class="rank">
        <li>综合排序</li>
        <!--带tall是价格上，不带tall是价格下-->
        <li ><a href="javascript:void(0)"    class="tall">价格<i class="icon"></i></a></li>
        <li><a href="">销量</a></li>
        <li><a href="">新品</a></li>
        <li><a href="">人气</a></li>
      </ul>
      <!-- <div class="select">
           <div class="s-list">
               <input type="checkbox">
               <span>诚品宝认证</span>
           </div>
           <div class="s-list">
               <input type="checkbox" >
               <span>推荐精品</span>
           </div>
           <div class="s-list">
               <input type="checkbox" >
               <span>纯手工制作</span>
           </div>
           <div class="s-list ">
               <a href="" class="active">商品</a><span>丨</span><a href="">店铺</a>
           </div>
       </div>-->
    </div>
    <div class="gs-list">
      <div class="more">还在为“丈母娘”送礼发愁？<a href="">看看礼品攻略吧 ></a></div>
      <ul class="list">
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
        <li>
          <a href="">
            <img src="shop2016/upload/carf2016.jpg" alt="">
            <div class="list-content">
              <p class="name">生日好礼生日好礼生日好礼生日好礼</p>
              <p class="title">￥<em>50.00</em></p>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <ul class="pg-number">
      <!-- 页码如果在首页，“首页”+“上一页”变灰-->
      <li class="first"><a href="" class="true">首页</a></li>
      <li class="prev"><a href=""  class="true">上一页</a></li>
      <li class="active"><a href="" class="number">1</a></li>
      <li><a href="" class="number">2</a></li>
      <li><a href="" class="number">3</a></li>
      <li><a href="" class="number">4</a></li>
      <li><a href="" class="number">5</a></li>
      <li><a href="" class="number">6</a></li>
      <li><a href="" class="number">7</a></li>
      <li class="next"><a href="">下一页</a></li>
      <li class="trail"><a href="">尾页</a></li>
    </ul>
    <ul class="gift-red">
      <li><img src="shop2016/upload/gift-pic2.jpg" alt=""><a href="">进入店铺</a></li>
      <li><img src="shop2016/upload/carf2016.jpg" alt=""><a href="">进入店铺</a></li>
      <li><img src="shop2016/upload/carf2016.jpg" alt=""><a href="">进入店铺</a></li>
      <li><img src="shop2016/upload/carf2016.jpg" alt=""><a href="">进入店铺</a></li>
    </ul>
  </div>

</div>
<!--//End--craft2016-->
<div class="footernew wh">
  <div class="servicenew wh">
    <div class="hd tct">
      <div class=" foremax">
        <dl class="fore">
          <dt>帮助中心</dt>
          <dd><a href="/document/helpCenter?group=ec.gwlc" target="_blank">购物流程</a></dd>
          <dd><a href="/document/helpCenter?group=ec.zffs" target="_blank">支付方式</a></dd>
          <dd><a href="/document/helpCenter?group=ec.psfs" target="_blank">配送方式</a></dd>
        </dl>
        <dl class="fore">
          <dt>商家服务</dt>
          <dd><a href="/document/helpCenter?group=ec.rzxz" target="_blank">入驻须知</a></dd>
          <dd><a href="/document/helpCenter?group=ec.rzlc" target="_blank">入驻流程</a></dd>
          <dd><a href="/document/helpCenter?group=ec.rzzx" target="_blank">入驻咨询</a></dd>
        </dl>
        <dl class="fore">
          <dt>售后流程</dt>
          <dd><a href="/document/helpCenter?group=ec.thlc" target="_blank">退货流程</a></dd>
          <dd><a href="/document/helpCenter?group=ec.hhlc" target="_blank">换货流程</a></dd>
        </dl>
        <dl class="fore">
          <dt>服务保障</dt>
          <dd><a href="/document/helpCenter?group=ec.zpbz" target="_blank">正品保障</a></dd>
          <dd><a href="/document/helpCenter?group=ec.shzc" target="_blank">售后政策</a></dd>
        </dl>
        <dl class="fore">
          <dt>法律声明</dt>
          <dd><a href="/document/helpCenter?group=ec.flsm" target="_blank">法律声明</a></dd>
          <dd><a href="/document/helpCenter?group=ec.aqjyssm" target="_blank">安全及隐私声明</a></dd>
        </dl>
        <div class="wechatnew" title="手机e飞蚁">
          <i class="inro-icon0"></i>
          <i class="inro-icon"></i>
        </div>
      </div>
    </div>
  </div>
  <div class="max-links wh">
    <div class="links wh">
      <a href="/document/aboutUs?group=ec.gywm" target="_blank" title="关于我们"><i class="icon"></i>关于我们</a>
      <a href="/document/aboutUs?group=ec.ptys" target="_blank" title="平台优势"><i class="icon"></i>平台优势</a>
      <a href="/document/aboutUs?group=ec.cpyc" target="_blank" title="诚聘英才"><i class="icon"></i>诚聘英才</a>
      <a href="/document/aboutUs?group=ec.lxwm" target="_blank" title="联系我们"><i class="icon"></i>联系我们</a>
      <a href="/document/aboutUs?group=ec.yjfk" target="_blank" title="意见反馈"><i class="icon"></i>意见反馈</a>
      <a href="/document/aboutUs?group=ec.fyjj" target="_blank" title="非遗简介"><i class="icon"></i>非遗简介</a>
    </div>
    <div class="copyright wh">
      <div class="frlinksimg">
        <div class="simgbox">
          <strong>战略合作伙伴</strong>
          <a class="icon1" href="http://en.unesco.org/" title="联合国教科文组织" target="_blank"></a><em class="line"></em><a class="icon3" title="中国非物质文化遗产保护协会"></a><em class="line"></em><a class="icon2" title="中国非物质文化遗产保护协会"></a>
        </div>
      </div>

    </div>
    <!--<div class="copyright wh">
        <div class="phone">
            <strong>商家入驻热线</strong>
            <em>400-876-8766</em>
        </div>
        <div class="frlinks">
            <span>友情链接：</span>
            <a rel="nofollow" href="http://www.unesco.org.cn/" target="_blank" title="联合国教科文组织">联合国教科文组织</a>
            <a rel="nofollow" href="http://www.mcprc.gov.cn/" target="_blank" title="中国文化部">中国文化部</a>
            <a rel="nofollow" href="" target="_blank" title="中国文化部非物质文化遗产保护司">中国文化部非物质文化遗产保护司</a>
            <a rel="nofollow" href="" target="_blank" title="中国非物质文化遗产保护中心">中国非物质文化遗产保护中心</a>
        </div>
        <div class="info">Copyright ? 2012-2022 永新华韵文化发展有限公司版权所有-京ICP备15032511号-1</div>
    </div>-->
    <div class="wh authentication">
      <div class="info">Copyright © 2012-2022 永新华韵文化发展有限公司版权所有-京ICP备15032511号-1</div>
      <a href="http://www.miitbeian.gov.cn" target="_blank" title=""> <img class="imgfilter" src="/scripts/images/authentication-0.png" alt=""></a>
      <a href="http://www.miitbeian.gov.cn" target="_blank" title="网站域名备案"> <img class="imgfilter" src="/scripts/images/authentication-1.png" alt="网站域名备案"></a>
      <a href="http://www.baic.gov.cn/" target="_blank" title="企业信用信息备案"> <img class="imgfilter" src="/scripts/images/authentication-2.png" alt="企业信用信息备案"></a>
      <a href="/scripts/images/license.jpg" target="_blank" title="企业营业执照"> <img class="imgfilter" src="/scripts/images/authentication-3.png" alt="企业营业执照 "></a>
    </div>
  </div>
</div>
<!--//End--homenew-->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/scripts/js/jquery.min.js"/>"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/scripts/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->



<script src="<c:url value="/scripts/js/system.js"/>"></script>
<script>

</script>
</body>
</html>
