package com.shopping.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getDBCon(){
		Connection con = null;
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uname = "system";
		String pass = "system";
		con = DriverManager.getConnection(url,uname,pass);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return con;
	}
}

