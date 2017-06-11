package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.beans.ProductBean;
import com.shopping.util.DBUtil;

public class ProductDAO {
	public boolean add(ProductBean pb) {
		Connection con = null;
		PreparedStatement pstat = null;

		boolean b = false;
		try {

			con = DBUtil.getDBCon();

			pstat = con
					.prepareStatement("insert into PRODUCT1 values(prod_seq.nextval,?,?,?,?,?)");

			pstat.setString(1, pb.getPname());
			pstat.setString(2, pb.getPcat());
			pstat.setString(3, pb.getPstatus());
			pstat.setString(4, pb.getPrice());
			pstat.setString(5, pb.getPdesc());

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
