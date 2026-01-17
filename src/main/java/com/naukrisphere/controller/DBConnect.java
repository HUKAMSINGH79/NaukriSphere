package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // Detect Environment
    private static final String ENV = System.getenv("ENVIRONMENT"); // "local" या "production"

    // DB Connection Variables
    private static String URL;
    private static String USER;
    private static String PASS;

    // Static block to load driver and configure DB
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if ("production".equalsIgnoreCase(ENV)) {
            // Railway Private Network DB
            URL = "jdbc:mysql://mysql.railway.internal:3306/railway";
            USER = "root";
            PASS = "GkdcTPsCtVozwNUVxZvavkWWAqwiGaBa";
        } else {
            // Local Database
            URL = "jdbc:mysql://localhost:3306/naukri_sphere_db";
            USER = "root";
            PASS = "root";
        }
    }

    // Method to get DB Connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
