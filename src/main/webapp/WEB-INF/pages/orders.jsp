<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <spring:url value="/resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/modern-business.css" var="startertemplate"/>
    <link href="/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/books">Back to all book</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="cart">Cart</a>
                </li>

                <li>
                    <a href="welcome">Home</a>
                </li>
                <li>
                    <a href="<c:url value= "/j_spring_security_logout"/>">Logout</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>




    <br/>
    <br/>
    <div>

    <table class="table">
    <tr>
    <th width="120">User</th>
    <th width="120">Autor</th>
    <th width="120">Title</th>
    </tr>
        <tr>${ordersCount/100}<small>грн</small></tr>

        <c:forEach items="${listUsers}" var="user" >
            <c:forEach items="${user.booksOrders}" var="book">
                <tr>
                    <td>${user.username}</td>
                    <td>${book.bookAutor}</td>
                    <td>${book.bookTitle}</td>
                </tr>

            </c:forEach>
        </c:forEach>


    </table>
    </div>
   </body>
</html>
