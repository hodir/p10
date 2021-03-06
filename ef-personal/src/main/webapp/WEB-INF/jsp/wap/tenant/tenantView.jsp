<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js">
<head></head>
<body>
<section>
    <strong>
        <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  am-avg-md-3 am-avg-lg-4 am-gallery-overlay">
            <c:forEach items="${tenantWorkList}" begin="0" end="2" var="masterWork">
            <li>
                <div class="am-gallery-item">
                    <a href="/work/${masterWork.id}" class="">
                        <img src="http://tenant.efeiyi.com/${masterWork.pictureUrl}@!tenant-mobile-work"/>
                        <h3 class="am-gallery-title">${masterWork.name}</h3>
                    </a>
                </div>
            </li>
            </c:forEach>
        </ul>
    </strong>
</section>

</body>
</html>