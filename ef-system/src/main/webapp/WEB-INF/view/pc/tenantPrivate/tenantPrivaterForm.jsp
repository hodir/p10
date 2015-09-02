<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <script src="<c:url value="/scripts/jquery-1.11.1.min.js"/>"></script>
    <title></title>
</head>
<body>
<center>
  <form action="<c:url value="/basic/xmm.do"/>" method="post" enctype="multipart/form-data" class="am-form am-form-horizontal">
    <input type="hidden" name="qm" value="saveOrUpdatePrivaterTenant">
    <input type="hidden" name="id" value="${object.id}">
    <input type="hidden" name="type" value="12" />
    <table>
      <div class="am-form-group">
        <label for="name" class="am-u-sm-3 am-form-label">*名称</label>

        <div class="am-u-sm-9">
          <input type="text" id="name" name="name" placeholder="name" value="${object.name}">
        </div>
      </div>
      <div class="am-form-group">
        <label for="operatorName" class="am-u-sm-3 am-form-label">经营者姓名</label>

        <div class="am-u-sm-9">
          <input type="text" id="operatorName" name="operatorName" placeholder="经营者姓名" value="${object.operatorName}">
        </div>
      </div>

      <div class="am-form-group">
        <label for="identity" class="am-u-sm-3 am-form-label">身份证号</label>

        <div class="am-u-sm-9">
          <input type="text" id="identity" name="identity" placeholder="身份证号" value="${object.identity}">
        </div>
      </div>
      <div class="am-form-group">
        <label for="frontPhotoUrl" class="am-u-sm-3 am-form-label">*经营者身份证电子版正面</label>

        <div class="am-u-sm-9">
                <span style="padding: 10px;">
                       <c:if test="${!empty object.frontPhotoUrl}">
                         <img width="7%" src="http://tenant.efeiyi.com/${object.frontPhotoUrl}@!product-model">
                       </c:if>
                </span>
          <input type="file" id="frontPhotoUrl" name="frontPhotoUrl" placeholder="frontPhotoUrl"
                 value="${object.frontPhotoUrl}">
        </div>
      </div>
      <div class="am-form-group">
        <label for="versoPhotoUrl" class="am-u-sm-3 am-form-label">*经营者身份证电子版反面</label>

        <div class="am-u-sm-9">
                <span style="padding: 10px;">
                       <c:if test="${!empty object.frontPhotoUrl}">
                         <img width="7%" src="http://tenant.efeiyi.com/${object.versoPhotoUrl}@!product-model">
                       </c:if>
                </span>
          <input type="file" id="versoPhotoUrl" name="versoPhotoUrl" placeholder="versoPhotoUrl"
                 value="${object.versoPhotoUrl}">
        </div>
      </div>
      <div class="am-form-group">
        <label name="addressProvince.id" for="${object.id}" class="am-u-sm-3 am-form-label">*营业执照所在省 <small>*</small></label>
        <div class="am-u-sm-9" style="margin-top: 10px">
          <select id="${object.id}" name="addressProvince.id" onchange="provinceChange(this , '${object.id}')">
            <option value="${object.addressProvince.id}">${object.addressProvince.name}</option>
          </select>
        </div>
      </div>
      <div class="am-form-group">
        <label name="addressCity.id" for="${object.id}" class="am-u-sm-3 am-form-label">*营业执照所在市 <small>*</small></label>
        <div class="am-u-sm-9" style="margin-top: 10px">
          <select id="citys${object.id}" name="addressCity.id">
            <option value="${object.addressCity.id}">${object.addressCity.name}</option>
          </select>
        </div>
      </div>
      <div class="am-form-group">
        <label for="indateBegin" class="am-u-sm-3 am-form-label">*营业执照生效日期</label>

        <div class="am-u-sm-9">
          <div class="am-form-group am-form-icon">
            <i class="am-icon-calendar"></i>
            <input type="text" id="indateBegin" name="indateBegin" class="am-form-field am-input-sm"
                   placeholder="生效日期" value="${object.indateBegin}" data-am-datepicker readonly>
          </div>
        </div>
      </div>
      <div class="am-form-group">
        <label for="indateEnd" class="am-u-sm-3 am-form-label">营业执照失效日期</label>

        <div class="am-u-sm-9">
          <div class="am-form-group am-form-icon">
            <i class="am-icon-calendar"></i>
            <input type="text" id="indateEnd" name="indateEnd" class="am-form-field am-input-sm"
                   placeholder="失效日期"  value="${object.indateEnd}" data-am-datepicker readonly>
          </div>
        </div>
      </div>
      <div class="am-form-group">
        <label for="businessScope" class="am-u-sm-3 am-form-label">*经营范围</label>

        <div class="am-u-sm-9">
          <textarea type="text" id="businessScope" name="businessScope" cols="3" rows="4">${object.businessScope}</textarea>
        </div>
      </div>
      <div class="am-form-group">
        <label for="businessLicense" class="am-u-sm-3 am-form-label">*营业执照副本电子版</label>
        <div class="am-u-sm-9">
                <span style="padding: 10px;">
                       <c:if test="${!empty object.businessLicense}">
                         <img width="7%" src="http://tenant.efeiyi.com/${object.businessLicense}@!product-model">
                       </c:if>
                </span>
          <input type="file" id="businessLicense" name="businessLicense" placeholder="businessLicense"
                 value="${object.businessLicense}">
        </div>
      </div>
      <div class="am-form-group">
        <label for="taxRegistrationAttachment" class="am-u-sm-3 am-form-label">*税务登记证电子版</label>
        <div class="am-u-sm-9">
                <span style="padding: 10px;">
                       <c:if test="${!empty object.taxRegistrationAttachment}">
                         <img width="7%" src="http://tenant.efeiyi.com/${object.taxRegistrationAttachment}@!product-model">
                       </c:if>
                </span>
          <input type="file" id="taxRegistrationAttachment" name="taxRegistrationAttachment" placeholder="taxRegistrationAttachment"
                 value="${object.taxRegistrationAttachment}">
        </div>
      </div>
      <div class="am-form-group">
        <div class="am-u-sm-9 am-u-sm-push-3">
          <button type="submit" class="am-btn am-btn-primary">保存个体信息</button>
        </div>
      </div>
    </table>
  </form>
</center>
<script>
  function chooseCity(element,provinceId,cityId,o){
    $(element).val(provinceId);
    var callback = function(){
      $("#citys" + o).val(cityId);
    }
    provinceChange(element, o,callback);
  }

  $.post("<c:url value="/address/listProvince.do"/>",
          function (data) {
            var obj = eval(data);
            var out = '<option value="">请选择</option>';
            for (var i = 0; i < obj.length; i++) {
              console.log(obj[i]+"----"+obj[i]);
              out += '<option value="' + obj[i]["id"] + '">' + obj[i]["name"] + '</option>';
            }
            $("#${object.id}").append(out);
            chooseCity($("#${object.id}") , "${object.addressProvince.id}","${object.addressCity.id}","${object.id}");
          }
  )

  function provinceChange(element, o, callback) {
    $("#citys" + o).empty();
    var provinceId = $(element).val();
    $.post("<c:url value="/address/listCity.do"/>",
            {provinceId: provinceId},
            function (data) {
              var obj = eval(data);
              var out = '<option value="">请选择</option>';
              for (var i = 0; i < obj.length; i++) {
                out += '<option value="' + obj[i]["id"] + '">' + obj[i]["name"] + '</option>';
              }
              $("#citys" + o).append(out);
              if(typeof callback!= "undefined"){
                callback();
              }
            }
    )
  }
</script>
</body>
</html>