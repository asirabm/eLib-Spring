<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<link rel="stylesheet" href="pages/bootstrap.min.css">
<script src="pages/jquery.min.js" type="text/javascript"></script>
<script src="pages/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<%
		request.getRequestDispatcher("navlibrarian.jsp").include(request, response);
	%>
	<table class="table table-dark" style="width: 80%">
		<tr>
			<th>CallNo</th>
			<th>Name</th>
			<th>Author</th>
			<th>Publisher</th>
			<th>Quantity</th>
			<th>Issued</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<c:forEach var="b" items="${list }">
			<tr>
				<td>${b.getCallno()}</td>
				<td>${b.getName()}</td>
				<td>${b.getAuthor()}</td>
				<td>${b.getPublisher()}</td>
				<td>${b.getQuantity()}</td>
				<td>${b.getIssued()}</td>
				<td><a href="updatebook/${b.getCallno()}">Update</a></td>
				<td><a href="deletebook/${b.getCallno()}">Delete</a></td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>