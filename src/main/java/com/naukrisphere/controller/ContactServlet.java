package com.naukrisphere.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
      try {
    	  String name=request.getParameter("name");
    	  String email=request.getParameter("email");
    	  String phone=request.getParameter("phone");
    	  String message=request.getParameter("message");
    	  
    	  Connection con = DBConnect.getConnection();
    	  
    	  PreparedStatement ps = con.prepareStatement(
    			  "INSERT INTO contact_messages(name,email,phone,message) VALUES(?,?,?,?)");
    	  
    	  ps.setString(1, name);
    	  ps.setString(2, email);
    	  ps.setString(3, phone);
    	  ps.setString(4, message);
    	  
    	  ps.executeUpdate();
    	  
    	  response.sendRedirect("HomeServlet");
      }catch(Exception e) {
    	  e.printStackTrace();
      }
    }
}
