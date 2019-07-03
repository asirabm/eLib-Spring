<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page isELIgnored="false" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>

<script src="pages/jquery.min.js"></script>
<script src="pages/bootstrap.min.js"></script>
 <link rel="stylesheet" href="pages/bootstrap.min.css">




</head>
<body>



<form:form action="/eLibrary/saveedit" method="post">
<table>

<tr>
 <td>Name</td>
 <td><form:input path="name"/></td>
</tr>
<tr>
 <td>Email</td>
 <td><form:input path="email"/></td>
</tr>
<tr>
 <td>Password</td>
 <td><form:input path="password"/></td>
</tr>
<tr>
 <td>Mobile</td>
 <td><form:input path="mobile"/></td>
</tr>
<tr>
<td><input type="submit" value="save"></td>
</tr>

</table>
</form:form>
</body>
</html>