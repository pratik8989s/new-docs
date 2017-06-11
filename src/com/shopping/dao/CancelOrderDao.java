package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.util.DBUtil;

public class CancelOrderDao {
	
	public static void cancelUserOrder(String cid, String pid) {
		Connection con=null;
		PreparedStatement ps=null;
		

		try {
			con = DBUtil.getDBCon();
			ps = con
					.prepareStatement("delete from order_details where product_id=? AND customer_id=?  ");
			ps.clearParameters();
			ps.setString(1, pid);
			ps.setString(2, cid);
			ps.executeUpdate();
			
			  

		} catch (Exception e) {
			System.out.println(e);

		}finally{
			try {
				
				ps.close();
				con.close();
			} catch (SQLException e) {}
		}

	}

}
