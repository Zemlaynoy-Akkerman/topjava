
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 07.07.18
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<a href="meals?action=create">Add meal</a></h3>
    <table>
        <thead>
        <tr>
            <th>Дата/Время</th>
            <th>Описание</th>
            <th>Калории</th>
            <th>edit</th>
            <th>delete</th>
        </tr>
        </thead>
        <c:forEach var="mealWithExceed" items="${mealsList}">
            <jsp:useBean id="mealWithExceed" scope="page" type="ru.javawebinar.topjava.model.MealWithExceed"/>
            <tr <c:if test="${mealWithExceed.exceed}"> style="color: red" </c:if>>
                <th>
                    <fmt:parseDate value="${mealWithExceed.dateTime}" pattern="y-M-dd'T'H:m" var="parseDate"/>
                    <fmt:formatDate value="${parseDate}" pattern="yyyy.MM.dd HH:mm" />
                </th>
                <th>${mealWithExceed.description}</th>
                <th>${mealWithExceed.calories}</th>
                <th><a href="meals?action=update&id=${mealWithExcee.getId()}">edit</a></th>
                <th><a href="meals?action=delete&id=${mealWithExceed.getId()}">delete</a></th>
            </tr>
        </c:forEach>


    </table>
</body>
</html>
