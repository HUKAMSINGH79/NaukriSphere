<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.naming.*,javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","password");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM companies");
%>

<h2>Companies</h2>
<a href="addCompany.jsp"><button class="add">Add Company</button></a>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    <%
        while(rs.next()) {
    %>
    <tr>
        <td><%=rs.getInt("id")%></td>
        <td><%=rs.getString("name")%></td>
        <td>
            <a href="editCompany.jsp?id=<%=rs.getInt("id")%>"><button class="edit">Edit</button></a>
            <a href="deleteCompany.jsp?id=<%=rs.getInt("id")%>" onclick="return confirm('Are you sure?')"><button class="delete">Delete</button></a>
        </td>
    </tr>
    <%
        }
        rs.close(); stmt.close(); conn.close();
    %>
</table>
