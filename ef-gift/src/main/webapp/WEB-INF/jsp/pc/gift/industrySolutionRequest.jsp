<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--//End--nav2016-->
<div class="gift2016">
  <div class="gift-home scheme">
    <div class="demand">
      <form action="<c:url value="/submitIndustrySolutionRequest"/>" method="post">
        <div class="title">
          <h5>礼品定制需求</h5>
          <p class="phone">咨询热线：4008768766</p>
        </div>
        <div class="option">
          <div class="option-list">
            <div class="name"><span>您的姓名</span></div>
            <div class="option-content">
              <input type="text" class="txt" name="userName" required>
            </div>
          </div>
          <div class="option-list">
            <div class="name"><span>联系方式</span></div>
            <div class="option-content">
              <input type="text" class="txt" maxlength="11" name="tel" required>
            </div>
          </div>
          <div class="option-list">
            <div class="name"><span>需求描述</span></div>
            <div class="option-content">
              <textarea name="description" class="more-txt"  placeholder="详细描述礼品品类，送礼场合，包装，单价范围等。" required></textarea>
            </div>
          </div>
          <div class="option-list">
            <div class="name"><span>需求数量</span></div>
            <div class="option-content">
              <input type="text" class="txt" maxlength="10" name="number" required onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">
            </div>
          </div>
          <div class="option-btn">
            <input type="submit"  class="affirm" value="提&nbsp;交">
            <a href="javascript:history.go(-1)" class="cancel">取&nbsp;消</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
