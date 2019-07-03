<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page isELIgnored="false" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Issued Books</title>
<link rel="stylesheet" href="pages/bootstrap.min.css">  
<script src="pages/jquery.min.js"  type="text/javascript"></script>
<script src="pages/bootstrap.min.js"  type="text/javascript"></script>
</head>
<body>
<%request.getRequestDispatcher("navlibrarian.jsp").include(request, response); %>


<table class="table table-dark" style="width:80%">
  <tr>
    <th>Callno</th>
    <th>Issued Date</th>
    <th>Return Status</th>
    <th>Student Id</th>
    <th>Student Mobile</th>
    <th>Student Name</th>
  </tr>
  <c:forEach var="ib" items="${list}">
    <tr>
    <td>${ib.getCallno()}</td>
    <td>${ib.getIssueddate()}</td>
    <td>${ib.getReturnstatus()}</td>
    <td>${ib.getStudentid()}</td>
    <td>${ib.getStudentmobile()}</td>
    <td>${ib.getStudentname()}</td>
    </tr>
  </c:forEach>


</table>
</body>
</html>