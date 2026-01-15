<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.naukrisphere.model.Job"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.naukrisphere.model.Company"%>

<%
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
%>
<%
    if (session.getAttribute("userEmail") == null) {
        response.sendRedirect("user_login.jsp?pleaseLogin");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NaukriSphere</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/Home.css">
</head>
<body>
	<header class="navbar">
		<div class="logo">NaukriSphere</div>
		<nav class="nav-links">
			<a href="#">Home</a> <a href="About_Us.jsp">About</a> 
			<a href="Contact.jsp">Contact</a>
			<a href="UserLogoutServlet" class="logout-btn">Logout</a>
		</nav>
	</header>

	<main class="main-container">
		<section class="left-section">
			<div class="hero">
				<img src="<%=request.getContextPath()%>/images/avatar1.png"
					alt="Person with laptop" class="hero-img">
				<div class="hero-text">
					<h1>
						Find Your<br> <span>Next Job</span>
					</h1>
					<div class="search-bar">
						<form action="Search_Job_Servlet" method="get">
							<input type="text" name="keyword"
								placeholder="Search for jobs...">
							<button type="submit" class="search-btn">Search</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Featured Jobs -->
			<div class="featured-jobs card">
				<h2 style="color: #007bff;">Featured Jobs</h2>

				<% 
        List<Job> jobList = (List<Job>) request.getAttribute("jobs");
        if (jobList != null && !jobList.isEmpty()) {
            for (Job job : jobList) {
    %>
				<div class="job-item">
					<h3><%= job.getTitle() %></h3>
					<p><%= job.getCompanyName() %><br><%= job.getLocation() %></p>
					<span class="salary"><%= job.getSalary() %> (<%= job.getType() %>)</span>
					<!-- ===============================================================================-------- -->
					<form action="ApplyFormServlet" method="post">
						<input type="hidden" name="jobTitle" value="<%= job.getTitle() %>">
						<input type="hidden" name="companyName"
							value="<%= job.getCompanyName() %>"> <input type="hidden"
							name="applyUrl" value="<%= job.getApplyLink() %>">
						<button type="submit" class="apply-btn">Apply Now</button>
					</form>

					<!-- ======================================================================================== -->

					<!-- 	<a
						href="ApplyForm.jsp?title=<%=job.getTitle()%>&company=<%=job.getCompanyName()%>&applyUrl=<%=job.getApplyLink()%>">
						<button class="apply-btn">Apply Now</button>
					</a>
                          -->
				</div>
				<%
				}
				} else {
				%>
				<p style="color: red;">No jobs found.</p>
				<%
				}
				%>
			</div>

		</section>

		<aside class="main-right">
			<div class="card">
				<h3>Resume Builder</h3>
				<a href="resume-form.jsp">
					<button>Build Resume</button>
				</a>
				</div>
				<!-- Job Alerts Section -->
				<div class="card">
					<h3>Job Alerts</h3>

					<form action="SubscribeAlertServlet" method="post">
						<button type="submit" class="alert-btn">Subscribe</button>
					</form>

					<form action="UnsubscribeAlertServlet" method="post"
						style="margin-top: 10px;">
						<button type="submit" class="alert-btn unsubscribe">Unsubscribe</button>
					</form>

					<!-- Success & Error Messages -->
					<c:if test="${param.subscribed eq 'success'}">
						<p style="color: green; font-weight: bold; margin-top: 10px;">
							✔ Subscribed Successfully!</p>
					</c:if>

					<c:if test="${param.subscribed eq 'fail'}">
						<p style="color: red; font-weight: bold; margin-top: 10px;">❌
							Subscription Failed! Try Again.</p>
					</c:if>

					<c:if test="${param.unsubscribed eq 'success'}">
						<p style="color: red; font-weight: bold; margin-top: 10px;">❌
							You have unsubscribed from alerts.</p>
					</c:if>

					<c:if test="${param.alertLogin ne null}">
						<p style="color: blue; font-weight: bold; margin-top: 10px;">
							🔔 Please login to manage Job Alerts!</p>
					</c:if>
				</div>


				<div class="card">
					<h3 style="color: orange;">Top Companies</h3>
					<ul>
						<%
						List<Company> list = (List<Company>) request.getAttribute("companies");
						if (list != null && !list.isEmpty()) {
							for (Company c : list) {
						%>
						<li>🏢 <%=c.getId()%> - <%=c.getName()%></li>
						<%
						}
						} else {
						%>
						<li>No companies available</li>
						<%
						}
						%>
					</ul>
				</div>
		</aside>
	</main>

	<footer class="footer">
		<a href="#">About</a> <a href="#">Terms</a> <a href="#">Privacy
			Policy</a>
		<div class="dark-toggle">
			<label class="switch"> <input type="checkbox"
				id="darkModeToggle"> <span class="slider round"></span>
			</label> <span>Dark Mode</span>
		</div>
	</footer>

	<script>
    const toggle = document.getElementById('darkModeToggle');
    const body = document.body;
    if (localStorage.getItem('dark-mode') === 'enabled') {
        body.classList.add('dark-mode');
        toggle.checked = true;
    }
    toggle.addEventListener('change', () => {
        if (toggle.checked) {
            body.classList.add('dark-mode');
            localStorage.setItem('dark-mode', 'enabled');
        } else {
            body.classList.remove('dark-mode');
            localStorage.setItem('dark-mode', 'disabled');
        }
    });
</script>
</body>
</html>
