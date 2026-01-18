package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Fetching Railway Environment Variables
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");

            // Validation check
            if (host == null || port == null) {
                System.err.println("ERROR: Database environment variables are NOT SET in Railway!");
                return null;
            }

            String url = "jdbc:mysql://" + host + ":" + port + "/" + db
                    + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            con = DriverManager.getConnection(url, user, pass);
            System.out.println("SUCCESS: Connected to Railway MySQL!");

        } catch (Exception e) {
            System.err.println("FAILURE: Could not connect to database.");
            e.printStackTrace();
        }
        return con;
    }
}