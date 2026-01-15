<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Registration | NaukriSphere</title>

<style>
    * { margin:0; padding:0; box-sizing:border-box; font-family:Verdana, sans-serif; }
    body {
        background: linear-gradient(135deg, #00c6ff, #007bff);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }
    .reg-card {
        width: 450px;
        background: #ffffff;
        padding: 25px 35px;
        border-radius: 16px;
        box-shadow: 0 6px 25px rgba(0,0,0,0.28);
        animation: fadeIn 0.7s ease-in-out;
    }
    h2 {
        text-align: center;
        margin-bottom: 18px;
        color: #007bff;
        font-weight: 700;
    }
    .input-box {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border-radius: 7px;
        border: 1px solid #999;
        font-size: 15px;
    }
    .btn-reg {
        width: 100%;
        background: #007bff;
        padding: 12px;
        color: #fff;
        border-radius: 8px;
        border: none;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
        transition: 0.3s;
    }
    .btn-reg:hover {
        background: #0056b3;
        transform: translateY(-2px);
    }
    .login-link {
        margin-top: 12px;
        text-align: center;
    }
    a { text-decoration: none; color: #004085; font-weight: bold; }
    a:hover { text-decoration: underline; }

    @keyframes fadeIn {
        from {opacity:0; transform: translateY(20px);}
        to {opacity:1; transform: translateY(0);}
    }

    @media (max-width: 480px) {
        .reg-card { width: 100%; padding: 20px; }
    }
</style>
</head>

<body>
    <div class="reg-card">
        <h2>Create Account</h2>

        <form action="User_RegisterServlet" method="post" enctype="multipart/form-data">

            <input type="text" name="name" placeholder="Full Name" class="input-box" required>
            <input type="email" name="email" placeholder="Email ID" class="input-box" required>
            <input type="password" name="password" placeholder="Password" class="input-box" required>
            <input type="text" name="mobile" placeholder="Mobile Number" class="input-box">

            <input type="text" name="qualification" placeholder="Qualification" class="input-box">
            <input type="text" name="city" placeholder="City" class="input-box">

            <label><b>Upload Resume :</b></label>
            <input type="file" name="resume" class="input-box">

            <button type="submit" class="btn-reg">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="user_login.jsp">Login</a>
        </div>
    </div>

</body>
</html>
