<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WellCome</title>
<link rel="stylesheet" href="pages/bootstrap.min.css">
<script src="pages/jquery.min.js" type="text/javascript"></script>
<script src="pages/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>

<%
request.getRequestDispatcher("navadmin.jsp").include(request, response);
request.getRequestDispatcher("admincarousel.jsp").include(request, response);
request.getRequestDispatcher("footer.jsp").include(request, response); 

%>
</body>
</html>