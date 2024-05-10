<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.database.DbConnection,java.sql.*,java.util.*,java.text.*,java.time.*,java.time.format.DateTimeFormatter" %>
    <% 
String rname=request.getParameter("Rname");
String rdesc=request.getParameter("Rdesc");
String rRaised=request.getParameter("RRaise");
String rdept=request.getParameter("Rdept");
LocalDateTime currentDateTime = LocalDateTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss", Locale.forLanguageTag("en-IN"));
String currDate= currentDateTime.format(formatter);

int status =  DbConnection.insertRequest(rname, rdesc, rRaised, rdept, currDate);
response.sendRedirect("managementPage.jsp");

%>