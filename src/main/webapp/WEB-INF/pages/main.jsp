<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="/style/style.css"/>
    <link rel="stylesheet" href="/style/main.css"/>
</head>
<body>
    <div class="content">
    <div class="header">
        <a href="/main"><span>JavaRush } Test Task</span></a>
    </div>

    <c:url var="search" value="/search"/>
    <form:form action="${search}" cssClass="searchForm" commandName="user">
        <form:input path="name" cssClass="search" />
        <input type="submit" class="button searchButton"
            value="<spring:message text="Find"/>"/>
        <div class="clear"></div>
    </form:form>

    <c:if test="${!empty users}">
        <table class="users">
            <tr>
                <th width="30" align="right">ID</th>
                <th width="160" align="left">Name</th>
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

    <div class="footer">
        <input type="button" id="addButton" class="button"
            onclick="location.href='<c:url value="/add"/>'"
            value="<spring:message text="Add User"/>"/>

        <ul class="pages">
            <c:set var="nameParam" value="${user.name ? '?name=' + user.name : ''}"/>
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
                        <a href="<c:url value='/${paginator.mode}/${i}${nameParam}'/>">
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
    </div>
    <div class="clear"></div>
    </div>
</body>
</html>