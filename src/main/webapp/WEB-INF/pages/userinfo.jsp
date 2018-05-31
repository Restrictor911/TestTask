<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>User Info</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="/style/style.css"/>
    <link rel="stylesheet" href="/style/userinfo.css"/>
</head>
<body>
<div class="content">
    <div class="header">
        <a href='<c:url value="/main"/>'><span>JavaRush } Test Task</span></a>
    </div>

    <div class="page-title">${user.name}</div>
    <div class="row bordered">
        <div class="label">ID</div>
        <div class="value">${user.id}</div>
    </div>
    <div class="row bordered">
        <div class="label">Age</div>
        <div class="value">${user.age}</div>
    </div>
    <div class="row bordered">
        <div class="label">Admin</div>
        <div class="value">${user.isAdmin ? '<i class="material-icons green">done</i>' : '<i class="material-icons red">clear</i>'}</div>
    </div>
    <div class="row">
        <div class="label">Added</div>
        <div class="value">${user.createdDate}</div>
    </div>

    <div class="footer">
        <button onclick="location.href='<c:url value="/main"/>'">
            <i class="material-icons">keyboard_arrow_left</i>
        </button>

        <form:form action="edit/${user.id}">
            <input type="submit" value="<spring:message text="Edit User"/>"/>
        </form:form>
        <form:form action="remove/${user.id}">
            <input type="submit" value="<spring:message text="Delete User"/>"/>
        </form:form>

        <div class="clear"></div>
    </div>
</div>
</body>
</html>