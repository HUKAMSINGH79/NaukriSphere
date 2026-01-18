package com.naukrisphere.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DBConnectionTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html"); // अब HTML format में दिखाएगा
        PrintWriter out = resp.getWriter();

        out.println("<html><body style='font-family:sans-serif;'>");
        out.println("<h2>DB Connection Test</h2>");

        try (Connection con = DBConnect.getConnection()) {

            if (con != null && !con.isClosed()) {
                out.println("<p style='color:green;'>✅ DB Connected Successfully!</p>");

                // Optional: run a simple query to show something from DB
                try (Statement stmt = con.createStatement()) {
                    ResultSet rs = stmt.executeQuery("SELECT NOW() AS currentTime");
                    if (rs.next()) {
                        out.println("<p>Current DB Time: " + rs.getString("currentTime") + "</p>");
                    }
                }

                // Show which DB is being used (Aiven or Local)
                out.println("<p>DB Host: " + DBConnect.getDbHost() + "</p>");
                out.println("<p>DB Name: " + DBConnect.getDbName() + "</p>");
                out.println("<p>Using Aiven: " + DBConnect.isUseAiven() + "</p>");

            } else {
                out.println("<p style='color:red;'>❌ DB Connection returned null or closed.</p>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ DB Connection Failed:</p>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }

        out.println("</body></html>");
    }
}
