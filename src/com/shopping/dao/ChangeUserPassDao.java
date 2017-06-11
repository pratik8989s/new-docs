package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.beans.UserUpdate;
import com.shopping.util.DBUtil;

public class ChangeUserPassDao {

	public static String updateUserPass(String oldpass,String newpass)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String b = "false";
		try{
		  con = DBUtil.getDBCon(); 
		      
		
		 ps=con.prepareStatement("update customer1 set password=? where password=?");   
		ps.setString(1, oldpass);
		ps.setString(2, newpass);
		
		
		int result =ps.executeUpdate();
		
		
		  
		
		 if(result!=0){
		    	b = "true";
		    	con.commit();
		    	return b;
		    }}
		catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {}
		}
		
		return b;
		
		
}
}


