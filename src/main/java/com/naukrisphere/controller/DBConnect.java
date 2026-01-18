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
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL driver load
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL Driver not found", e);
        }

        // Check environment variables (Aiven / Railway)
        String host = System.getenv("MYSQLHOST");
        String port = System.getenv("MYSQLPORT");
        String db   = System.getenv("MYSQLDATABASE");
        String user = System.getenv("MYSQLUSER");
        String pass = System.getenv("MYSQLPASSWORD");

        if (host != null && !host.isEmpty()) {
            // ✅ Production / Aiven
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
            DB_NAME = "naukri_sphere_db"; // local database
            DB_USER = "root";             // local username
            DB_PASS = "root";             // local password
            USE_AIVEN = false;
        }

        // Optional debug info
        System.out.println("USE_AIVEN = " + USE_AIVEN);
        System.out.println("DB HOST = " + DB_HOST);
        System.out.println("DB PORT = " + DB_PORT);
        System.out.println("DB NAME = " + DB_NAME);
    }

    // Method to get database connection
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
}
