<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Form Page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="/style/style.css"/>
    <link rel="stylesheet" href="/style/form.css"/>
</head>
<body>
<div class="content">
    <div class="header">
        <a href='<c:url value="/main"/>'><span>JavaRush } Test Task</span></a>
    </div>

    <div class="page-title">${user.id == 0 ? 'Add user' : 'Update user'}</div>

    <c:url var="updateAction" value="/form/update"/>
    <form:form action="${updateAction}" commandName="user">
        <input type="hidden" name="id" value="${user.id}"/>
        <div class="row">
            <div class="label">
                <label for="name">Name</label>
            </div>
            <div class="field">
                <c:if test="${user.id == 0}">
                    <input type="text" id="name" name="name" size="25" value="New User"/>
                </c:if>
                <c:if test="${user.id > 0}">
                    <input type="text" id="name" name="name" size="25" value="${user.name}"/>
                </c:if>
            </div>
        </div>
        <div class="row">
            <div class="label">
                <label for="age">Age</label>
            </div>
            <div class="field">
                <c:if test="${user.id == 0}">
                    <input type="text" id="age" name="age" size="3" value="21"/>
                </c:if>
                <c:if test="${user.id > 0}">
                    <input type="text" id="age" name="age" size="3" value="${user.age}"/>
                </c:if>
            </div>
        </div>
        <div class="row">
            <div class="label">
                <label for="isAdmin">Admin</label>
            </div>
            <div class="field field-checkbox">
                <input type="checkbox" id="isAdmin" name="isAdmin"/>
            </div>
        </div>
        <div class="row">
            <form:errors path="name" cssClass="error"/><br/>
            <form:errors path="age" cssClass="error"/>
        </div>
        <div class="footer">
            <c:if test="${user.id > 0}">
                <button class="button button-nav left" onclick="location.href='<c:url value="/userinfo/${user.id}"/>'">
                    <i class="material-icons">keyboard_arrow_left</i>
                </button>
                <input class="button right" type="submit" value="Update"/>
            </c:if>
            <c:if test="${user.id == 0}">
                <button class="button button-nav left" onclick="location.href='<c:url value="/main"/>'">
                    <i class="material-icons">keyboard_arrow_left</i>
                </button>
                <input class="button right" type="submit" value="Add"/>
            </c:if>
        </div>
    </form:form>
    <div class="clear"></div>
</div>
</body>
</html>