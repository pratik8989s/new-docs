package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class UpdateOrderStatusDao {

	public static String updateOrderStatus(String oid,String ostatus) {
		String b = "false";
		Connection con = null;
		PreparedStatement pstat = null;

		try {

			con = DBUtil.getDBCon();

			pstat = con
					.prepareStatement("UPDATE order_details SET ORDER_STATUS=? WHERE ORDER_ID=?");

			pstat.setString(1, ostatus);
			pstat.setString(2, oid);
		
			

			int result = pstat.executeUpdate();

			if (result != 0) {
				b = "true";
				con.commit();
				return b;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				pstat.close();
				con.close();
			} catch (SQLException e) {
			}
		}

		return b;
	}
	
	
	
	
}
