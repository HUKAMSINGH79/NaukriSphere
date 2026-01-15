<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
List<Map<String, String>> jobs = (List<Map<String, String>>) request.getAttribute("jobs");
List<String> searches = (List<String>) request.getAttribute("searches");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Portal</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/Home.css">
</head>
<body>
	<!-- ===== HEADER ===== -->
	<header class="navbar">
		<div class="logo">JOB PORTAL</div>
		<nav class="nav-links">
			<a href="#">Home</a> <a href="#">About</a> <a href="#">Contact</a>
			<button class="login-btn"
				onclick="window.location.href='<%=request.getContextPath()%>/login.html'">Login</button>
		</nav>
	</header>
	<!-- ===== MAIN CONTAINER ===== -->
	<main class="main-container">
		<!-- LEFT SECTION -->
		<section class="left-section">
			<div class="hero">
				<img src="<%=request.getContextPath()%>/images/avatar1.png"
					alt="Person with laptop" class="hero-img">
				<div class="hero-text">
					<h1>
						Find Your<br> <span>Next Job</span>
					</h1>
					<div class="search-bar">
						<input type="text" placeholder="Search for jobs...">
						<button class="search-btn">Search</button>
					</div>
				</div>
			</div>
			<!-- Recent Searches -->
			<div class="recent-searches">
				<h3>Recent Searches</h3>
				<ul>
					<%
					if (searches != null) {
						for (String s : searches) {
					%>
					<li><%=s%></li>
					<%
					}
					}
					%>
				</ul>
			</div>
			<!-- Featured Jobs -->
			<div class="featured-jobs card">
				<h2>Featured Jobs</h2>
				<%
				if (jobs != null) {
					for (Map<String, String> job : jobs) {
				%>
				<div class="job-item">
					<h3><%=job.get("title")%></h3>
					<p><%=job.get("company")%>
						<br>
						<%=job.get("location")%></p>
					<span class="salary">$<%=job.get("salary")%> (<%=job.get("salaryRange")%>)
					</span>
					<form action="ApplyJobServlet" method="post">
						<input type="hidden" name="jobTitle" value="<%=job.get("title")%>">
						<input type="hidden" name="applicantName" value="Hukam Singh">
						<button type="submit" class="apply-btn">Apply Now</button>
					</form>
				</div>
				<%
				}
				} else {
				%>
				<p style="color: red;">No jobs found in database.</p>
				<%
				}
				%>
			</div>
			</section>
			<!-- === RIGHT SIDE === -->
			<aside class="main-right">
				<div class="card">
					<h3>Upload Resume</h3>
					<button>Upload</button>
				</div>
				<div class="card">
					<h3>Job Alerts</h3>
					<button>Subscribe</button>
				</div>
				<div class="card">
					<h3>Top Companies</h3>
					<ul>
						<li>🏢 Google</li>
						<li>🏢 Amazon</li>
						<li>🏢 IBM</li>
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
        // Dark Mode Toggle Script
        const toggle = document.getElementById('darkModeToggle');
        const body = document.body;

        // Check local storage for saved mode
        if (localStorage.getItem('dark-mode') === 'enabled') {
            body.classList.add('dark-mode');
            toggle.checked = true;
        }

        // Toggle dark mode on checkbox change
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