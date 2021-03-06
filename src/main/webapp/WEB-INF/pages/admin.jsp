<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>KSG</title>
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
            <a class="navbar-brand" href="books">Back to all book</a>
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

<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Admin page</h1>
            <ol class="breadcrumb">
                <li><a href="/welcome">Home</a></li>
                <li></li>
                <li><a href="/orders">Orders</a></li>
                <li></li>
                <li><a href="#add">Add book</a> </li>
            </ol>
        </div>
    </div>

    <br/>
    <br/>

<h1 align="center">Book List</h1>

<c:if test="${!empty listBooks}">
    <table class="table">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Autor</th>
            <th width="120">Price</th>
            <th width="120">IMG</th>
            <th width="120">INFO</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_blank">${book.bookTitle}</a></td>
                <td>${book.bookAutor}</td>
                <td>${book.price/100}</td>
                <td><img src="/image/${book.id}" width="150" height="150"></td>
                <td>${book.bookInfo}</td>
                <td><a href="<c:url value='/edit/${book.id}#add'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

    <a name="add"><h1 align="center">Add a Book</h1></a>

<c:url var="addAction" value="/admin/add" />

<form:form method="POST" action="${addAction}"  commandName="book" enctype="multipart/form-data" accept-charset="utf-8">
        <input type="file" class="file" name="file"/>
    <table class="table">

        <c:if test="${!empty book.bookTitle}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>

                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="bookTitle">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="bookAutor">
                    <spring:message text="Autor"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookAutor"/>
            </td>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
            <td>
                <form:label path="bookInfo">
                    <spring:message text="Information"/>
                </form:label>
            </td>

            <td>
                <form:input cssStyle="width:100%" path="bookInfo" />
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.bookTitle}">

                    <input type="submit"
                           value="<spring:message text="Edit Book"/>"/>
                </c:if>
                <c:if test="${empty book.bookTitle}">
                    <input type="submit"
                           value="<spring:message text="Add Book"/>"/>

                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
