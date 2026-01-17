package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	private static final String DB_HOST;
	private static final String DB_PORT;
	private static final String DB_NAME;
	private static final String DB_USER;
	private static final String DB_PASS;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			throw new RuntimeException("MySQL Driver not found", e);
		}

		String railwayHost = System.getenv("MYSQLHOST");
		String railwayPort = System.getenv("MYSQLPORT");
		String railwayDb = System.getenv("MYSQLDATABASE");
		String railwayUser = System.getenv("MYSQLUSER");
		String railwayPass = System.getenv("MYSQLPASSWORD");

		if (railwayHost != null) {
			// ✅ Railway (Production)
			DB_HOST = railwayHost;
			DB_PORT = railwayPort;
			DB_NAME = railwayDb;
			DB_USER = railwayUser;
			DB_PASS = railwayPass;
		} else {
			// ✅ Local
			DB_HOST = "localhost";
			DB_PORT = "3306";
			DB_NAME = "naukri_sphere_db";
			DB_USER = "root";
			DB_PASS = "root";
		}
	}

	public static Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME
				+ "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

		return DriverManager.getConnection(url, DB_USER, DB_PASS);
	}
}
