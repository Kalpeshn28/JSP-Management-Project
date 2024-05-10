<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="cdn.jsp" %>
<meta charset="ISO-8859-1">
<title>Management Page</title>
</head>
<body style="background-color:powderblue">

<div class="container">
		<div class="row">
			<%@ include file="RequestFrom.jsp" %>
		</div>
		<hr/>
		<div class="row">
		<%@ include file="displayRequest.jsp" %>
		</div>
	</div>

</body>
</html>