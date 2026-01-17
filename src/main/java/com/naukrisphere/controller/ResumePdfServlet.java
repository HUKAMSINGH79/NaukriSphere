package com.naukrisphere.controller;

import com.naukrisphere.model.Resume;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import java.io.IOException;
import com.lowagie.text.PageSize;
import java.sql.*;

public class ResumePdfServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");
        int id = 0;
        try { id = Integer.parseInt(idParam); } catch (Exception e) {}

        Resume resume = null;

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM resumes WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                resume = new Resume();
                resume.setId(rs.getInt("id"));
                resume.setFullName(rs.getString("full_name"));
                resume.setEmail(rs.getString("email"));
                resume.setPhone(rs.getString("phone"));
                resume.setLocation(rs.getString("location"));
                resume.setObjective(rs.getString("objective"));
                resume.setSkills(rs.getString("skills"));
                resume.setProjects(rs.getString("projects"));
                resume.setExperience(rs.getString("experience"));
                resume.setEducation(rs.getString("education"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (resume == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Resume not found");
            return;
        }

        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition",
                "attachment; filename=\"resume-" + resume.getId() + ".pdf\"");

        try {
            Document document = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter.getInstance(document, resp.getOutputStream());

            document.open();

            Font nameFont   = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font headerFont = new Font(Font.HELVETICA, 14, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 11, Font.NORMAL);

            document.add(new Paragraph(resume.getFullName(), nameFont));
            document.add(new Paragraph(
                    "Email: " + resume.getEmail()
                    + "   Phone: " + resume.getPhone()
                    + "   Location: " + resume.getLocation(),
                    normalFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Career Objective", headerFont));
            document.add(new Paragraph(resume.getObjective(), normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Skills", headerFont));
            document.add(new Paragraph(resume.getSkills(), normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Projects", headerFont));
            document.add(new Paragraph(resume.getProjects(), normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Experience", headerFont));
            document.add(new Paragraph(resume.getExperience(), normalFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Education", headerFont));
            document.add(new Paragraph(resume.getEducation(), normalFont));

            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
