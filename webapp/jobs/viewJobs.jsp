<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","password");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT j.id, j.title, c.name AS company FROM jobs j JOIN companies c ON j.company_id=c.id");
%>

<h2>Jobs</h2>
<a href="addJob.jsp"><button class="add">Add Job</button></a>
<table>
    <tr>
        <th>ID</th>
        <th>Job Title</th>
        <th>Company</th>
        <th>Actions</th>
    </tr>
    <%
        while(rs.next()) {
    %>
    <tr>
        <td><%=rs.getInt("id")%></td>
        <td><%=rs.getString("title")%></td>
        <td><%=rs.getString("company")%></td>
        <td>
            <a href="editJob.jsp?id=<%=rs.getInt("id")%>"><button class="edit">Edit</button></a>
            <a href="deleteJob.jsp?id=<%=rs.getInt("id")%>" onclick="return confirm('Are you sure?')"><button class="delete">Delete</button></a>
        </td>
    </tr>
    <%
        }
        rs.close(); stmt.close(); conn.close();
    %>
</table>
