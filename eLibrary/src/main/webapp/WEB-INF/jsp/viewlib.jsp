<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Librairan</title>
<link rel="stylesheet" href="pages/bootstrap.min.css" > 
</head>
<body>
<%
request.getRequestDispatcher("navadmin.jsp").include(request, response);
request.getRequestDispatcher("footer.jsp").include(request, response); 
%>

	<table class="table table-dark" style="width: 80%">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Password</th>
			<th>Mobile</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<c:forEach var="lib" items="${list}">
			<tr>
				<td>${lib.getName()}</td>
				<td>${lib.getEmail()}</td>
				<td>${lib.getPassword()}</td>
				<td>${lib.getMobile()}</td>
				<td><a href="#">Update</a></td>
				<td><a href="#">Delete</a></td>
			</tr>
		</c:forEach>


	</table>

</body>
</html>