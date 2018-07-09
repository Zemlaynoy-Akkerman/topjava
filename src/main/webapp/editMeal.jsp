<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 09.07.18
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create/edit</title>
</head>
<body>
<section>
        <h3><a href="index.html">Home</a></h3>
        <h2>${param.action == 'create' ? 'Create meal' : 'Edit meal'}</h2>
        <hr>
        <jsp:useBean id="meal" type="ru.javawebinar.topjava.model.UserMeal" scope="request"/>
        <form method="post" action="meals">
            <input type="hidden" name="id" value="${meal.id}">
            <dl>
                <dt>DateTime:</dt>
                <dd><input type="datetime-local" value="${meal.dateTime}" name="dateTime" required></dd>
            </dl>
            <dl>
                <dt>Description:</dt>
                <dd><input type="text" value="${meal.description}" size=40 name="description" required></dd>
            </dl>
            <dl>
                <dt>Calories:</dt>
                <dd><input type="number" value="${meal.calories}" name="calories" required></dd>
            </dl>
            <button type="submit">Save</button>
            <button onclick="window.history.back()" type="button">Cancel</button>
        </form>
    </section>
</body>
</html>
