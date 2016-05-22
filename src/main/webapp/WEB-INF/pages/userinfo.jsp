<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
  <title>User Info</title>
  <style type="text/css">
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
      .name {
          margin: 10px;
          background-color: #ff7e00;
          padding: 10px 20px;
          font-family: Arial, sans-serif;
          font-size: 20px;
          color: #fff;
          font-weight: bold;
      }
      .tg {
        width: 390px;
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #ccc;
        margin: 10px;
      }
      .tg td {
        font-family: Arial, sans-serif;
        font-size: 16px;
        padding: 10px;
        color: #333;
      }
      .tg tr:nth-child(even) {
        background-color: #e9e9e9;
      }
      input[type=button] {
        float: left;
        width: 32px;
        height: 32px;
        margin-left: 10px;
        background-color: #4eb543;
        font-family: Arial, sans-serif;
        font-size: 18px;
        color: #fff;
        border: none;
      }
      form {
        margin-bottom: 0;
      }
      input[type=submit] {
        float: right;
        width: 100px;
        margin-right: 10px;
        padding: 8px 10px;
        background-color: #4eb543;
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #fff;
        border: none;
      }
    </style>
</head>
<body>
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
</body>
</html>