package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static String DB_HOST;
    private static String DB_PORT;
    private static String DB_NAME;
    private static String DB_USER;
    private static String DB_PASS;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL Driver not found", e);
        }

        // Railway ENV variables (production)
        String host = System.getenv("MYSQL_HOST");
        String port = System.getenv("MYSQL_PORT");
        String db   = System.getenv("MYSQL_DATABASE");
        String user = System.getenv("MYSQL_USER");
        String pass = System.getenv("MYSQL_PASSWORD");

        if (host != null && port != null) {
            // ✅ Railway
            DB_HOST = host;
            DB_PORT = port;
            DB_NAME = db;
            DB_USER = user;
            DB_PASS = pass;
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
        String url =
            "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME +
            "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

        return DriverManager.getConnection(url, DB_USER, DB_PASS);
    }
}
