package com.naukrisphere.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DBConnectionTestServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();

        try (Connection con = DBConnect.getConnection()) {
            if (con != null && !con.isClosed()) {
                out.println("✅ DB Connected Successfully!");
            } else {
                out.println("❌ DB Connection returned null or closed.");
            }
        } catch (Exception e) {
            out.println("❌ DB Connection Failed:\n");
            e.printStackTrace(out);
        }
    }
}
