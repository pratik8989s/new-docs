package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class UpdateProductDAO {
	public boolean update(ProductBean pb) {
		boolean b = false;
		Connection con = null;
		PreparedStatement pstat = null;

		try {

			con = DBUtil.getDBCon();

			pstat = con
					.prepareStatement("UPDATE PRODUCT1 SET PRODUCT_ID=?,PRODUCT_NAME=?,PRODUCT_CATEGORY=?,PRODUCT_STATUS=?,PRODUCT_PRICE=?,PRODUCT_DESC=? WHERE PRODUCT_ID=?");

			pstat.setString(1, pb.getPid());
			pstat.setString(2, pb.getPname());
			pstat.setString(3, pb.getPcat());
			pstat.setString(4, pb.getPstatus());
			pstat.setString(5, pb.getPrice());
			pstat.setString(6, pb.getPdesc());
			System.out.println("check3");
			pstat.setString(7, pb.getPid());

			int result = pstat.executeUpdate();

			if (result != 0) {
				b = true;
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
