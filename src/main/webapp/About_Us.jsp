<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About - NaukriSphere</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #1B4F72, #154360);
        color: white;
    }

    .header {
        text-align: center;
        padding: 40px 20px;
    }

    .header h1 {
        font-size: 42px;
        color: #F39C12;
        margin-bottom: 10px;
        font-weight: 700;
    }

    .header p {
        font-size: 18px;
        max-width: 700px;
        margin: auto;
        line-height: 1.6;
    }

    .about-section {
        background: white;
        color: #333;
        margin: 20px auto;
        padding: 30px;
        border-radius: 15px;
        max-width: 900px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
    }

    .about-section h2 {
        color: #1B4F72;
        margin-bottom: 15px;
    }

    .about-section p {
        line-height: 1.7;
        font-size: 16px;
    }

    .values {
        margin-top: 20px;
    }

    .value-box {
        background: #F4F6F7;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 15px;
        border-left: 6px solid #F39C12;
    }

    .value-box h3 {
        margin-top: 0;
        color: #1B4F72;
    }

    .team {
        margin-top: 40px;
        text-align: center;
    }

    .team h2 {
        color: #1B4F72;
    }

    .team-members {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 25px;
        margin-top: 20px;
    }

    .member {
        background: #F4F6F7;
        padding: 20px;
        width: 250px;
        border-radius: 12px;
        text-align: center;
        box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
    }

    .member img {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        border: 3px solid #F39C12;
    }

    .member h3 {
        margin: 10px 0 5px;
        color: #1B4F72;
    }

    .back-btn {
        margin: 40px auto;
        display: block;
        width: 200px;
        text-align: center;
        padding: 12px;
        font-size: 18px;
        background: #F39C12;
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }

    .back-btn:hover {
        background: #cf840e;
    }

</style>

</head>
<body>

<div class="header">
    <h1>About NaukriSphere</h1>
    <p>Connecting talented people with the right opportunities. Our mission is to make job search easy, accessible, and transparent for everyone.</p>
</div>

<div class="about-section">
    <h2>Who We Are</h2>
    <p>
        NaukriSphere is a modern job portal designed to help job seekers find the right career opportunities and help companies hire the best talent.
        Our platform is built with simplicity and efficiency in mind—making job search faster and smarter.
    </p>

    <h2>Our Mission</h2>
    <p>
        To provide a seamless and efficient job search platform that connects people with meaningful work.
    </p>

    <div class="values">
        <h2>Our Values</h2>

        <div class="value-box">
            <h3>💡 Innovation</h3>
            <p>We continuously improve our platform with new features and technologies.</p>
        </div>

        <div class="value-box">
            <h3>🤝 Trust</h3>
            <p>Your data is safe and secure with us. We respect your privacy.</p>
        </div>

        <div class="value-box">
            <h3>🚀 Growth</h3>
            <p>Helping individuals and companies grow is our top priority.</p>
        </div>
    </div>

    <div class="team">
        <h2>Our Team</h2>
        <div class="team-members">
            <div class="member">
                <img src="images/Its_Me2.jpg" alt="Team Member">
                <h3>Hukam Singh</h3>
                <p>Founder & Developer</p>
            </div>

            <div class="member">
                <img src="images/Jeetu_Image.jpg" alt="Team Member">
                <h3>Jeetendra Ahirwar</h3>
                <p>Front-End Developer</p>
            </div>

            <div class="member">
                <img src="images/.jpg" alt="Team Member">
                <h3>Rahul Mavi</h3>
                <p>Android Developer</p>
            </div>
        </div>
    </div>
</div>

<a href="HomeServlet" class="back-btn">← Back to Home</a>

</body>
</html>
