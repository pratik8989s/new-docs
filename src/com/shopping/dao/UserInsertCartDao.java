package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.util.DBUtil;

public class UserInsertCartDao {

	public static void InsertUserCart(String cid, String pid) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = DBUtil.getDBCon();
			ps = con.prepareStatement("insert into mycart values(?,?) ");
			ps.clearParameters();
			ps.setString(1, cid);
			ps.setString(2, pid);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);

		} finally {
			try {

				ps.close();
				con.close();
			} catch (SQLException e) {
			}
		}

	}

}
