<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books Page</title>
    <title>BookData</title>

    <spring:url value="/resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/modern-business.css" var="startertemplate"/>
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
                    <a href="/cart">Cart</a>
                </li>
                <li>
                    <a href="/login">Log in</a>
                </li>
                <li>
                    <a href="/admin">For Admin</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<br/>
<br/>
<div class="container">

<!-- Page Heading/Breadcrumbs -->
  <div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Three Column Portfolio
            <small>Subheading</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="/welcome">Home</a>
            </li>
            <li class="active">Three Column Portfolio</li>
        </ol>
    </div>
  </div>

    <br/>
    <br/>
 <!-- /.row -->

    <div class="row">
        <div class="col-md-8">
            <img class="img-responsive" src="http://localhost:8080/image/${book.id}" width="150" height="200" alt="">
        </div>

          <div class="col-md-4">
              <h3>${book.bookTitle}</h3>
              <h3>${book.bookAutor}</h3><br>
              <p>${book.price/100}${book.price%100}</p>
              <p>${book.bookInfo}</p>
          </div>
       </div>

 </div>
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