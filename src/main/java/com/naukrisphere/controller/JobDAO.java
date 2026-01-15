package com.naukrisphere.controller;

import com.naukrisphere.model.Job;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {

    private static final String SELECT_ALL_JOBS = "SELECT * FROM jobs";

    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_JOBS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                int id = rs.getInt("id");
                String title = rs.getString("title");

               
                String companyName = rs.getString("company_name");

                String location = rs.getString("location");
                String salary = rs.getString("salary");
                String type = rs.getString("type");

                
                Job job = new Job(id, title, companyName, location, salary, type);
               

                jobs.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return jobs;
    }
}
