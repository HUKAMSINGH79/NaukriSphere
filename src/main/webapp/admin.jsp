<%@ page import="java.util.List, java.util.ArrayList, com.naukrisphere.model.Company, com.naukrisphere.model.Job" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>

<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="#companies">Companies</a>
        <a href="#jobs">Jobs</a>
    </div>

    <!-- Main content -->
    <div class="main">

        <%-- Get attributes safely --%>
        <%
            List<Company> companiesList = (List<Company>) request.getAttribute("listCompanies");
            if (companiesList == null) companiesList = new ArrayList<>();

            List<Job> jobsList = (List<Job>) request.getAttribute("listJobs");
            if (jobsList == null) jobsList = new ArrayList<>();
        %>

        <h1>Dashboard</h1>
        <div class="cards">
            <div class="card">
                <h3>Total Companies</h3>
                <p><%= companiesList.size() %></p>
            </div>
            <div class="card">
                <h3>Total Jobs</h3>
                <p><%= jobsList.size() %></p>
            </div>
        </div>

        <!-- Companies Section -->
        <section id="companies">
            <h2>Companies</h2>
            <a href="addCompanies.jsp" class="btn add-btn">+ Add Company</a>
            <div class="list-container">
                <% for (Company c : companiesList) { %>
                <div class="list-item">
                    <div class="actions">
                        <a href="addCompanies.jsp?id=<%=c.getId()%>" class="btn edit-btn">Edit</a>
                        <a href="CompanyServlet?action=delete&id=<%=c.getId()%>" class="btn delete-btn">Delete</a>
                    </div>
                    <div class="details">
                        <p><strong>ID:</strong> <%= c.getId() %></p>
                        <p><strong>Name:</strong> <%= c.getName() %></p>
                        <p><strong>Email:</strong> <%= c.getEmail() %></p>
                        <p><strong>Phone:</strong> <%= c.getPhone() %></p>
                        <p><strong>Website:</strong> <%= c.getWebsite() %></p>
                        <p><strong>Address:</strong> <%= c.getAddress() %></p>
                    </div>
                </div>
                <% } %>
            </div>
        </section>

        <!-- Jobs Section -->
        <section id="jobs">
            <h2>Jobs</h2>
            <a href="jobform.jsp" class="btn add-btn">+ Add Job</a>
            <div class="list-container">
                <% for (Job j : jobsList) { %>
                <div class="list-item">
                    <div class="actions">
                        <a href="jobform.jsp?id=<%=j.getId()%>" class="btn edit-btn">Edit</a>
                        <a href="JobServlet?action=delete&id=<%=j.getId()%>" class="btn delete-btn">Delete</a>
                    </div>
                    <div class="details">
                        <p><strong>ID:</strong> <%= j.getId() %></p>
                        <p><strong>Title:</strong> <%= j.getTitle() %></p>
                        <p><strong>Company:</strong> <%= j.getCompanyName() %></p>
                        <p><strong>Location:</strong> <%= j.getLocation() %></p>
                        <p><strong>Salary:</strong> <%= j.getSalary() %></p>
                        <p><strong>Type:</strong> <%= j.getType() %></p>
                    </div>
                </div>
                <% } %>
            </div>
        </section>

    </div>
</div>

<script>
    // Optional: Scroll smoothly to section
    document.querySelectorAll('.sidebar a').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if(target) target.scrollIntoView({ behavior: 'smooth' });
        });
    });
</script>

</body>
</html>
