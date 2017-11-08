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
                <li><a href="welcome">Home</a>
                </li>

            </ol>
        </div>
    </div>
</div>

<c:if test="${!empty cart}">
<div class="table">
<table class="text-center">
<tr>
    <th width="120">Image</th>
    <th width="100">Author</th>
    <th width="100">Title</th>
    <th width="60">Price</th>
    <th width="60">Quality</th>
    <th width="60">Delete</th>
</tr>

    <td>${amount}</td>
    <td><c:url var="addAction" value="/cart/order" />

        <form method="POST" action="${addAction}" >
            <input type="submit"
                   value="Add"/>
        </form></td>

    <c:forEach items="${cart}" var="cart">
    <tr>
    <td>
        <img class="img-responsive img-hover" src="http://localhost:8080/image/${cart.id}" width="100" height="70" alt="">
    </td>
        <td>
        ${cart.bookAutor}
        </td>
        <td>
        ${cart.bookTitle}
        </td>
        <td>
        ${cart.price}
        </td>
        <td>
        ${cart.price}
        </td>
        <td>
        <td><a href="<c:url value='/delete/${cart.id}'/>">Delete</a></td>
        </td>
    </tr>
    </c:forEach>


</c:if>
</table>
</div>
</body>
</html>
