package com.naukrisphere.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.naukrisphere.model.Resume;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.*;

public class ResumeBuilderServlet extends HttpServlet {

    
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws  ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String fullName  = req.getParameter("full_name");
        String email     = req.getParameter("email");
        String phone     = req.getParameter("phone");
        String location  = req.getParameter("location");
        String objective = req.getParameter("objective");
        String skills    = req.getParameter("skills");
        String projects  = req.getParameter("projects");
        String exp       = req.getParameter("experience");
        String edu       = req.getParameter("education");

        int generatedId = 0;

        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO resumes(full_name,email,phone,location,objective,skills,projects,experience,education) "
                       + "VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, location);
            ps.setString(5, objective);
            ps.setString(6, skills);
            ps.setString(7, projects);
            ps.setString(8, exp);
            ps.setString(9, edu);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        Resume resume = new Resume();
        resume.setId(generatedId);
        resume.setFullName(fullName);
        resume.setEmail(email);
        resume.setPhone(phone);
        resume.setLocation(location);
        resume.setObjective(objective);
        resume.setSkills(skills);
        resume.setProjects(projects);
        resume.setExperience(exp);
        resume.setEducation(edu);

        req.setAttribute("resume", resume);

        RequestDispatcher rd = req.getRequestDispatcher("resume-view.jsp");
        rd.forward(req, resp);
    }
}
