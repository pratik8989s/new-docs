
package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.util.DBUtil;

public class AdminDAO {
	
	public static boolean validate(String name,String pass){  
		boolean status=false; 
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{  
		
		con = DBUtil.getDBCon(); 
		      
		ps=con.prepareStatement("select email_id,password from admin where email_id=? and password=?");  
		ps.setString(1,name);  
		ps.setString(2,pass);  
		rs=ps.executeQuery();  
		
		status=rs.next();  
		  
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

