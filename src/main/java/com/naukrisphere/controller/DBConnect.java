package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // Database configuration (auto detect)
    private static final String DB_HOST;
    private static final String DB_PORT;
    private static final String DB_NAME;
    private static final String DB_USER;
    private static final String DB_PASS;

    static {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL Driver not found", e);
        }

        /*
         Railway automatically sets these ENV variables
         Local system me yeh null rahenge
        */
        String railwayHost = System.getenv("MYSQL_HOST");
        String railwayPort = System.getenv("MYSQL_PORT");
        String railwayDb   = System.getenv("MYSQL_DATABASE");
        String railwayUser = System.getenv("MYSQL_USER");
        String railwayPass = System.getenv("MYSQL_PASSWORD");

        if (railwayHost != null) {
            // ✅ PRODUCTION (Railway)
            DB_HOST = railwayHost;
            DB_PORT = railwayPort;
            DB_NAME = railwayDb;
            DB_USER = railwayUser;
            DB_PASS = railwayPass;
        } else {
            // ✅ LOCAL
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
