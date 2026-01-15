<%@ page import="com.naukrisphere.model.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add / Edit Job</title>
    <link rel="stylesheet" type="text/css" href="jobform.css">
</head>

<body>

<%
    // Check if editing existing job
    Job job = (Job) request.getAttribute("job");
    boolean isEdit = (job != null);
%>

<div class="container">

    <h2><%= isEdit ? "Edit Job" : "Add New Job" %></h2>

    <form action="JobServlet" method="post" class="form-card">

        <!-- Hidden field only for edit -->
        <% if (isEdit) { %>
            <input type="hidden" name="id" value="<%= job.getId() %>">
        <% } %>

        <label>Job Title</label>
        <input type="text" name="title" value="<%= isEdit ? job.getTitle() : "" %>" required>

        <label>Company Name</label>
        <input type="text" name="company_name" value="<%= isEdit ? job.getCompanyName() : "" %>" required>

        <label>Location</label>
        <input type="text" name="location" value="<%= isEdit ? job.getLocation() : "" %>" required>

        <label>Salary</label>
        <input type="text" name="salary" value="<%= isEdit ? job.getSalary() : "" %>">

        <label>Job Type</label>
        <select name="type" required>
            <option value="">Select Type</option>
            <option value="Full-Time" <%= isEdit && job.getType().equals("Full-Time") ? "selected" : "" %>>Full-Time</option>
            <option value="Part-Time" <%= isEdit && job.getType().equals("Part-Time") ? "selected" : "" %>>Part-Time</option>
            <option value="Internship" <%= isEdit && job.getType().equals("Internship") ? "selected" : "" %>>Internship</option>
            <option value="Contract" <%= isEdit && job.getType().equals("Contract") ? "selected" : "" %>>Contract</option>
        </select>

        <button type="submit"><%= isEdit ? "Update Job" : "Save Job" %></button>

    </form>

</div>

</body>
</html>
