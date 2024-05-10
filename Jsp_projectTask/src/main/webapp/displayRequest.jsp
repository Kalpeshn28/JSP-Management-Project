<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.sql.*,com.database.DbConnection" %>
</head>
<body>
	<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
		<table class="table table-hover">
		<tr>
			<th>Request ID</th>
			<th>Title </th>
			<th>Request Description </th>
			<th>Request Raised By </th>
			<th>Request Date And Time</th>
			<th>Request Department </th>
			<th>Approval Date and Time </th>
			<th>Status</th>
		</tr>
		<%
		try
		{
			Connection con = DbConnection.takeConnection();	
			String query = "select * from requests order by rid desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				
				
				int reqProcess=rs.getInt(8);
				String appDT=rs.getString(6);
				if(appDT.equals("pending") && reqProcess==2){
					out.println("<td>Declined</td> ");	
				}else if(appDT.equals("pending")){
					out.println("<td>pending</td> ");	
				}else{
					out.println("<td>"+rs.getString(6)+"</td>");
				}
				
				
				
				
				if(reqProcess==1){
					out.println("<td>Not Approved</td> ");
				}else if(reqProcess==2){
					out.println("<td>Declined</td> ");
				}
				else{
					out.println("<td>Approved</td>");
				}
			
				out.println("</tr>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		</table>
		</div>
		<div class="col=md-1"></div>
	</div>
</body>
</html>