<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp" %>
</head>
<body>
<div class="text-center">

<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<fieldset>
				<legend>Request Form</legend>
				<form method="post" action="insertRequest.jsp">
					<input type="text" name="Rname" class="form-control" placeholder="Enter Request Title"/><br/>
					<textarea placeholder="Enter Request Description" name="Rdesc" rows="6" cols="50"></textarea><br>
					<input type="text" name="RRaise" class="form-control" placeholder="Request Raised By "/><br/>
					<select  name="Rdept" class="form-control">
	                <option >Select Department </option>
	                <option value="Legal">Legal Request </option>
	                <option value="Financial">Financial Request</option>
            	</select><br/>
            	<input type="submit" class="btn btn-primary" value="Submit Request"/>
				</form>
			</fieldset>
		</div>
		</div>
		
		</div>
</body>
</html>