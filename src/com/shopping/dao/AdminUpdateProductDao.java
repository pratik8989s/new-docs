package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class AdminUpdateProductDao {
	public static ProductBean up_prod;

	public static void fetchUserProduct(String pid) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con = DBUtil.getDBCon();
			ps = con
					.prepareStatement("select * from product1 where product_id=?");
			ps.clearParameters();
ps.setString(1, pid);
			rs = ps.executeQuery();

			rs.next();
				up_prod=new ProductBean(rs.getString(1), rs.getString(2), rs
						.getString(3), rs.getString(4), rs.getString(5), rs
						.getString(6));
			
				
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
