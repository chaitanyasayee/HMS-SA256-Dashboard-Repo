package com.connection;

import static com.connection.Provider.CONNECTION_URL;
import static com.connection.Provider.DRIVER;
import static com.connection.Provider.PASSWORD;
import static com.connection.Provider.USERNAME;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
		}
	}

	public static Connection getCon() {
		return con;
	}

}
