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
    private static final boolean USE_AIVEN;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL Driver not found", e);
        }

        // Check environment variables (Aiven / Production)
        String host = System.getenv("MYSQLHOST");
        String port = System.getenv("MYSQLPORT");
        String db   = System.getenv("MYSQLDATABASE");
        String user = System.getenv("MYSQLUSER");
        String pass = System.getenv("MYSQLPASSWORD");

        if (host != null && !host.isEmpty()) {
            // ✅ Aiven / Production
            DB_HOST = host;
            DB_PORT = (port != null && !port.isEmpty()) ? port : "3306";
            DB_NAME = db;
            DB_USER = user;
            DB_PASS = pass;
            USE_AIVEN = true;
        } else {
            // ✅ Local fallback
            DB_HOST = "localhost";
            DB_PORT = "3306";
            DB_NAME = "naukri_sphere_db";
            DB_USER = "root";
            DB_PASS = "root";
            USE_AIVEN = false;
        }

        // Optional debug info
        System.out.println("DB Mode: " + (USE_AIVEN ? "Aiven / Production" : "Local"));
        System.out.println("DB Host: " + DB_HOST);
        System.out.println("DB Port: " + DB_PORT);
        System.out.println("DB Name: " + DB_NAME);
    }

    // Get database connection
    public static Connection getConnection() throws SQLException {
        String url;

        if (USE_AIVEN) {
            // Aiven requires SSL
            url = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME +
                  "?useSSL=true&requireSSL=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        } else {
            // Local MySQL
            url = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME +
                  "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        }

        return DriverManager.getConnection(url, DB_USER, DB_PASS);
    }

    // Getter methods
    public static String getDbHost() {
        return DB_HOST;
    }

    public static String getDbName() {
        return DB_NAME;
    }

    public static boolean isUseAiven() {
        return USE_AIVEN;
    }
}
