package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class UserSearchCategory {

	public static ArrayList<ProductBean> prodWithCat = new ArrayList<ProductBean>();

	public static void fetchUserProductWithCategory(String cate) {
		prodWithCat.clear();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getDBCon();
			ps = con.prepareStatement("select * from product1 where PRODUCT_CATEGORY=?");
			ps.setString(1, cate);
			rs = ps.executeQuery();

			while (rs.next()) {
				prodWithCat.add(new ProductBean(rs.getString(1), rs
						.getString(2), rs.getString(3), rs.getString(4), rs
						.getString(5), rs.getString(6)));
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
