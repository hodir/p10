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
<table>
  <tr>
    <td>masterNews-id</td>
    <td>title</td>
  </tr>

  <c:forEach items="${objectList}" var="masterNews">
    <tr>
      <td>${masterNews.id}</td>
      <td>${masterNews.title}</td>
    </tr>
  </c:forEach>

</table>

</body>
</html>
