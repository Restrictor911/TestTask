<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Form Page</title>
    <link rel="stylesheet" href="/style/style.css"/>
    <link rel="stylesheet" href="/style/form.css"/>
</head>
<body>
    <div class="content">
    <div class="header">
        <a href='<c:url value="/main"/>'><span>JavaRush } Test Task</span></a>
    </div>

    <c:url var="updateAction" value="/form/update"/>

    <form:form action="${updateAction}" commandName="user">
        <table>
            <c:if test="${user.id > 0}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <c:if test="${user.id == 0}">
                    <form:input path="name" size="25" value="New User"/>
                    </c:if>
                    <c:if test="${user.id > 0}">
                    <form:input path="name" size="25" value="${user.name}"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Age"/>
                    </form:label>
                </td>
                <td>
                    <c:if test="${user.id == 0}">
                    <form:input path="age" size="3" value="21"/>
                    </c:if>
                    <c:if test="${user.id > 0}">
                    <form:input path="age" size="3" value="${user.age}"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="isAdmin">
                        <spring:message text="Admin"/>
                    </form:label>
                </td>
                <td>
                    <form:checkbox path="isAdmin"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <form:errors path="name" cssClass="error"/><br/>
                    <form:errors path="age" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding:0;">
                    <c:if test="${user.id > 0}">
                        <input type="button"
                                onclick="location.href='<c:url value="/userinfo/${user.id}"/>'"
                                value="<spring:message text="<"/>"/>
                        <input type="submit"
                               value="<spring:message text="Update"/>"/>
                    </c:if>
                    <c:if test="${user.id == 0}">
                        <input type="button"
                                onclick="location.href='<c:url value="/main"/>'"
                                value="<spring:message text="<"/>"/>
                        <input type="submit"
                               value="<spring:message text="Add"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
    <div style="clear:both;"></div>
    </div>
</body>
</html>