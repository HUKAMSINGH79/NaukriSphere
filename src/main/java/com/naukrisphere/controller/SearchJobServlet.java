package com.naukrisphere.controller;

import com.naukrisphere.model.Job;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchJobServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        List<Job> jobList = new ArrayList<>();

        String sql = "SELECT * FROM jobs";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE title LIKE ? OR company_name LIKE ? OR location LIKE ?";
        }

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (keyword != null && !keyword.trim().isEmpty()) {
                String search = "%" + keyword + "%";
                ps.setString(1, search);
                ps.setString(2, search);
                ps.setString(3, search);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job job = new Job(
                		rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("company_name"),
                        rs.getString("location"),
                        rs.getString("salary"),
                        rs.getString("type")
                );
                jobList.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("jobs", jobList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
