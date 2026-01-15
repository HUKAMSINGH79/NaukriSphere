<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.naukrisphere.model.Resume" %>
<%
    Resume resume = (Resume) request.getAttribute("resume");
    if (resume == null) {
        resume = new Resume();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resume - <%= resume.getFullName() != null ? resume.getFullName() : "" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .resume-container {
            width: 800px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        .header-name {
            font-size: 28px;
            font-weight: bold;
        }
        .header-contact {
            margin-top: 5px;
            font-size: 14px;
            color: #555;
        }
        .section {
            margin-top: 25px;
        }
        .section-title {
            font-size: 18px;
            font-weight: bold;
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 3px;
            margin-bottom: 8px;
        }
        .section-content {
            font-size: 14px;
            line-height: 1.6;
            white-space: pre-line;
        }
        .btn-bar {
            margin-top: 20px;
            text-align: right;
        }
        .btn-download {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-download:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="resume-container">
    <div class="header">
        <div class="header-name">
            <%= resume.getFullName() != null ? resume.getFullName() : "Your Name" %>
        </div>
        <div class="header-contact">
            Email: <%= resume.getEmail() %> |
            Phone: <%= resume.getPhone() %> |
            Location: <%= resume.getLocation() %>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Career Objective</div>
        <div class="section-content">
            <%= resume.getObjective() %>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Skills</div>
        <div class="section-content">
            <%= resume.getSkills() %>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Projects</div>
        <div class="section-content">
            <%= resume.getProjects() %>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Experience</div>
        <div class="section-content">
            <%= resume.getExperience() %>
        </div>
    </div>

    <div class="section">
        <div class="section-title">Education</div>
        <div class="section-content">
            <%= resume.getEducation() %>
        </div>
    </div>

    <div class="btn-bar">
        <a class="btn-download" href="ResumePdfServlet?id=<%= resume.getId() %>">
            Download as PDF
        </a>
    </div>
</div>

</body>
</html>
