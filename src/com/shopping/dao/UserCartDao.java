package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.CartBean;
import com.shopping.beans.OrderBean2;
import com.shopping.util.DBUtil;

public class UserCartDao {

	public static ArrayList<CartBean> cart = new ArrayList<CartBean>();

	public static void fetchUserCart(String cid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		cart.clear();

		try {
			con = DBUtil.getDBCon();
			String Query = "select b.product_id,b.product_name,b.PRODUCT_CATEGORY,b.PRODUCT_STATUS,b.PRODUCT_PRICE,b.PRODUCT_DESC from mycart a join product1 b on a.product_id=b.product_id where a.customer_id=?";
			ps = con.prepareStatement(Query);
			ps.clearParameters();
			ps.setString(1, cid);
			rs = ps.executeQuery();
			while (rs.next()) {
				cart.add(new CartBean(rs.getString(1), rs.getString(2), rs
						.getString(3), rs.getString(4), rs.getString(5), rs
						.getString(6)));

			}

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
