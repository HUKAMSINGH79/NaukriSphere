<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login | NaukriSphere</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }
    body {
        background: linear-gradient(135deg, #007bff, #00c6ff);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .login-container {
        width: 400px;
        background: #ffffff;
        padding: 30px 35px;
        border-radius: 14px;
        box-shadow: 0 6px 22px rgba(0,0,0,0.25);
        animation: fadeIn 0.6s ease-in-out;
    }
    .title {
        font-size: 28px;
        font-weight: bold;
        color: #007bff;
        text-align: center;
        margin-bottom: 25px;
    }
    .form-control {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #aaa;
        font-size: 16px;
    }
    .btn-login {
        width: 100%;
        background: #007bff;
        padding: 12px;
        font-size: 18px;
        border: none;
        border-radius: 8px;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 14px;
    }
    .btn-login:hover{
        background: #0056b3;
        transform: translateY(-2px);
    }
    .extra {
        margin-top: 12px;
        text-align: center;
    }
    a {
        color: #004d99;
        font-weight: 600;
        text-decoration: none;
    }
    a:hover { text-decoration: underline; }

    @keyframes fadeIn {
        from {opacity:0; transform: translateY(20px);}
        to {opacity:1; transform: translateY(0);}
    }

    @media(max-width: 450px) {
        .login-container { width: 90%; }
        .title { font-size: 24px; }
    }
</style>
</head>

<body>
    <div class="login-container">
        <div class="title">User Login</div>

        <form action="UserLoginServlet" method="post">
            <input type="email" name="email" class="form-control" placeholder="Email" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>

            <button type="submit" class="btn-login">Login</button>
        </form>

        <div class="extra">
            New user? <a href="user_register.jsp">Register Here</a>
        </div>
    </div>
</body>
</html>
