package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.OrderBean2;
import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class UserOrderDao {

	public static ArrayList<OrderBean2> ord = new ArrayList<OrderBean2>();

	public static void fetchUserOrder(String cid) {
		ord.clear();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getDBCon();
			ps = con.prepareStatement("select b.product_id,b.product_name,b.PRODUCT_CATEGORY,b.PRODUCT_STATUS,b.PRODUCT_PRICE,b.PRODUCT_DESC,a.ORDER_ID,a.ORDER_DATE,a.PAYMENT_MODE,a.order_status from order_details a join product1 b on a.product_id=b.product_id where a.CUSTOMER_ID=?");
			ps.clearParameters();
			ps.setString(1, cid);
			rs = ps.executeQuery();

			while (rs.next()) {
				ord.add(new OrderBean2(rs.getString(1), rs.getString(2), rs
						.getString(3), rs.getString(4), rs.getString(5), rs
						.getString(6), rs.getString(7), rs.getString(8), rs
						.getString(9), rs.getString(10)));

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
