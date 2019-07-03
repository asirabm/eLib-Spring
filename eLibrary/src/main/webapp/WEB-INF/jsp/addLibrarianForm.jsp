<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var request;
function emailcheck() {
	//alert("Hi");
	var email = document.frm1.email.value;
	var url = "emailCheck"
	request = new XMLHttpRequest();
	//alert("Hi");

	try {
		request.onreadystatechange = getInfo;
		request.open("POST", url, true);
		request.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		request.send("email=" + email);

	} catch (e) {
		alert(e);
	}

	//alert("Hi");
}
function getInfo() {
	//alert("Hi");
	if (request.readyState == 4) {
		var cn = request.responseText;
		var cn2 = cn.replace(/<[^>]*>/g, "");
		document.getElementById("check").innerHTML = cn;
		return cn2;
	}
}

function f() {
	//alert("Hi");
	var a=document.frm1.name.value;
	var b=document.frm1.email.value;
	var c=document.frm1.password.value;
	var d=document.frm1.mobile.value;
	
	if(a==""||b==""||c==""||d==""){
	      alert("Can't be blank");
	      return false;
	  }
	
	
	var s = getInfo().trim();
	if (s == "Already Taken,please select another one") {
		return false;
	} else {
		return true;
	}

}












</script>
<link rel="stylesheet" href="pages/bootstrap.min.css" > 
<script src="pages/jquery.min.js"  type="text/javascript"></script>
<script src="pages/bootstrap.min.js"  type="text/javascript"></script>
<meta charset="ISO-8859-1">
<title>lib Form</title>
</head>
<body>

<%
request.getRequestDispatcher("navadmin.jsp").include(request, response);
request.getRequestDispatcher("footer.jsp").include(request, response); 
%>


<h1>Add New Employee</h1> 
<div class="container">
  <form:form action="savelib"  method="post" style="width:300px" name="frm1" onsubmit="return f()">
  <div class="form-group">
	   <label for="name">Name</label>
	   <form:input path="name" class="form-control" id="name" placeholder="First Name"/>
  </div>
  <div class="form-group">
	  <label for="email">Email Address</label>
	  <form:input path="email" type="email" class="form-control" id="email" onchange="emailcheck()" placeholder="Email Address"/>
	  <span id="check"></span>
  </div>
  <div class="form-group">
	  <label for="password">Password</label>
	  <form:input path="password" class="form-control" id="password" placeholder="Password"/>
  </div>
  <div class="form-group">
	  <label for="mobile">Mobile</label>
	  <form:input path="mobile"  type="mobile" class="form-control" id="mobile" placeholder="Mobile"/>
  </div>
  <button type="submit"  class="btn btn-primary">Submit</button>
</form:form>
</div>

</body>
</html>