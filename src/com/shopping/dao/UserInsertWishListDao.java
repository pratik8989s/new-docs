package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class UserInsertWishListDao {

	public static void InsertUserWishlist(String cid, String pid) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = DBUtil.getDBCon();
			ps = con.prepareStatement("insert into mywishlist values(?,?) ");
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
