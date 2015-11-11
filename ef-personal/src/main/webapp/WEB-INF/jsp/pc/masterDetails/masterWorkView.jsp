<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>大师详情作品简介</title>
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
    <%--<link type="text/css" rel="stylesheet" href="<c:url value='/scripts/assets/pc/css/amazeui.min.css?v=20150831'/>">--%>
    <%--<link type="text/css" rel="stylesheet" href="<c:url value='/scripts/assets/pc/css/app.css?v=20150831'/>">--%>
    <%--<link type="text/css" rel="stylesheet" href="<c:url value='/scripts/assets/pc/css/leader.css?v=20150831'/>">--%>
    <%--<script src="<c:url value='/scripts/assets/pc/js/jquery.min.js'/> "></script>--%>
</head>
<body>
<div class="list-find">
    <!--头部-->
    <div class="list-f-title">
        <p><a href="<c:url value='/masterMessage/introView/${work.masterId}'/>">大师</a><i class="fu-icon"></i><a
                href="<c:url value='/masterMessage/masterView/${work.masterId}'/>">主页</a><i class="fu-icon"></i><span>作品详情</span>
        </p>
    </div>
    <div class="ae">
        <div class="details ae">
            <div class="detaile-left">
                <div class="detaile-img"><img src="http://tenant.oss-cn-beijing.aliyuncs.com/${work.favicon}"></div>
                <div class="detaile-share ae" style="height: auto;z-index: 200;">
                    <!-- JiaThis Button BEGIN -->
                    <div class="jiathis_style" style="background: #fff;border: 0;float: left;padding: 30px 0;">
                        <a class="jiathis_button_weixin"></a>
                        <a class="jiathis_button_tqq"></a>
                        <a class="jiathis_button_tsina"></a>
                        <a class="jiathis_button_cqq"></a>
                    </div>
                    <div class="thumb-up">
                        <div class="thump-collect">
                            <a onclick="storeWork(this,'${work.id}');" href="javascript:void(0)" class="sc"><i
                                    class="s-icon"></i><em>收藏</em></a>
                        </div>
                        <div class="thump-assist">
                            <a onclick="praiseWork(this,'${work.id}');" href="javascript:void(0)"><i class="z-icon"></i><em>${work.storeAmount}</em></a>
                        </div>
                    </div>
                </div>
                <div class="detaile-intro ae">
                    <ul class="intro-matter ae">
                        <li class="active">简介</li>
                    </ul>
                    <div class="detaile-content">
                        <div class="master-tab intro">
                            <p>
                                ${work.content}
                            </p>
                        </div>
                    </div>
                </div>
                <!--评论-->
                <div class="detaile-comment ae">
                    <form>
                        <h4>评论</h4>
                        <ul class="comment ae" id="pubu">

                        </ul>
                        <div class="review ae">
                            <textarea></textarea>

                            <div class="btn1 ae">
                                <input type="button" onclick="subMainComment(this,'${work.id}',0);" class="btn"
                                       value="评论">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="detaile-right">
                <div class="f-right-gy ae">
                    <div class="h4"><span>传承人</span></div>
                    <div class="craft-master2">
                        <ul class="rf">
                            <li>
                                <div class="text">
                                    <a href="<c:url value='/masterMessage/introView/${object.id}'/>">
                                        <h4>${object.fullName}</h4></a>

                                    <p>${object.projectName}</p>

                                    <p><span><ming800:status name='level' dataType='Tenant.level'
                                                             checkedValue='${object.level}' type='normal'/>传承人</span>
                                    </p>
                                    <a class="btn-guan" onclick="followMaster(this,'${object.id}')">
                                        <c:if test="${object.followStatus == '已关注'}">
                                            <i class="gz-icon" style="display: none;"></i>
                                        </c:if>
                                        <c:if test="${object.followStatus == '关注'}">
                                            <i class="gz-icon"></i>
                                        </c:if>
                                        <em>${object.followStatus}</em>
                                    </a>
                                </div>
                                <div class="img"><a href="<c:url value='/masterMessage/introView/${object.id}'/>"><img
                                        src="http://tenant.oss-cn-beijing.aliyuncs.com/${object.favicon}"></a></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function subComment(o, fatherId, workId ,parentId) {
        var content = $(o).parent().prev().val();
        $.ajax({
            type: "post",//设置get请求方式
            url: "<c:url value='/masterMessage/commentWork.do'/>",//设置请求的脚本地址
            data: "content=" + content + "&fatherId=" + fatherId + "&workId=" + workId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                var box;
                if(parentId == '0'){
                    box = $(o).parent().parent().parent();
                }else{
                    box = $(o).parent().parent().parent().parent().parent();
                }
//                var box = $(o).parent().parent().parent().parent().parent();
                if (data != "noRole") {
                    var userName = data.user.name2;
                    if (userName == null) {
                        userName = "匿名用户";
                    }
                }
                var cTime = transdate(data.createDateTime);
                if (data == "noRole") {
                    alert("您还没有登录,请登录后操作!");
                } else {
                    var sub = "<li class=\"ae\" id=\""+data.id+"\">" +
                            "<div class=\"img\"><a href=\"#\"><img class=\"am-circle\" src=\"" + data.favicon + "\"></a></div>" +
                            "   <div class=\"text\"><span><a href=\"#\">" + userName + " ：</a></span><span>" + content + "</span></div>" +
                            "     <div class=\"status ae\">" +
                            "       <div class=\"status-left\"><span>" + cTime + "</span></div>" +
                            "          <div class=\"status-right\">" +
                            "          <div class=\"\"><a>回复</a></div>" +
                            "          <div class=\"zan\">" +
                            "             <a onclick=\"praiseWorkComment(this,'" + data.id + "','" + workId + "');\"><i class=\"icon\"></i> <em>" + data.amount + "</em></a>" +
                            "          </div>" +
                            "         </div>" +
                            "       </div>" +
                            "     <div class=\"review ae\" style=\"display: none;\">" +
                            "     <textarea></textarea>" +
                            "     <div class=\"btn1 ae\">" +
                            "        <input type=\"button\" onclick=\"subComment(this,'" + data.id + "','" + workId + "' , '"+parentId+"');\" class=\"btn\" value=\"评论\">" +
                            "     </div>" +
                            "  </div>" +
                            "</li>";
                    box.after(sub);
                }
                return false;
            }
        })
    }
    function subMainComment(o, msgId, parentId) {
        var content = $(o).parent().prev().val();
        $.ajax({
            type: "post",//设置get请求方式
            url: "<c:url value='/masterMessage/commentWork.do'/>",//设置请求的脚本地址
            data: "content=" + content + "&fatherId=" + parentId + "&workId=" + msgId,//设置请求的数据
            async: false,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                var box = $(o).parent().parent().prev();
                var cTime = transdate(data.createDateTime);
                if (data == "noRole") {
                    alert("您还没有登录,请登录后操作!");
                } else {
                    var userName = data.user.name2;
                    if (userName == null) {
                        userName = "匿名用户";
                    }
                    var sub = "<li class=\"ae\">" +
                            "<div class=\"img\"><a href=\"#\"><img class=\"am-circle\" src=\"" + data.favicon + "\"></a></div>" +
                            "   <div class=\"text\"><span><a href=\"#\">" + userName + " ：</a></span><span>" + content + "</span></div>" +
                            "     <div class=\"status ae\">" +
                            "       <div class=\"status-left\"><span>" + cTime + "</span></div>" +
                            "          <div class=\"status-right\">" +
                            "          <div class=\"hf\"><a href=\"javascript:void(0);\">回复</a></div>" +
                            "          <div class=\"zan\">" +
                            "              <a onclick=\"praiseWorkComment(this,'" + data.id + "','" + msgId + "');\"><i class=\"icon\"></i> <em>" + data.amount + "</em></a>" +
                            "          </div>" +
                            "          </div>" +
                            "         </div>" +
                            "       </div>" +
                            "     <div class=\"review ae\" style=\"display: none;\">" +
                            "     <textarea></textarea>" +
                            "     <div class=\"btn1 ae\">" +
                            "        <input type=\"button\" onclick=\"subComment(this,'" + data.id + "','" + msgId + "','"+parentId+"');\" class=\"btn\" value=\"评论\">" +
                            "     </div>" +
                            "  </div>" +
                            "</li>";
                    box.append(sub);
                }
            }
        })
    }
    function followMaster(o, masterId) {
        var str;
        $.ajax({
            type: "post",//设置get请求方式
            url: "<c:url value='/masterMessage/followMaster.do'/>",//设置请求的脚本地址
            data: "masterId=" + masterId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                if(data == "noRole"){
                    alert("您还未登录,请登录后操作!");
                }else if(data=="add"){
                    $(o).find('.gz-icon').hide();
                    $(o).find("em").html("已关注");
                }else if(data=="del"){
                    $(o).find('.gz-icon').show();
                    $(o).find("em").html("关注");
                }
            }
        })
    }
    function praiseWork(o, workId) {
        $.ajax({
            type: "get",//设置get请求方式
            url: "<c:url value='/masterMessage/praiseWork/'/>" + workId,//设置请求的脚本地址
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                if (data == "noRole") {
                    alert("您还未登录,请登录后操作!");
                } else if (data == "add") {
                    var num = parseInt($(o).find('em').html());
                    $(o).find("em").html(num + 1);
                } else if (data == "del") {
                    var num = parseInt($(o).find('em').html());
                    $(o).find("em").html(num - 1);
                }
            }
        })
    }
    function storeWork(o, workId) {
        $.ajax({
            type: "post",//设置get请求方式
            url: "<c:url value='/masterMessage/storeWork/'/>" + workId,//设置请求的脚本地址
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                console.log(data);
                if (data == "noRole") {
                    alert("您还未登录,请登录后操作!");
                } else if (data == "add") {
                    $(o).find('em').html('已收藏')
                } else if (data == "del") {
                    $(o).find('em').html('收藏')
                }
            }
        })
    }
    function transdate(endTime) {
        var timestamp = Date.parse(new Date());
        var oldTime = parseInt(endTime);
        var intervalTime = (timestamp - oldTime) / 1000 / 60;
        var showTime = "";
        if (intervalTime <= 59) {
            showTime = intervalTime.toFixed(0) + "分钟前";
        } else if (1 <= (intervalTime / 60) && (intervalTime / 60) < 24) {
            showTime = (intervalTime / 60).toFixed(0) + "小时前";
        } else if (1 <= (intervalTime / 60 / 24) && (intervalTime / 60 / 24) <= 30) {
            showTime = (intervalTime / 60 / 24).toFixed(0) + "天前";
        } else {
            showTime = new Date(oldTime).toLocaleString().replace(/:\d{1,2}$/, ' ');
        }
        return showTime;
    }
    $(document).ready(function () {
        getData();
    })
    function getData() {
        var workId = "${work.id}";
        $.ajax({
            type: "get",//设置get请求方式
            url: "<c:url value='/masterMessage/getWorkComment.do'/>",//设置请求的脚本地址
            data: "workId=" + workId,//设置请求的数据
            async: false,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                var box = $("#pubu");
                if (data != null && data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                        var userName = data[i].user.name2;
                        if (userName == null) {
                            userName = "匿名用户";
                        }
                        var cTime = transdate(data[i].createDateTime);
                        var sub = "<li class=\"ae\" id=\"father" + data[i].id + "\">" +
                                "                                <div class=\"img\"><a href=\"#\"><img class=\"am-circle\" src=\"" + data[i].favicon + "\"></a></div>" +
                                "                                <div class=\"text\"><span><a href=\"#\">" + userName + " ：</a></span><span>" + data[i].content + "</span></div>" +
                                "                                <div class=\"status ae\">" +
                                "                                    <div class=\"status-left\"><span>" + cTime + "</span></div>" +
                                "                                    <div class=\"status-right\">" +
                                "                                        <div class=\"hf\"><a href=\"javascript:void(0);\">回复</a></div>" +
                                "                                        <div class=\"zan\">" +
                                "                                            <a onclick=\"praiseWorkComment(this,'" + data[i].id + "','" + workId + "');\"><i class=\"icon\"></i> <em>" + data[i].amount + "</em></a>" +
                                "                                        </div>" +
                                "                                    </div>" +
                                "                                </div>" +
                                "                                <div class=\"review ae\" style=\"display: none;\">" +
                                "                                    <textarea></textarea>" +
                                "                                    <div class=\"btn1 ae\">" +
                                "                                        <input type=\"button\" onclick=\"subComment(this,'" + data[i].id + "','" + workId + "','0');\" class=\"btn\" value=\"评论\">" +
                                "                                    </div>" +
                                "                                </div>" +
                                "                            </li>";
                        getSubCommentByFatherId(data[i].id, userName, true);
                        box.append(sub);
                    }
                }
            }
        })
    }
    function getSubCommentByFatherId(fatherId, name, flag) {
        var workId = "${work.id}";
        $.ajax({
            type: "get",//设置get请求方式
            url: "<c:url value='/masterMessage/getSubCommentList.do'/>",//设置请求的脚本地址
            data: "fatherId=" + fatherId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                console.log(data);
                if (data && data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var box = $("#father" + fatherId);
                        var userName = data[i].user.name2;
                        if (userName == null) {
                            userName = "匿名用户";
                        }
                        var cTime = transdate(data[i].createDateTime);
                        if (i == 0 && flag == true) {
                            var sub = "<ul class=\"add-obtain\" id=\"" + fatherId + "\">" +
                                    "                                    <li style=\"margin: 0;border-bottom: 0;\" class=\"obtain\">" +
                                    "                                        <div class=\"ae\">" +
                                    "                                            <div class=\"img\"><a href=\"#\"><img class=\"am-circle\" src=\"" + data[i].favicon + "\"></a></div>" +
                                    "                                            <div class=\"text\"><span><a href=\"#\">" + userName + " 回复 " + name + "：</a></span><span>" + data[i].content + "</span></div>" +
                                    "                                            <div class=\"status ae\">" +
                                    "                                                <div class=\"status-left\"><span>" + cTime + "</span></div>" +
                                    "                                                <div class=\"status-right\">" +
                                    "                                                    <div class=\"ef\"><a onclick=\"getHfProduct2(this)\">回复</a></div>" +
                                    "                                                    <div class=\"zan\">" +
                                    "                                                        <a onclick=\"praiseWorkComment(this,'" + data[i].id + "','" + workId + "');\"><i class=\"icon\"></i> <em>" + data[i].amount + "</em></a>" +
                                    "                                                    </div>" +
                                    "                                                </div>" +
                                    "                                            </div>" +
                                    "                                            <div class=\"review-sr ae\" style=\"display: none;\">" +
                                    "                                                <textarea></textarea>" +
                                    "                                                <div class=\"btn1 ae\">" +
                                    "                                                    <input type=\"button\" onclick=\"subComment(this,'" + data[i].id + "','" + workId + "','"+fatherId+"');\" class=\"btn\" value=\"评论\">" +
                                    "                                                </div>" +
                                    "                                            </div>" +
                                    "                                        </div>" +
                                    "                                    </li>" +
                                    "                                </ul>";
                            box.append(sub);
                        } else {
                            var sub = "<li style=\"margin: 0;border-bottom: 0;\" id=\"" + data[i].id + "\" class=\"obtain\">" +
                                    "                                        <div class=\"ae\">" +
                                    "                                            <div class=\"img\"><a href=\"#\"><img class=\"am-circle\" src=\"" + data.favicon + "\"></a></div>" +
                                    "                                            <div class=\"text\"><span><a href=\"#\">" + userName + " 回复 " + name + "：</a></span><span>" + data[i].content + "</span></div>" +
                                    "                                            <div class=\"status ae\">" +
                                    "                                                <div class=\"status-left\"><span>" + cTime + "</span></div>" +
                                    "                                                <div class=\"status-right\">" +
                                    "                                                    <div class=\"ef\"><a onclick=\"getHfProduct2(this)\">回复</a></div>" +
                                    "                                                    <div class=\"zan\">" +
                                    "                                                        <a onclick=\"praiseWorkComment(this,'" + data[i].id + "','" + workId + "');\"><i class=\"icon\"></i> <em>" + data[i].amount + "</em></a>" +
                                    "                                                    </div>" +
                                    "                                                </div>" +
                                    "                                            </div>" +
                                    "                                            <div class=\"review-sr ae\" style=\"display: none;\">" +
                                    "                                                <textarea></textarea>" +
                                    "                                                <div class=\"btn1 ae\">" +
                                    "                                                    <input type=\"button\" onclick=\"subComment(this,'" + data[i].id + "','" + workId + "','"+fatherId+"');\" class=\"btn\" value=\"评论\">" +
                                    "                                                </div>" +
                                    "                                            </div>" +
                                    "                                        </div>" +
                                    "                                    </li>";
                            $("#" + fatherId).after(sub);
                        }
                        getSubCommentByFatherId(data[i].id, userName, false);
                    }
                }
            }
        })
    }
    function praiseWorkComment(o, commentId, workId) {
        $.ajax({
            type: "post",//设置get请求方式
            url: "<c:url value='/masterMessage/praiseWorkComment.do'/>",//设置请求的脚本地址
            data: "workId=" + workId + "&commentId=" + commentId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                var num = $(o).find("em").html();
                if (data == "noRole") {
                    alert("您还未登录,请登录后操作!");
                } else if (data == "del") {
                    if (num != "0") {
                        $(o).find("em").html(parseInt(num) - 1);
                    } else {
                        $(o).find("em").html(0);
                    }
                } else if (data == "add") {
                    if (num != "0") {
                        $(o).find("em").html(parseInt(num) + 1);
                    } else {
                        $(o).find("em").html(1);
                    }
                }
            }
        })
    }
    function praiseMessage(o, msgId) {
        $.ajax({
            type: "get",//设置get请求方式
            url: "<c:url value='/masterMessage/praiseMessage.do'/>",//设置请求的脚本地址
            data: "msgId=" + msgId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                if (data == "noRole") {
                    alert("您还没有登录,请登录后操作!");
                } else if (data == "add") {
                    alert("成功!");
                } else if (data == "del") {
                    alert("已取消点赞");
                }
            }
        })
    }
    function storeMessage(msgId) {
        $.ajax({
            type: "get",//设置get请求方式
            url: "<c:url value='/masterMessage/storeMessage.do'/>",//设置请求的脚本地址
            data: "msgId=" + msgId,//设置请求的数据
            async: true,
            dataType: "json",//设置请求返回的数据格式
            success: function (data) {
                if (data == "noRole") {
                    alert("您还没有登录,请登录后操作!");
                } else if (data == "add") {
                    alert("收藏成功!");
                } else if (data == "del") {
                    alert("已取消收藏!");
                }
            }
        })
    }
    function getHfProduct2(e) {

        $(e).parent().parent().parent().parent().find(".review-sr").slideToggle();
        return false;

    }
</script>
<!-- //End--footer-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value='/scripts/assets/pc/js/amazeui.ie8polyfill.min.js'/>"></script>
<![endif]-->
<script src="<c:url value='/scripts/assets/pc/js/system.js'/>"></script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<script src="<c:url value='/scripts/assets/pc/js/cyclopedia.js'/>"></script>
</body>
</html>

