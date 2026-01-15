package com.naukrisphere.dao;

import com.naukrisphere.controller.DBConnect;
import com.naukrisphere.model.Company;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyDao {

	public static List<Company> getTopCompanies() {
        List<Company> list = new ArrayList<>();
        String sql = "SELECT id, name FROM companies ORDER BY id DESC LIMIT 5";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            	Company c = new Company();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
