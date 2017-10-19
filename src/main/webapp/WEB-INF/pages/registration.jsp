<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset=UTF-8">
    <spring:url value= "/resources/css/bootstrap.css" var= "bootstrap" />
    <spring:url value= "/resources/css/signin.css" var= "signin" />
    <link href= "${bootstrap}" rel= "stylesheet" />
    <link href= "${signin}" rel= "stylesheet" />
</head>
<body>


<c:url var="addUser" value="registration" />


<div class="form-signin">
    <form:form method="POST" action="${addUser}" commandName="user" >



        <form:label path="username">
            <spring:message text="Enter login"/>
        </form:label>
        <form:input path="username" class= "form-control" />
        <form:errors path="username"></form:errors>

        <form:label path="password">
            <spring:message text="Enter password"/>
        </form:label>
     <form:input path="password" class= "form-control" />
        <form:errors path="password"></form:errors>

        <form:label path="PassConfirm">
            <spring:message text="Confir, password"/>
        </form:label>
        <form:input path="passConfirm" class= "form-control" />
        <form:errors path="passConfirm"></form:errors>
        <input value="Войти" type="submit" class= "btn btn-lg btn-primary btn-block"/>


    </form:form>
</div>

</body>
</html>
