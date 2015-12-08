<%@ page import="com.efeiyi.ec.system.organization.util.AuthorizationUtil" %>
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

<html>
<head>
  <title></title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/scripts/css/seller.css?v=20151207"/> ">
</head>
<body>
   <c:if test="${review=='1'}">
           <div class="wh step">
               <div class="step1"></div>
           </div>
           <div class="wh info">
               <div class="table">
                   <div class="enter-btn .wh"><a href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/> ">我&nbsp;要&nbsp;入&nbsp;驻</a></div>
                   <div class="enter-flow wh">入&nbsp;住&nbsp;流&nbsp;程</div>
                   <div class="wh enter-wh">
                       <div class="enter-list">
                           <dl>
                               <dt>注&nbsp;&nbsp;册<i class="enter-1"></i></dt>
                               <dd>
                                   <p>注册e飞蚁个人用户账号<i class="txt-icon"></i></p>
                                   <p>点击我要入驻<i class="txt-icon"></i></p>
                                   <p>同意入驻协议<i class="txt-icon"></i></p>
                               </dd>
                           </dl>
                           <dl>
                               <dt>填写/提交信息及资料<i class="enter-2"></i></dt>
                               <dd>
                                   <p>填写公司/个体/个人信息，提交资质<i class="txt-icon"></i></p>
                                   <p>店铺设置<i class="txt-icon"></i></p>
                                   <p>设置联系人<i class="txt-icon"></i></p>
                               </dd>
                           </dl>
                           <dl>
                               <dt>等待e飞蚁审核<i class="enter-3"></i></dt>
                               <dd>
                                   <p>e飞蚁7个工作日内反馈审核结果<i class="txt-icon"></i></p>
                               </dd>
                           </dl>
                           <dl class="noborder1">
                               <dt>店&nbsp;铺&nbsp;开&nbsp;通<i class="enter-1"></i></dt>
                               <dd>
                                   <p>店铺开通<i class="txt-icon"></i></p>
                                   <p>商家登录后台<i class="txt-icon"></i></p>
                               </dd>
                           </dl>
                       </div>
                   </div>
               </div>
           </div>
   </c:if>
<c:if test="${review=='2'}">


    <div class="audit">
        <div class="wh step">
            <div class="step2"></div>
        </div>
        <div class="wh tips"><strong>e飞蚁会在7个工作日内反馈审核结果，您可登陆查看审核状态，也可通过拨打400-876-8766</strong></div>
        <div class="wh info">
            <div class="btns">
                <a href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/>" class="btn-link">店铺信息</a>
                <a href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/>" class="btn-link">入驻信息</a>
            </div>
            <div class="table">
                <h1>审核日志</h1>
                <table width="100%">
                    <tr>
                        <th width="20%">入驻审核结果</th>
                        <th width="20%">操作时间</th>
                        <th width="60%">详  情</th>
                    </tr>
                    <tr>
                        <td class="tc"><p>审核未通过</p></td>
                        <td class="tc"><p>2012-21-21 23:23</p></td>
                        <td class="tl">
                            <p>
                                <span>申请人：XXXXXXXXXXX</span>
                                <span>电话：18922225555</span>
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


    </div>
</c:if>
<c:if test="${review=='3'}">


    <div class="audit">
        <div class="wh step">
            <div class="step1"></div>
        </div>
        <div class="wh tips"><strong>e飞蚁会在7个工作日内反馈审核结果，您可登陆查看审核状态，也可通过拨打400-876-8766</strong></div>
        <div class="wh info">
            <div class="btns">
                <a href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/>" class="btn-link">店铺信息</a>
                <a href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/>" class="btn-link">入驻信息</a>
            </div>
            <div class="table">
                <h1>审核日志</h1>
                <table width="100%">
                    <tr>
                        <th width="20%">入驻审核结果</th>
                        <th width="20%">操作时间</th>
                        <th width="60%">详  情</th>
                    </tr>
                    <tr>
                        <td class="tc"><p>审核未通过</p></td>
                        <td class="tc"><p>2012-21-21 23:23</p></td>
                        <td class="tl">
                            <p>
                                <span>法人身份证电子版</span>
                                <span>请正确上传资质</span>
                                <%--<a class="btn-txt" href="">修改</a>--%>
                                <a class="btn-link" href="<c:url value="basic/xm.do?qm=viewTenant1&id=${TENANT.id}"/>">修 改</a>
                            </p>
                            <p>
                                <span>营业执照副本</span>
                                <span>照片不清晰</span>
                                <%--<a class="btn-txt" href="">修改</a>--%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="tc"><p>审核未通过</p></td>
                        <td class="tc"><p>2012-21-21 23:23</p></td>
                        <td class="tl">
                            <p>
                                <span>申请企业入驻</span>
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


    </div>

</c:if>
<c:if test="${review=='4'}">
    欢迎来到后台管理系统
</c:if>
</body>
</html>
