package com.database;

import java.sql.*;
import java.util.ArrayList;

public class DbConnection {

	public static Connection takeConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "Kalpesh28@");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static int insertEmp(String fn,String ln ,String roles)
	{
		int status = 0;
		try
		{
			Connection con = takeConnection();
			String query = "insert into employee(fn,ln,roles) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, fn);
			ps.setString(2, ln);
			ps.setString(3, roles);
			
			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static String loginEmp(String fn,String ln)
	{
		int flag = 0;
		String role="";
		try
		{
			Connection con = takeConnection();
			Statement statement=con.createStatement();
			ResultSet set=statement.executeQuery("select * from employee ");
			while(set.next()) {
				if(fn.equals(set.getString("fn") ) && ln.equals(set.getString("ln")) ) {
							role=set.getString("roles");
							flag=1;
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println(flag);
		System.out.println(role);
		return role;
	}
	
	

	
	public static int insertRequest(String rname,String rdesc,String rRaised,String rdept,String currDate)
	{
		int status = 0;
		try
		{
			Connection con = takeConnection();
			String query = "insert into requests(rname, rdesc, reqraise, rdept,reqdate) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, rname);
			ps.setString(2, rdesc);
			ps.setString(3, rRaised);
			ps.setString(4, rdept);
			ps.setString(5, currDate);
			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	
}













