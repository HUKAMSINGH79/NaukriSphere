package com.naukrisphere.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    try {
	    	Connection con = DBConnect.getConnection();
	    	PreparedStatement ps = con.prepareStatement("SELECT * FROM registration WHERE email=? AND password=?");
	    	
	    	ps.setString(1, email);
	    	ps.setString(2, password);
	    	ResultSet rs = ps.executeQuery();

			if(rs.next()) {

				out.println("<!DOCTYPE html>");
				out.println("<html lang='en'>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
				out.println("<title>Login Success</title>");
				out.println("<style>");
				out.println("body { margin:0; font-family: Arial, sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; background:#f0f2f5; }");
				out.println(".message-container { text-align:center; background:#fff; padding:30px 50px; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.2); }");
				out.println(".message-container h2 { color: #28a745; margin-bottom: 20px; }");
				out.println(".message-container p { font-size:18px; margin-bottom: 20px; }");
				out.println(".message-container a { text-decoration:none; padding:10px 20px; background:#007bff; color:#fff; border-radius:5px; transition:0.3s; }");
				out.println(".message-container a:hover { background:#0056b3; }");
				out.println("@media (max-width:600px) { .message-container { padding:20px; width:90%; } }");
				out.println("</style>");
				out.println("</head>");
				out.println("<body>");
				out.println("<div class='message-container'>");
				out.println("<h2>Login Successful!</h2>");
				out.println("<p>Welcome, " + rs.getString("name") + "!</p>");
				out.println("<a href='admin.jsp'>Go to Home</a>");
				out.println("</div>");
				out.println("</body></html>");

			} else {
				out.println("<!DOCTYPE html>");
				out.println("<html lang='en'>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
				out.println("<title>Login Failed</title>");
				out.println("<style>");
				out.println("body { margin:0; font-family: Arial, sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; background:#f0f2f5; }");
				out.println(".message-container { text-align:center; background:#fff; padding:30px 50px; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.2); }");
				out.println(".message-container h2 { color: #dc3545; margin-bottom: 20px; }");
				out.println(".message-container a { text-decoration:none; padding:10px 20px; background:#007bff; color:#fff; border-radius:5px; transition:0.3s; }");
				out.println(".message-container a:hover { background:#0056b3; }");
				out.println("@media (max-width:600px) { .message-container { padding:20px; width:90%; } }");
				out.println("</style>");
				out.println("</head>");
				out.println("<body>");
				out.println("<div class='message-container'>");
				out.println("<h2>Invalid Email or Password</h2>");
				out.println("<a href='login.html'>Try Again</a>");
				out.println("</div>");
				out.println("</body></html>");
			}

		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}
	

}
