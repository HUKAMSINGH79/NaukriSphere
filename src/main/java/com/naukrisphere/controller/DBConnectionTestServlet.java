package com.naukrisphere.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DBConnectionTest")
public class DBConnectionTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnect.getConnection();
            out.println("<h3>✅ DB Connected Successfully!</h3>");
            System.out.println("✅ DB Connected: " + con);
        } catch (Exception e) {
            out.println("<h3>❌ DB Connection Failed!</h3>");
            e.printStackTrace();
        }
    }
}
