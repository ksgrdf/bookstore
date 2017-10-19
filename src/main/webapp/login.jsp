<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language= "java" contentType= "text/html; charset=UTF-8" pageEncoding= "UTF-8"%>
<%@ taglib prefix= "spring" uri= "http://www.springframework.org/tags"%>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset=UTF-8">
    <title>Login Page</title>
    <spring:url value= "/resources/css/bootstrap.css" var= "bootstrap" />
    <spring:url value= "/resources/css/signin.css" var= "signin" />
    <link href= "${bootstrap}" rel= "stylesheet" />
    <link href= "${signin}" rel= "stylesheet" />
</head>
<body>

    <c:if test= "${not empty param.error}">
        <font size= "2" color= "red"><b>Неправильный логин или пароль</b></font>
    </c:if>
    <c:url var="loginUrl" value="/login"/>


    <form name= "form" action= "${loginUrl}" method= "post" class="form-signin">
        <h2 class= "form-signin-heading">Пожалуйста войдите</h2>
            <p><label for="username">User:</label></p>
            <input type="text" id="username" class= "form-control" name="username"/>

            <p><label for="password">Password:</label></p>
            <input type="password" id="password" class= "form-control" name="password">

        <div>
            <input value="Войти" type="submit" class= "btn btn-lg btn-primary btn-block"/>
        </div>
    <a href="/registration">Зарегистриоваться</a>
</form>
</body>

</html>