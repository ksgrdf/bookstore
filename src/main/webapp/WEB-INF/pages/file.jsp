<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Users Page</title>
</head>
<a href="../../index.jsp">Home</a>

<body>

    <table border="1"   align="center"  valign="middle">
        <tr>

            <th width="120">Lofin</th>
            <th width="120">Pass</th>
            <th width="120">Access</th>

        </tr>

            <tr>
                <td>${user.id}</td>
                <td>${user.userLogin}</td>
                <td>${user.userPass}</td>
                <td>${user.userAccess}</td>
            </tr>

    </table>


</body>
</html>