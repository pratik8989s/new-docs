package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.shopping.beans.RegisterBean;
import com.shopping.beans.UserUpdate;
import com.shopping.util.DBUtil;

public class UserupdateDAO {
	public boolean update(UserUpdate uu) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean b = false;
		try {
			con = DBUtil.getDBCon();

			ps = con.prepareStatement("UPDATE CUSTOMER1 SET CUST_NAME=?,CUSTOMER_ADDR=?,CUSTOMER_PHNO=?,EMAIL_ID=?,PASSWORD=? WHERE CUSTOMER_ID=?");

			ps.setString(1, uu.getName());
			ps.setString(2, uu.getAddress());
			ps.setString(3, uu.getPhNo());
			ps.setString(4, uu.getEmailID());
			ps.setString(5, uu.getPasswd());
			ps.setString(6, uu.getId());
			int result = ps.executeUpdate();

			if (result != 0) {
				b = true;
				con.commit();
				return b;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				ps.close();
				con.close();
			} catch (SQLException e) {
			}
		}

		return b;

	}

}
