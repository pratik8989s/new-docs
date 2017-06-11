	package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.util.DBUtil;

public class LoginDAO {
	public static boolean validate(String uname,String upass){  
		boolean status=false;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{  
		
		con = DBUtil.getDBCon(); 
		      
		ps=con.prepareStatement(  "select email_id, password from customer1 where email_id=? and PASSWORD=?");  
		ps.setString(1,uname);  
		ps.setString(2,upass);  
		rs=ps.executeQuery(); 
		
		
		
		if(rs.next())
		{
			status=true;
		}
		else
		{
			status=false;
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		} finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {}
		} 
		return status;  
		}  

}

