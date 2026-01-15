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

    <form action="insert_company.jsp" method="post">

        <label>Company Name</label>
        <input type="text" name="company_name" required>

        <label>Registration Number</label>
        <input type="text" name="registration_no">

        <label>Industry Type</label>
        <input type="text" name="industry_type">

        <label>Email</label>
        <input type="email" name="email">

        <label>Phone Number</label>
        <input type="text" name="phone_number">

        <label>Address Line 1</label>
        <input type="text" name="address_line1">

        <label>Address Line 2</label>
        <input type="text" name="address_line2">

        <label>City</label>
        <input type="text" name="city">

        <label>State</label>
        <input type="text" name="state">

        <label>Country</label>
        <input type="text" name="country">

        <label>Postal Code</label>
        <input type="text" name="postal_code">

        <label>Website</label>
        <input type="text" name="website_url">

        <button type="submit">Save Company</button>

    </form>

</div>
</body>
</html>
