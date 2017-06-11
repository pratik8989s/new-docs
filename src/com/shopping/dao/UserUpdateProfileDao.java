package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.beans.RegisterBean;
import com.shopping.util.DBUtil;

public class UserUpdateProfileDao {

	public static RegisterBean up_prof;

	public static void fetchUserProduct(String cid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBUtil.getDBCon();
			ps = con.prepareStatement("select * from customer1 where customer_id=?");
			ps.clearParameters();
			ps.setString(1, cid);
			rs = ps.executeQuery();

			rs.next();
			up_prof = new RegisterBean(rs.getString(1), rs.getString(2),
					rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6));

		} catch (Exception e) {
			System.out.println(e);

		} finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
			}
		}

	}

}
