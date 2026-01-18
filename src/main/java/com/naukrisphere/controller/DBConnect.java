package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 1. Get environment variables from Railway
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");

            String url;

            // 2. Check if we are running on Railway or locally
            if (host != null) {
                // Production: Use Railway variables
                url = "jdbc:mysql://" + host + ":" + port + "/" + db
                        + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
                con = DriverManager.getConnection(url, user, pass);
            } else {
                // Local Development: Fallback to your local MySQL settings
                url = "jdbc:mysql://localhost:3306/naukri_sphere_db"
                        + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
                con = DriverManager.getConnection(url, "root", "root");
            }

            if (con != null) {
                System.out.println("DB Connected Successfully!");
            }

        } catch (Exception e) {
            System.err.println("Database Connection Failed! Check if MySQL service is running.");
            e.printStackTrace();
        }
        return con;
    }
}