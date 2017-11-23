<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Title</title>
    <link href="/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="/resources/css/modern-business.css" rel="stylesheet" />
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
            <a class="navbar-brand" href="books">Back</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="login">Log in</a>
                </li>
                <li>
                    <a href="admin">For Admin</a>
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
<!-- Page Heading/Breadcrumbs -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Cart

            </h1>
            <ol class="breadcrumb">
                <li><a href="welcome">Home</a></li>
                <li>${amount/100}<small>грн</small></li>
                <li><c:url var="addAction" value="/cart/order" />

                    <form method="POST" action="${addAction}" >
                        <input type="submit"
                               value="Buy"/>
                    </form></li>

            </ol>
        </div>
    </div>
</div>

<c:if test="${!empty cart}">




    <c:forEach items="${cart}" var="cart">
        <div class="col-md-4 img-portfolio">
            <a href="/bookdata/${cart.id}">
                <img class="img-responsive img-hover" src="/image/${cart.id}"
                     width="100" height="150" alt="">
            </a>
            <h3>
                    ${cart.price/100}<small>грн</small><br>
                        ${cart.bookTitle}<br>
                        ${cart.bookAutor}


            </h3>
            <a href="<c:url value='/delete/${cart.id}'/>">Delete</a>
        </div>

    </c:forEach>


</c:if>


</body>
</html>
