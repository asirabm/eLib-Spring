<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="java.sql.Date" %>   
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var request;
	var cc;
	var cn2;
	function checkstudent() {
		var id = document.frm1.studentid.value;
		var url = "checkstudent"
		request = new XMLHttpRequest();

		try {
			request.onreadystatechange = getInfo2;
			request.open("POST", url, true);
			request.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			request.send("id=" + id);

		} catch (e) {
			alert(e);
		}

		//alert("Hi");
	}
	function getInfo2() {
		//alert("Hi");
		if (request.readyState == 4) {
			var cn = request.responseText;
			cc = cn.replace(/<[^>]*>/g, "");
			document.getElementById("check2").innerHTML = cn;
			return cn2;
		}
	}
	
	
	
	
	function checkCallno() {
		var callno = document.frm1.callno.value;
		var url = "callnoavailable"
		request = new XMLHttpRequest();

		try {
			request.onreadystatechange = getInfo;
			request.open("POST", url, true);
			request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			request.send("callno=" + callno);

		} catch (e) {
			alert(e);
		}

		//alert("Hi");
	}
	function getInfo() {
		//alert("Hi");
		if (request.readyState == 4) {
			var cn = request.responseText;
			cn2 = cn.replace(/<[^>]*>/g, "");
			document.getElementById("check").innerHTML = cn;
			return cn2;
		}
	}

	function f() {
		//alert("Hi");
	    cn21=cn2.trim();
	    cc1=cc.trim();
	    var a=document.frm1.callno.value;
	    var b=document.frm1.studentid.value;
	    var c=document.frm1.studentname.value;
	    var d=document.frm1.studentmobile.value;
	    if(a==""||b==""||c==""||d==""){
	      alert("Can't be blank");
	      return false;
	    }
	    
	    
	    
		if (cn21 =="Available" && cc1=="you can get a book") {
			return true;
		} 
		else {
			return false;
		}

	}
</script>











<meta charset="ISO-8859-1">
<link rel="stylesheet" href="pages/bootstrap.min.css">  
<script src="pages/jquery.min.js"  type="text/javascript"></script>
<script src="pages/bootstrap.min.js"  type="text/javascript"></script>
</head>
<body>
<%request.getRequestDispatcher("navlibrarian.jsp").include(request, response); %>
${msg}
<h3>Issue Book Form</h3>

  <form action="IssueBook" method="post" style="width:300px" name="frm1" onsubmit="return f()">
   <input type="hidden" name="returnstatus" value="no">
   <input type="hidden" name="issueddate" value=<%=new java.sql.Date(System.currentTimeMillis()) %>>
  <div class="form-group">
    <label for="callno1">Book Callno</label>
    <input type="text" class="form-control" name="callno" id="callno1" onchange="checkCallno()" placeholder="Callno"/>
    <span id="check"></span>
  </div>
  <div class="form-group">
    <label for="id1">Student Id</label>
    <input type="text" class="form-control" name="studentid" id="id1" onchange="checkstudent()" placeholder="Student Id"/>
    <span id="check2"></span>
  </div>
  <div class="form-group">
    <label for="name1">Student Name</label>
    <input type="text" class="form-control" name="studentname" id="name1" placeholder="Student Name"/>
     
  </div>
  <div class="form-group">
    <label for="mobile1">Student Mobile</label>
    <input type="number" class="form-control" name="studentmobile" id="mobile1" placeholder="Student Mobile"/>
  </div>
  <button type="submit" class="btn btn-primary">Issue Book</button>
</form>
</body>
</html>