<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Books Page</title>
    <title>BookData</title>

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
            <a class="navbar-brand" href="welcome">Back</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="cart">Cart</a>
                </li>
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
         <h1 class="page-header">Books

         </h1>
         <ol class="breadcrumb">
            <li><a href="welcome">Home</a>
            </li>

         </ol>
     </div>
 </div>
<!-- /.row -->


    <c:if test="${!empty listBooks}">

    <c:forEach items="${listBooks}" var="book">

        <div class="col-md-4 img-portfolio">
            <a href="/bookdata/${book.id}">
                <img class="img-responsive img-hover" src="http://localhost:8080/image/${book.id}"
                     width="100" height="150" alt="">
            </a>
            <h3>
                ${book.price/100}<small>грн</small>
                <a href="/bookdata/${book.id}">
                        ${book.bookTitle}<br>
                        ${book.bookAutor}
                </a>

            </h3>
            <a href="/cart/${book.id}">
                <img src="/resources/img/add_shopping_cart.png">
            </a>
        </div>

    </c:forEach>
    </c:if>

<!-- /.row -->


<!-- Footer -->
 <footer>
    <div class="row">
        <div class="col-lg-12">
            <p>WebSite for practice</p>
        </div>
    </div>
 </footer>
    <!-- jQuery -->
    <script src="/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
</div>
</body>
</html>
