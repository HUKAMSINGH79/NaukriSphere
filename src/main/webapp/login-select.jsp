<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Choose Login | NaukriSphere</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #007bff, #00c6ff);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: #ffffff;
        width: 400px;
        padding: 30px 35px;
        border-radius: 16px;
        box-shadow: 0px 6px 25px rgba(0, 0, 0, 0.23);
        text-align: center;
        animation: fadeIn 0.6s ease-in-out;
    }

    h2 {
        margin-bottom: 25px;
        font-size: 26px;
        color: #007bff;
        font-weight: 700;
    }

    .btn {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        font-size: 18px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s ease-in-out;
        font-weight: 600;
    }

    .btn-user {
        background: #007bff;
        color: #fff;
    }
    .btn-user:hover {
        background: #0056b3;
        transform: translateY(-3px);
    }

    .btn-admin {
        background: #ff7a00;
        color: #fff;
    }
    .btn-admin:hover {
        background: #cc6300;
        transform: translateY(-3px);
    }

    .logo {
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #003d7a;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>
    <div class="card">
        <div class="logo">NaukriSphere</div>
        <h2>Select Login Type</h2>

        <button class="btn btn-user" onclick="window.location.href='user_login.jsp'">
            <i class="fa fa-user"></i> User Login
        </button>

        <button class="btn btn-admin" onclick="window.location.href='login.html'">
            <i class="fa fa-user-tie"></i> Admin Login
        </button>
    </div>
</body>
</html>
