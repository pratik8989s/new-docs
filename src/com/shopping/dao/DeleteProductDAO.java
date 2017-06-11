package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.util.DBUtil;

public class DeleteProductDAO {
	public static boolean delete(String pid) {

		boolean status = false;
		Connection con = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		ResultSet rs = null;
		try {

			con = DBUtil.getDBCon();
			ps1 = con
					.prepareStatement("delete from order_details where PRODUCT_ID=?");
			ps1.setString(1, pid);
			int result1 = ps1.executeUpdate();
			ps2 = con.prepareStatement("delete from mycart where PRODUCT_ID=?");
			ps2.setString(1, pid);
			int result2 = ps2.executeUpdate();
			ps3 = con
					.prepareStatement("delete from mywishlist where PRODUCT_ID=?");
			ps3.setString(1, pid);
			int result3 = ps3.executeUpdate();
			ps4 = con
					.prepareStatement("delete from PRODUCT1 where PRODUCT_ID=?");
			ps4.setString(1, pid);
			int result4 = ps4.executeUpdate();

			if (result4 != 0) {

				status = true;
				con.commit();
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				ps1.close();
				ps2.close();
				ps3.close();
				ps4.close();
				con.close();
			} catch (SQLException e) {
			}
		}
		return status;
	}
}
