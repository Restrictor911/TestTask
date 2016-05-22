<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% response.sendRedirect("main"); %>
<html>
<head>
  <title>Test Task</title>
</head>
<body>
  <br/>
  <a href="<c:url value="/main"/>" target="_blank">Go to main</a>
  <br/>
</body>
</html>