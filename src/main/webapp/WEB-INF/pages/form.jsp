<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Form Page</title>
    <style>
      body {
        margin: 15px auto;
        width: 410px;
        font-family: Arial, sans-serif;
      }
      .header > a {
        font-family: Tahoma, Arial, sans-serif;
        display: block;
        width: 390px;
        height: 64px;
        margin: 10px;
        background-color: #4eb543;
        color: #fff;
        text-decoration: none;
        font-size: 32px;
        font-weight: bold;
        text-align: center;
      }
      .header > a > span {
        position: relative;
        top: 12px;
      }
      table {
          width: 390px;
          margin: 10px;
          border-collapse: collapse;
          border-spacing: 0;
          border-color: #fff;
      }

      td:nth-child(odd) {
          width: 100px;
          font-size: 16px;
          padding: 10px 10px;
          color: #333;
      }
      td > input[type=text] {
          float: left;
          width: 270px;
          height: 32px;
      }
      input[type=button] {
          float: left;
          width: 32px;
          height: 32px;
          background-color: #4eb543;
          font-family: Arial, sans-serif;
          font-size: 18px;
          color: #fff;
          border: none;
      }
      input[type=submit] {
          float: right;
          width: 100px;
          padding: 8px 10px;
          background-color: #4eb543;
          font-family: Arial, sans-serif;
          font-size: 14px;
          color: #fff;
          border: none;
      }
      .error {
          color: red;
      }
    </style>
</head>
<body>
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
</body>
</html>