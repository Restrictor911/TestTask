<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>Main Page</title>
    <style type="text/css">
      body {
        margin: 15px auto;
        width: 450px;
        font-family: Arial, sans-serif;
      }
      .header > a {
        font-family: Tahoma, Arial, sans-serif;
        display: block;
        width: 430px;
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
      .tg {
        margin: 10px;
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #fff;
      }
      .tg tr {
        background-color: #e9e9e9;
      }

      .tg tr:nth-child(even) {
        background-color: #fff;
      }

      .tg td {

        font-size: 14px;
        padding: 10px 10px;
        border: none;
        overflow: hidden;
        word-break: normal;
        color: #333;
      }

      .tg th {
        font-family: Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        padding: 10px 10px;
        border: none;
        overflow: hidden;
        word-break: normal;
        color: #fff;
        background-color: #4eb543;
      }
      .tg td a {
        color: #0088cc;
        text-decoration: none;
      }

      .pages {
        float: left;
        margin: 10px;
        padding: 0;
      }
      .button {
        float: right;
        margin: 10px;
        width: 100px;
        padding: 8px 10px;
        background-color: #4eb543;
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #fff;
        border: none;
      }
      .searchField {
        float: left;
        width: 310px;
        height: 32px;
        margin: 10px;
      }
      .clear {
        clear: both;
      }
      li {
        display: block;
        float: left;
        margin-right: 10px;
        width: 32px;
        height: 32px;
        background-color: #4eb543;
        text-align: center;
        font-size: 18px;
        font-family: Arial, sans-serif;
      }
      li a {
        display: block;
        width: 32px;
        height: 32px;
        text-decoration: none;
        color: #fff;
      }
      .currentPage {
        background-color: #ff7e00;
        color: #fff;
      }
      span {
        position: relative;
        top: 7px;
      }
    </style>
</head>
<body>
    <div class="header">
        <a href='<c:url value="/main"/>'><span>JavaRush } Test Task</span></a>
    </div>

    <c:url var="search" value="/search"/>
    <form:form action="${search}" cssClass="searchForm" commandName="user">
        <form:input path="name" cssClass="searchField" />
        <input type="submit" class="button searchButton"
            value="<spring:message text="Find"/>"/>
        <div class="clear"></div>
    </form:form>

    <c:if test="${!empty users}">
        <table class="tg">
            <tr>
                <th width="30">ID</th>
                <th width="160">Name</th>
                <th width="30">Age</th>
                <th width="30">Admin</th>
                <th width="100">Added</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td align="right">${user.id}</td>
                    <td>
                        <a href="<c:url value='/userinfo/${user.id}'/>">${user.name}</a>
                    </td>
                    <td align="center">${user.age}</td>
                    <c:if test="${user.isAdmin}">
                        <td align="center">Yes</td>
                    </c:if>
                    <c:if test="${!user.isAdmin}">
                        <td></td>
                    </c:if>
                    <td align="center"><fmt:formatDate type="date"
                    value="${user.createdDate}"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <input type="button" id="addButton" class="button"
        onclick="location.href='<c:url value="/add"/>'"
        value="<spring:message text="Add User"/>"/>

    <ul class="pages">
        <c:if test="${paginator.currentPage > 0}">
            <li>
            <a href="<c:url value='/${paginator.mode}/${paginator.currentPage - 1}?name=${user.name}'/>">
                <span class="linkText">&lt;</span>
            </a>
            </li>
        </c:if>
        <c:if test="${paginator.currentPage == 0}">
            <li class="currentPage">
                <span class="currentText">${paginator.currentPage + 1}</span>
            </li>
            <c:forEach var="i" begin="1" end="4">
                <c:if test="${i <= paginator.maxPage}">
                    <li>
                    <a href="<c:url value='/${paginator.mode}/${i}?name=${user.name}'/>">
                        <span class="linkText">${i + 1}</span>
                    </a>
                    </li>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${paginator.currentPage == 1}">
            <li>
            <a href="<c:url value='/${paginator.mode}/${paginator.currentPage - 1}?name=${user.name}'/>">
                <span class="linkText">${paginator.currentPage}</span>
            </a>
            </li>
            <li class="currentPage">
                <span class="currentText">${paginator.currentPage + 1}</span>
            </li>
            <c:forEach var="i" begin="2" end="4">
                <c:if test="${i <= paginator.maxPage}">
                    <li>
                    <a href="<c:url value='/${paginator.mode}/${i}?name=${user.name}'/>">
                        <span class="linkText">${i + 1}</span>
                    </a>
                    </li>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${paginator.currentPage > 1}">
            <c:forEach var="i" begin="${paginator.currentPage - 2}"
                end="${paginator.currentPage + 2}">
                <c:if test="${i <= paginator.maxPage && i != paginator.currentPage}">
                    <li>
                    <a href="<c:url value='/${paginator.mode}/${i}?name=${user.name}'/>">
                        <span class="linkText">${i + 1}</span>
                    </a>
                    </li>
                </c:if>
                <c:if test="${i == paginator.currentPage}">
                    <li class="currentPage">
                        <span class="currentText">${paginator.currentPage + 1}</span>
                    </li>
                </c:if>
            </c:forEach>
        </c:if>

        <c:if test="${paginator.currentPage < paginator.maxPage}">
            <li>
            <a href="<c:url value='/${paginator.mode}/${paginator.currentPage + 1}?name=${user.name}'/>">
                <span class="linkText">&gt;</span>
            </a>
            </li>
        </c:if>
    </ul>
</body>
</html>