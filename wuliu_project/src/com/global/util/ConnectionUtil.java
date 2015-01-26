package com.global.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {
	public Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection("jdbc:oracle:thin:@10.0.3.11:1521:ora9i","amaker","123");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
