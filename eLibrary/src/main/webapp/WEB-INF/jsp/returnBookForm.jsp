<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page isELIgnored="false" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Return Book Form</title>
<script type="text/javascript">
function f(){
	var a=document.frm1.callno.value;
	var b=document.frm1.studentid.value;
	if(a==""||b==""){
	      alert("Can't be blank");
	      return false;
	  }
	
	
}


</script>


<link rel="stylesheet" href="pages/bootstrap.min.css">  
<script src="pages/jquery.min.js"  type="text/javascript"></script>
<script src="pages/bootstrap.min.js"  type="text/javascript"></script>
</head>
<body>
<%request.getRequestDispatcher("navlibrarian.jsp").include(request, response); %>

<h3>Return Book Form</h3>
  <form action="ReturnBook" method="post" style="width:300px" name="frm1" onsubmit="return f()">
  <div class="form-group">
    <label for="callno1">Callno</label>
    <input type="text" class="form-control" name="callno" id="callno1" placeholder="Callno"/>
  </div>
  <div class="form-group">
    <label for="studentid1">Student Id</label>
    <input type="text" class="form-control" name="studentid" id="studentid1" placeholder="StudentId"/>
  </div>
  <button type="submit" class="btn btn-primary">Return Book</button>
</form>

</body>
</html>