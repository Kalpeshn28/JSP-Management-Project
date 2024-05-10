<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.database.DbConnection" %>

<%
    // Retrieve the request ID parameter sent from the client-side JavaScript
    int requestId = Integer.parseInt(request.getParameter("requestId"));
    
    // Update the flag column in the database for the specified request ID
    int rowsAffected = 0;
    try {
        Connection con = DbConnection.takeConnection();
        String updateQuery = "UPDATE requests SET flag = ? WHERE rid = ?";
        PreparedStatement ps = con.prepareStatement(updateQuery);
        ps.setInt(1, 2); // Set the flag to 0 (or any other value you need)
        ps.setInt(2, requestId);
        rowsAffected = ps.executeUpdate();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
    
    // Send the number of rows affected back as a response
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(Integer.toString(rowsAffected));
%>
