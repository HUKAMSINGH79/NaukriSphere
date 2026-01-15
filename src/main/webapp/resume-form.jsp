<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Build Your Resume</title>
    <style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #007bff, #33b5e5);
    margin: 0;
    padding: 40px 0;
}

.form-container {
    width: 650px;
    margin: auto;
    background: #ffffff;
    padding: 35px 45px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(25px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    text-align: center;
    font-size: 26px;
    font-weight: 600;
    margin-bottom: 15px;
    color: #007bff;
}

label {
    display: block;
    margin-top: 18px;
    font-weight: 500;
    color: #333;
}

input[type="text"],
input[type="email"],
textarea {
    width: 100%;
    padding: 12px 14px;
    margin-top: 7px;
    border: 1.5px solid #d0d0d0;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
    transition: 0.3s border-color;
    background-color: #f8f9fc;
}

input:focus,
textarea:focus {
    border-color: #007bff;
    background-color: #ffffff;
}

textarea {
    min-height: 85px;
}

.btn-submit {
    margin-top: 25px;
    width: 100%;
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: #fff;
    border: none;
    padding: 14px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 10px;
    cursor: pointer;
    letter-spacing: 0.5px;
    transition: 0.35s;
}

.btn-submit:hover {
    background: linear-gradient(135deg, #0056b3, #003d82);
    transform: translateY(-3px);
}

    </style>
</head>
<body>

<div class="form-container">
    <h2>Create Your Resume</h2>
    <form action="ResumeBuilderServlet" method="post">
        <label>Full Name</label>
        <input type="text" name="full_name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Phone</label>
        <input type="text" name="phone" required>

        <label>Location</label>
        <input type="text" name="location" placeholder="City, Country">

        <label>Career Objective</label>
        <textarea name="objective" placeholder="Your career summary / objective"></textarea>

        <label>Skills</label>
        <textarea name="skills" placeholder="e.g. Java, JSP, Servlets, MySQL, HTML, CSS"></textarea>

        <label>Projects</label>
        <textarea name="projects" placeholder="Describe your main projects"></textarea>

        <label>Experience</label>
        <textarea name="experience" placeholder="Describe your work / internship experience"></textarea>

        <label>Education</label>
        <textarea name="education" placeholder="Degree, College, Passing year, Percentage/CGPA"></textarea>

        <button type="submit" class="btn-submit">Save & View Resume</button>
    </form>
</div>

</body>
</html>
