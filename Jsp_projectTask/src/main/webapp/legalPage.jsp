<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="cdn.jsp" %>
<meta charset="ISO-8859-1">
<title>Legal Page</title>
<%@ page import="java.sql.*,com.database.DbConnection,java.util.*,java.text.*,java.time.*,java.time.format.DateTimeFormatter" %>
</head>
<body style="background-color:powderblue">

<div class="container">
<div class="text-center" >
<h1> Legal Department ! </h1>


</div>
<div class="row">
<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
		<table class="table table-hover">
		<br><br><br>
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
		
		<%!
		public int update(int rid) 
		{
            int status = 0;
            
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss", Locale.forLanguageTag("en-IN"));
            String currDate= currentDateTime.format(formatter);
            
            try {
                Connection con = DbConnection.takeConnection();
                String updateQuery = "UPDATE requests SET flag = ?, approvedDate= ? WHERE rid = ?";
                PreparedStatement ps = con.prepareStatement(updateQuery);
                ps.setInt(1, 0);// Set the flag to 0 (or any other value you need)
                ps.setString(2, currDate);
                ps.setInt(3, rid);
                status = ps.executeUpdate();
                con.close();
            } catch(Exception e) {
            	
                e.printStackTrace();
            }
            return status;
		}
		
		public int decline(int rid) 
		{
            int status = 0;
            try {
                Connection con = DbConnection.takeConnection();
                String updateQuery = "UPDATE requests SET flag = ? WHERE rid = ?";
                PreparedStatement ps = con.prepareStatement(updateQuery);
                ps.setInt(1, 2); // Set the flag to 0 (or any other value you need)
                ps.setInt(2, rid);
                status = ps.executeUpdate();
                con.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
            return status;
		}
		%>
		
		<%
		
		try
		{
			Connection con = DbConnection.takeConnection();	
			String query = "select * from requests where rdept='Legal' AND flag=1 order by rid desc";
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
				
				String appDT=rs.getString(6);
				if(appDT.equals("pending")){
					out.println("<td>pending</td> ");	
				}else{
					out.println("<td>not pending</td>");
				}
				
				
				
                // Pass request ID to the JavaScript update function
				out.println("<td> <button value=\""+ rs.getInt(1) +"\" onclick=\"update("+ rs.getInt(1) +")\">Aprrove</button> <button value=\""+ rs.getInt(1) +"\" onclick=\"decline("+ rs.getInt(1) +")\">Decline</button> </td>");
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
</div>
</div>

<script>
    function update(rid) {
        // Perform AJAX request to update the database
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // Handle response from server
                var rowsAffected = parseInt(this.responseText);
                if (rowsAffected > 0) {
                    alert("Request with ID " + rid + " updated successfully!");
                    // Optionally, update the UI to reflect the change
                } else {
                    alert("Failed to update request with ID " + rid);
                }
            }
        };
        xhttp.open("GET", "updateRequest.jsp?requestId=" + rid, true);
        xhttp.send();
    }
    function decline(rid) {
        // Perform AJAX request to update the database
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // Handle response from server
                var rowsAffected = parseInt(this.responseText);
                if (rowsAffected > 0) {
                    alert("Request with ID " + rid + " updated successfully!");
                    // Optionally, update the UI to reflect the change
                } else {
                    alert("Failed to update request with ID " + rid);
                }
            }
        };
        xhttp.open("GET", "declineRequest.jsp?requestId=" + rid, true);
        xhttp.send();
    }
</script>

</body>
</html>
