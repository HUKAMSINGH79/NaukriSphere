package com.naukrisphere.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegistrationServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnect.getConnection();
            String sql = "INSERT INTO registration(name, email, password, mobile) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, mobile);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.html?msg=registered");
            } else {
                response.sendRedirect("register.html?error=failed");
            }

        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                response.sendRedirect("register.html?error=exists");
            } else {
                e.printStackTrace();
                response.sendRedirect("register.html?error=db");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.html?error=server");

        } finally {
            try {
                if (pstmt != null) pstmt.close();
              
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
