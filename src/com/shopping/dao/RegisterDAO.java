package com.shopping.dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

import com.shopping.beans.RegisterBean;
import com.shopping.util.DBUtil;

public class RegisterDAO {
	public boolean register(RegisterBean rb) {
		Connection con = null;
		PreparedStatement pstat = null;
		boolean b = false;

		try {

			con = DBUtil.getDBCon();

			pstat = con
					.prepareStatement("insert into CUSTOMER1 values(cust_seq.nextval,?,?,?,?,?)");

			pstat.setString(1, rb.getName());
			pstat.setString(2, rb.getAddress());
			pstat.setString(3, rb.getPhNo());
			pstat.setString(4, rb.getEmailID());
			pstat.setString(5, rb.getPasswd());

			int result = pstat.executeUpdate();

			if (result > 0) {
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
