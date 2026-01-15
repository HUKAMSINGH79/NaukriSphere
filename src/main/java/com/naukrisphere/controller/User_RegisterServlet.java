package com.naukrisphere.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@MultipartConfig
public class User_RegisterServlet extends HttpServlet {

    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String qualification = request.getParameter("qualification");
        String city = request.getParameter("city");

        Part filePart = request.getPart("resume");
        String resumeFileName = filePart.getSubmittedFileName();

        String uploadPath = request.getServletContext().getRealPath("") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO users(name,email,password,mobile,qualification,city,resume) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, mobile);
            ps.setString(5, qualification);
            ps.setString(6, city);
            ps.setString(7, resumeFileName);

            int result = ps.executeUpdate();

            if (result > 0) {
                filePart.write(uploadPath + File.separator + resumeFileName);
                response.sendRedirect("user_login.jsp?register=success");
            } else {
                response.sendRedirect("use_register.jsp?register=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("user_register.jsp?register=error");
        }
    }
}
