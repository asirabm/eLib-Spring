<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book Form</title>



<script type="text/javascript">
	var request;
	function checkCallno() {
		var callno = document.frm1.callno.value;
		var url = "callnoCheck"
		request = new XMLHttpRequest();

		try {
			request.onreadystatechange = getInfo;
			request.open("POST", url, true);
			request.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
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
			var cn2 = cn.replace(/<[^>]*>/g, "");
			document.getElementById("check").innerHTML = cn;
			return cn2;
		}
	}

	function f() {
		//alert("Hi");
		var a=document.frm1.callno.value;
		var b=document.frm1.name.value;
		var c=document.frm1.author.value;
		var d=document.frm1.publisher.value;
		var e=document.frm1.quantity.value;
		if(a==""||b==""||c==""||d==""||e==""){
		      alert("Can't be blank");
		      return false;
		  }
		
		
		var s = getInfo().trim();
		if (s == "Already exist") {
			return false;
		} else {
			return true;
		}

	}
</script>



<link rel="stylesheet" href="pages/bootstrap.min.css">
<script src="pages/jquery.min.js" type="text/javascript"></script>
<script src="pages/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

	<%
		request.getRequestDispatcher("navlibrarian.jsp").include(request, response);
	%>
	<h3>Add Book Form</h3>
	<form action="AddBook" name="frm1" method="post" style="width: 300px"
		onsubmit="return f()">
		<div class="form-group d-inline">
			<label for="callno1">Callno</label> <input type="text"
				class="form-control " name="callno" id="callno1"
				placeholder="Callno" onchange="checkCallno()" /> <span id="check"></span>
		</div>
		<div class="form-group">
			<label for="name1">Name</label> <input type="text"
				class="form-control" name="name" id="name1" placeholder="Name" />
		</div>
		<div class="form-group">
			<label for="author1">Author</label> <input type="text"
				class="form-control" name="author" id="author1" placeholder="Author" />
		</div>
		<div class="form-group">
			<label for="publisher1">Publisher</label> <input type="text"
				class="form-control" name="publisher" id="publisher1"
				placeholder="Publisher" />
		</div>
		<div class="form-group">
			<label for="quantity1">Quantity</label> <input type="number"
				class="form-control" name="quantity" id="quantity1"
				placeholder="Quantity" />
		</div>
		<button type="submit" class="btn btn-primary">Save Book</button>
	</form>

</body>
</html>