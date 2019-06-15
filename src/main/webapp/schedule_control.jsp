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
            <li><a href="movies_control">Panel filmów</a></li>
            <li><a href="schedule_control">Panel godzin</a></li>
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

        <h1>Dodaj godzine:</h1>
        <form method="post" action="/schedule_control/add">
            <table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <tr>
                    <td style="font-weight: bold">Dla filmu [id]: </td>
                    <td><input type="text" name="movie_id" required /></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Godzina [gg:mm]: </td>
                    <td><input type="text" name="time" required /></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Sala: </td>
                    <td><input type="text" name="hall" required min="1"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Dodaj godzine" /></td>
                </tr>
            </table>
        </form>

        <hr />
        <c:if test="${!empty schedulesList}">
            <h1>Usuń Godzine: </h1>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Film</th>
                    <th>Czas</th>
                    <th>Sala</th>
                    <th></th>
                </tr>
                <c:forEach items="${schedulesList}" var="schedule">
                    <tr>
                        <td>${schedule.id}</td>
                        <td>${schedule.movie_id}</td>
                        <td>${schedule.time}</td>
                        <td>${schedule.hall}</td>
                        <td><a href ="schedule_control/delete/${schedule.id}"><button>Delete</button></a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>