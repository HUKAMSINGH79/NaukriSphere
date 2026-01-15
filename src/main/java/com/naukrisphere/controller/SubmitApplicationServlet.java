package com.naukrisphere.controller;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class SubmitApplicationServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jobTitle = request.getParameter("jobTitle");
        String companyName = request.getParameter("companyName");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Part resumePart = request.getPart("resume");
        String fileName = resumePart.getSubmittedFileName();

        // Resume Upload Path
        String uploadPath = getServletContext().getRealPath("") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        resumePart.write(filePath);

        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO applications(job_title, company_name, name, email, phone, resume_path) VALUES(?,?,?,?,?,?)"
            );

            String applyUrl = request.getParameter("applyUrl");
            ps.setString(1, jobTitle);
            ps.setString(2, companyName);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, filePath);

            ps.executeUpdate();
            
            response.sendRedirect(applyUrl);
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("HomeServlet");
            return;
        }
         
    }
}

