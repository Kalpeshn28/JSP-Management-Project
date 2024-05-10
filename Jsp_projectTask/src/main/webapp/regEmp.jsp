<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.DbConnection" %>

<% 
String fn=request.getParameter("FN");
String ln=request.getParameter("LN");
String roles=request.getParameter("roles");

int status =  DbConnection.insertEmp(fn, ln, roles);

response.sendRedirect("RegisterConfirmation.jsp");


%>

