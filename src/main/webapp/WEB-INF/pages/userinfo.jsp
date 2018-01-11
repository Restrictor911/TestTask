<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
  <title>User Info</title>
  <link rel="stylesheet" href="/style/style.css"/>
  <link rel="stylesheet" href="/style/userinfo.css"/>
</head>
<body>
    <div class="content">
    <div class="header">
        <a href='<c:url value="/main"/>'><span>JavaRush } Test Task</span></a>
    </div>

    <div class="name">${user.name}</div>
    <table class="tg">
      <tr>
        <td width="100">ID</td>
        <td>${user.id}</td>
      </tr>
      <tr>
        <td width="100">Age</td>
        <td>${user.age}</td>
      </tr>
        <td width="100">Admin</td>
        <td>
            <c:if test="${user.isAdmin}">Yes</c:if>
            <c:if test="${!user.isAdmin}">No</c:if>
        </td>
      <tr>
        <td width="100">Added</td>
        <td>${user.createdDate}</td>
      </tr>
    </table>

    <input type="button"
            onclick="location.href='<c:url value="/main"/>'"
            value="<spring:message text="<"/>"/>

    <form:form action="edit/${user.id}">
        <input type="submit" value="<spring:message text="Edit User"/>"/>
    </form:form>
    <form:form action="remove/${user.id}">
        <input type="submit" value="<spring:message text="Delete User"/>"/>
    </form:form>
    <div style="clear:both;"></div>
    </div>
</body>
</html>