package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.AdminReportBean;
import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class AdminGenerateReportDao {

	public static ArrayList<AdminReportBean> report = new ArrayList<AdminReportBean>();

	public static void AdminGenerateReport() {
		report.clear();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = DBUtil.getDBCon();
			ps = con
					.prepareStatement("select c.customer_id,c.cust_name,c.CUSTOMER_ADDR,c.CUSTOMER_PHNO,c.EMAIL_ID,a.ORDER_ID,a.ORDER_DATE,a.PAYMENT_MODE,a.order_status,b.product_id,b.product_name,b.PRODUCT_CATEGORY,b.PRODUCT_STATUS,b.PRODUCT_PRICE,b.PRODUCT_DESC from product1 b left outer join order_details a on a.product_id=b.product_id  right outer join customer1 c on a.customer_id=c.customer_id ");

			rs = ps.executeQuery();

			while (rs.next()) {
				report.add(new AdminReportBean(rs.getString(1), rs.getString(2), rs
						.getString(3), rs.getString(4), rs.getString(5), rs
						.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15)));
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
			
		}finally{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {}
		}

	}
}
