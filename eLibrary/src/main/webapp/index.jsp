<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="pages/bootstrap.min.css"> 
<script type = "text/javascript">


 function  validateform1(){
   let email=document.frm1.email.value;
   let pw=document.frm1.password.value;
   if(email==""||pw==""){
    alert("Can't be blank");
    return false;
   }   
 }
 function  validateform2(){
   let email=document.frm2.email.value;
   let pw=document.frm2.password.value;
   if(email==""||pw==""){
    alert("Can't be blank");
    return false;
   }   
 }




</script>



</head>
<body>
<%
  session.invalidate();
  
  %>
<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">eLibrary</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.html" class="active">Home</a></li>
        <li><a href="#">Admin</a></li>
        <li><a href="#">Librarian</a></li>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
<h1>eLibrary</h1>

<div class="row">
  <div class="col-md-6">
  <h3>Admin Login</h3>
  <form action="adminLogin" method="post" name="frm1" style="width:300px" onsubmit="return validateform1()">
  <div class="form-group">
    <label for="email1">Email address</label>
    <input type="email" class="form-control" name="email" id="email1" placeholder="Email"/>
  </div>
  <div class="form-group">
    <label for="password1">Password</label>
    <input type="password" class="form-control" name="password" id="password1" placeholder="Password"/>
  </div>  
  <button type="submit" class="btn btn-primary">Login</button>
</form>
  
  </div>
  <%
  //HttpServletRequest request2=(HttpServletRequest)session.getAttribute("request");
  // out.print(name);
 // String name= (String)((HttpServletRequest) session.getAttribute("request")).getAttribute("value");
  //String name=(String)request.getAttribute("value"); 
  /*if(name!=null){
	   out.println(name);
   }*/
  %>

  
  
  <div class="col-md-6">
  <h3>Librarian Login</h3>
  <form action="LibrarianLogin" name="frm2" method="post" style="width:300px" onsubmit="return validateform2()">
  <div class="form-group">
    <label for="email2">Email address</label>
    <input type="email" class="form-control" id="email2" name="email" placeholder="Email"/>
  </div>
  <div class="form-group">
    <label for="password2">Password</label>
    <input type="password" class="form-control" id="password2" name="password" placeholder="Password"/>
  </div>  
  <button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
  </div>
</div>




  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
</body>
</html>