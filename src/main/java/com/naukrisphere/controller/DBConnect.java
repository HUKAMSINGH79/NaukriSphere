package com.naukrisphere.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    //private static final String URL = "jdbc:mysql://localhost:3306/naukri_sphere_db";
	private static final String URL = "mysql://root:GkdcTPsCtVozwNUVxZvavkWWAqwiGaBa@mysql.railway.internal:3306/railway";
	
    //private static final String USER = "root";
	
	private static final String USER = "root";
    
   // private static final String PASS = "root";
    
    private static final String PASS = "GkdcTPsCtVozwNUVxZvavkWWAqwiGaBa";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return DriverManager.getConnection(URL, USER, PASS);
    }
}
