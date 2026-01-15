package com.naukrisphere.dao;

import com.naukrisphere.controller.DBConnect;
import java.sql.*;
import java.util.*;

public class AlertDAO {

    public boolean subscribe(String email) {
        String sql = "INSERT IGNORE INTO job_alerts(email) VALUES(?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public boolean unsubscribe(String email) {
        String sql = "DELETE FROM job_alerts WHERE email=?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public List<String> getAllSubscribedEmails() {
        List<String> emails = new ArrayList<>();
        String sql = "SELECT email FROM job_alerts";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                emails.add(rs.getString("email"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return emails;
    }
}
