<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.database.DbConnection,java.sql.*" %>
    <% 
String fn=request.getParameter("FN");
String ln=request.getParameter("LN");

 String role=  DbConnection.loginEmp(fn, ln);



 if(role.equals("Roles_Legal")){
	response.sendRedirect("legalPage.jsp");
}
 else if(role.equals("Roles_Management")){
	response.sendRedirect("managementPage.jsp");
}
 else if(role.equals("Roles_Finance")){
	response.sendRedirect("FinancePage.jsp");
}else{
	response.sendRedirect("index.jsp");	
}

%>


<%-- legal=1, management=2 , finance=3  --%> 