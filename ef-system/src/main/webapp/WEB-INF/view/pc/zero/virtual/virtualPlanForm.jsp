<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/26
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<html>
<head>
    <title>虚拟数据批次信息</title>
    <script src="<c:url value="/resources/plugins/My97DatePicker/WdatePicker.js"/>"></script>
</head>
<body>
<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">虚拟数据批次</strong>
    </div>
</div>
<hr/>
<div class="am-g">
    <form id="vPlanForm" onsubmit="return startLessThanEnd('vPlanForm')"
          action="<c:url value='/basic/xm.do?qm=saveOrUpdateVirtualPlan'/>"
          method="post" enctype="multipart/form-data" class="am-form am-form-horizontal">
        <input type="hidden" name="id" value="${object.id}">
        <input type="hidden" name="serial" value="${object.serial}"/>
        <input type="hidden" name="status" value="${object.status}"/>

        <div class="am-form-group">
            <label for="description" class="am-u-sm-3 am-form-label">虚拟数据批次名<small>*</small></label>
            <div class="am-u-sm-9">
                <input type="text" name="description" id="description"
                       title="虚拟数据批次名" placeholder="虚拟数据批次名"
                       value="${object.description}" required="true">
            </div>
        </div>

        <div class="am-form-group">
            <label for="planType" class="am-u-sm-3 am-form-label">虚拟数据对象<small>*</small></label>
            <div class="am-u-sm-9" style="margin-top: 8px">
                <ming800:status name="planTypeSelect" dataType="PCVirtualPlan.planType"
                                checkedValue="${object.planType}" onclick="javascript:objectChange(this)" required="required" type="radio"/>
                <input type="hidden" name="planType" id="planType" title="虚拟数据对象" required="true" value="${object.planType}">
            </div>
        </div>

        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">任务截止日期<small>*</small></label>
            <div class="am-u-sm-9">
                <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                       type="text" style="width: auto; float: left; height: 35px"
                       name="startDate" id="startDate" title="开始日期" placeholder="开始日期"
                       value="${object.startDate}" required="true" readonly>

                <span style="width: auto; float: left; font-family:'应用字体 Regular', '应用字体'; margin-left: 10px; margin-top: 4px">至</span>

                <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                       type="text" style="width: auto; float: left; margin-left: 10px; height: 35px"
                       name="endDate" id="endDate" title="结束日期" placeholder="结束日期"
                       value="${object.endDate}" required="true" readonly>
            </div>
        </div>

        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">任务运行时间<small>*</small></label>
            <div class="am-u-sm-9">
                <input class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss'})"
                       type="text" style="width: auto; float: left; height: 35px"
                       name="startTime" id="startTime" title="开始时间" placeholder="开始时间"
                       value="${object.startTime}" required="true" readonly>

                <span style="width: auto; float: left; font-family:'应用字体 Regular', '应用字体'; margin-left: 10px; margin-top: 4px">至</span>

                <input class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss'})"
                       type="text" style="width: auto; float: left; margin-left: 10px; height: 35px"
                       name="endTime" id="endTime" title="结束时间" placeholder="结束时间"
                       value="${object.endTime}" required="true" readonly>
            </div>
        </div>

        <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" class="am-btn am-btn-primary" value="保存"/>
            </div>
        </div>

    </form>
</div>

<script>
    function objectChange(obj){
        var val = obj.value;
        $("#planType").val(val);
    }
    function startLessThanEnd(val){
        if(afterSubmitForm2zero(val) && dateCheck() && timeCheck()){
            return true;
        }
        return false;
    }
    function dateCheck(){
        var sd = $("#startDate").val();
        var ed = $("#endDate").val();
        if(ed<=sd){
            alert("任务开始日期应该小于结束日期");
            return false;
        }
        return true;
    }
    function timeCheck(){
        var st = $("#startTime").val();
        var et = $("#endTime").val();
        if(et<=st){
            alert("任务运行开始时间应该小于结束时间");
            return false;
        }
        return true;
    }
    function afterSubmitForm2zero(formId){
        var form2 = document.getElementById(formId);
        var a = form2.elements.length;//所有的控件个数
        for (var j=0;j<a;j++){
            if(form2.elements[j].required){
                if(form2.elements[j].value=="" || form2.elements[j].value==null){
                    alert(form2.elements[j].title + "不能为空");
                    form2.elements[j].focus();
                    return false;
                }
            }
        }
        return true;
    }
</script>

</body>
</html>
