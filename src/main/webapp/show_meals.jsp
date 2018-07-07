
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 07.07.18
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<div>
    <table>
        <thead>
        <tr>
            <th>Дата/Время</th>
            <th>Описание</th>
            <th>Калории</th>
        </tr>

        <c:forEach var="mealWithExceed" items="${mealsList}">
            <tr <c:if test="${mealWithExceed.isExceed()}"> style="color: red" </c:if>>
                <th>${mealWithExceed.getDateTime()}</th>
                <th>${mealWithExceed.getDescription()}</th>
                <th>${mealWithExceed.getCalories()}</th>
            </tr>
        </c:forEach>

        </thead>
    </table>
</div>
</body>
</html>
