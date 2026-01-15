package com.naukrisphere.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.naukrisphere.model.Job;

public class JobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String INSERT_JOB_SQL = "INSERT INTO jobs (title,company_name,location,salary,type) VALUES (?,?,?,?,?)";
    private static final String SELECT_ALL_JOBS = "SELECT * FROM jobs";
    private static final String UPDATE_JOB_SQL = "UPDATE jobs SET title=?, company_name=?, location=?, salary=?, type=? WHERE id=?";
    private static final String DELETE_JOB_SQL = "DELETE FROM jobs WHERE id=?";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        try {
            if ("delete".equals(action) && idParam != null) {
                deleteJob(Integer.parseInt(idParam));
            }

            List<Job> jobs = getAllJobs();
            request.setAttribute("jobs", jobs);
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String title = request.getParameter("title");
        String company_name = request.getParameter("company_name");
        String location = request.getParameter("location");
        String salary = request.getParameter("salary");
        String type = request.getParameter("type");

        try {
            if (idParam == null || idParam.isEmpty()) {
                insertJob(new Job(0,title,company_name,location,salary,type));
            } else {
                int id = Integer.parseInt(idParam);
                updateJob(new Job(id,title,company_name,location,salary,type));
            }
            response.sendRedirect("JobServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void insertJob(Job j) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT_JOB_SQL)) {
            ps.setString(1,j.getTitle());
            ps.setString(2,j.getCompanyName());
            ps.setString(3,j.getLocation());
            ps.setString(4,j.getSalary());
            ps.setString(5,j.getType());
            ps.executeUpdate();
        }
    }

    private void updateJob(Job j) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(UPDATE_JOB_SQL)) {
            ps.setString(1,j.getTitle());
            ps.setString(2,j.getCompanyName());
            ps.setString(3,j.getLocation());
            ps.setString(4,j.getSalary());
            ps.setString(5,j.getType());
            ps.setInt(6,j.getId());
            ps.executeUpdate();
        }
    }

    private void deleteJob(int id) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(DELETE_JOB_SQL)) {
            ps.setInt(1,id);
            ps.executeUpdate();
        }
    }

    private List<Job> getAllJobs() throws SQLException {
        List<Job> list = new ArrayList<>();
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(SELECT_ALL_JOBS);
            ResultSet rs = ps.executeQuery()) {
            while(rs.next()) {
                list.add(new Job(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("company_name"),
                    rs.getString("location"),
                    rs.getString("salary"),
                    rs.getString("type")
                ));
            }
        }
        return list;
    }
    
    
}
