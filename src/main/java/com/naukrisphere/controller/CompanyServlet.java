package com.naukrisphere.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.naukrisphere.model.Company;


public class CompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String INSERT_COMPANY_SQL = "INSERT INTO companies(name,email,phone,website,address) VALUES (?,?,?,?,?)";
    private static final String SELECT_ALL_COMPANIES = "SELECT * FROM companies";
    private static final String UPDATE_COMPANY_SQL = "UPDATE companies SET name=?, email=?, phone=?, website=?, address=? WHERE id=?";
    private static final String DELETE_COMPANY_SQL = "DELETE FROM companies WHERE id=?";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        try {
            if ("delete".equals(action) && idParam != null) {
                deleteCompany(Integer.parseInt(idParam));
            }

            List<Company> companies = getAllCompanies();
            request.setAttribute("listCompanies", companies);
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String address = request.getParameter("address");

        try {
            if (idParam == null || idParam.isEmpty()) {
                insertCompany(new Company(0,name,email,phone,website,address));
            } else {
                int id = Integer.parseInt(idParam);
                updateCompany(new Company(id,name,email,phone,website,address));
            }
            response.sendRedirect("CompanyServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void insertCompany(Company c) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT_COMPANY_SQL)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getWebsite());
            ps.setString(5, c.getAddress());
            ps.executeUpdate();
        }
    }

    private void updateCompany(Company c) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(UPDATE_COMPANY_SQL)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getWebsite());
            ps.setString(5, c.getAddress());
            ps.setInt(6, c.getId());
            ps.executeUpdate();
        }
    }

    private void deleteCompany(int id) throws SQLException {
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(DELETE_COMPANY_SQL)) {
            ps.setInt(1,id);
            ps.executeUpdate();
        }
    }

    private List<Company> getAllCompanies() throws SQLException {
        List<Company> list = new ArrayList<>();
        try(Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(SELECT_ALL_COMPANIES);
            ResultSet rs = ps.executeQuery()) {
            while(rs.next()) {
                list.add(new Company(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("website"),
                    rs.getString("address")
                ));
            }
        }
        return list;
    }
}
