<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to bottom right, #1B4F72, #F39C12);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 480px;
        background: rgba(255, 255, 255, 0.15);
        padding: 30px;
        border-radius: 15px;
        backdrop-filter: blur(15px);
        -webkit-backdrop-filter: blur(15px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        animation: fadeIn 1s ease-in-out;
        color: white;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 28px;
        color: #fff;
        font-weight: bold;
        text-shadow: 0 2px 6px rgba(0,0,0,0.3);
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #fff;
    }

    input, textarea {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: none;
    margin-bottom: 15px;
    box-sizing: border-box;
    font-size: 16px;

    background: rgba(255,255,255,0.9);  /* Light background */
    color: #000; /* Text black for readability */
    outline: none;
}

input::placeholder, 
textarea::placeholder {
    color: #555; 
}


    textarea {
        height: 140px;
    }

    button {
        width: 100%;
        background: #F39C12;
        color: white;
        padding: 14px;
        border: none;
        border-radius: 8px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #cf830e;
        transform: scale(1.03);
    }

    /* Responsive Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Mobile-Friendly Adjustments */
    @media (max-width: 480px) {
        .container {
            padding: 25px;
        }

        h2 {
            font-size: 24px;
        }
    }
</style>

</head>

<body>
<div class="container">
    <h2>Contact Us</h2>

    <form action="ContactServlet" method="post">
        
        <label>Your Name</label>
        <input type="text" name="name" placeholder="Enter your name" required>

        <label>Email Address</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Phone Number</label>
        <input type="text" name="phone" placeholder="Enter your phone number" required>

        <label>Your Message</label>
        <textarea name="message" placeholder="Type your message here..." required></textarea>

        <button type="submit">Send Message</button>
    </form>
</div>
</body>
</html>
