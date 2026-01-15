<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Apply Jobs</title>
<style>
    body { font-family: Arial; background:#f5f5f5; padding:30px; }
    .form-box {
        width: 450px; margin:auto; background:white; padding:25px;
        border-radius:10px; box-shadow:0 0 10px #ccc;
    }
    input, textarea {
        width:100%; padding:10px; margin-top:10px;
        border-radius:6px; border:1px solid #bbb;
    }
    button {
        width:100%; background:#1a73e8; color:white;
        padding:12px; border:none; margin-top:15px;
        border-radius:8px; cursor:pointer; font-size:16px;
    }
</style>
</head>
<body>

<div class="form-box">
    <h2>Apply for <%= request.getAttribute("jobTitle") %></h2>
    <p><b>Company:</b> <%= request.getAttribute("companyName") %></p>

    <form action="SubmitApplicationServlet" method="post" enctype="multipart/form-data">

        <input type="hidden" name="jobTitle" value="<%= request.getAttribute("jobTitle") %>">
        <input type="hidden" name="companyName" value="<%= request.getAttribute("companyName") %>">
        <input type="hidden" name="applyUrl" value="<%= request.getAttribute("applyUrl") %>">

        <label>Name *</label>
        <input type="text" name="name" required>

        <label>Email *</label>
        <input type="email" name="email" required>

        <label>Phone *</label>
        <input type="text" name="phone" required>

        <label>Resume (PDF Only) *</label>
        <input type="file" name="resume" accept=".pdf" required>

        <button type="submit">Submit Application</button>
    </form>
</div>

</body>
</html>
