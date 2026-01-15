<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Company Details</title>

    <!-- External CSS file -->
    <link rel="stylesheet" type="text/css" href="addCompanies.css">
</head>

<body>
<div class="container">

    <h2>Create Company Details</h2>

    <form action="CompanyServlet" method="post" class="form-card">

        <label>Company Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="text" name="email">

        <label>Phone Number</label>
        <input type="text" name="phone">

        <label>Website</label>
        <input type="text" name="website">

        <label>Address</label>
        <input type="text" name="address">

        <button type="submit">Save Company</button>

    </form>

</div>
</body>
</html>
