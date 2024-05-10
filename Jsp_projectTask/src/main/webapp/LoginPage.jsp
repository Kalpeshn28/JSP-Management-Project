<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="cdn.jsp" %>
<title>Login Page</title>
</head>
<body style="background-color:powderblue" >
<div class="container">

<h1> Log In </h1><br>
<form method="post" action="Log.jsp">
  <div class="form-group row"> 
    <label for="inputFN" class="col-xs-2 col-form-label">First Name</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="FN" id="inputFN" placeholder="First Name">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputLN" class="col-sm-2 col-form-label">Last Name</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" name="LN" id="inputLN" placeholder="Last Name">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">LogIn</button>
    </div>
  </div>
</form>
</div>




</body>
</html>