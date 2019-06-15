<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Cinema app</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

</head>
<div class="menu">
    <div class="left">
        <ul>
            <li><a href="/">Strona główna</a></li>
            <li><a href="/movies_control">Panel filmów</a></li>
            <li><a href="/schedule_control">Panel godzin</a></li>
        </ul>
    </div>
    <div class="right">
        <p align="right">Witaj ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Wyloguj</a></p>
    </div>
</div>

<hr />
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h1>Tytuł: ${title}</h1>
        <div class="flex-container">
            <div class="left">
                <img src="<c:out value="${poster_link}" />" alt="no_poster" class="center" />
            </div>
            <div class="right">
                <form method="post" action="/reservation/${id}/details">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <c:forEach items="${schedulesList}" var="schedule">
                    <label for="${schedule.id}">${schedule.time}</label>
                    <input type="radio" name="schedule_id" id="${schedule.id}" value="${schedule.id}" />
                    </c:forEach> <br>
                    <input type="submit" value="Wybierz" />
                </form>
            </div>
        </div>
        <hr />
    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>