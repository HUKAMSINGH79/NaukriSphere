package com.naukrisphere.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplyFormServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jobTitle = request.getParameter("jobTitle");
        String companyName = request.getParameter("companyName");
        String applyUrl = request.getParameter("applyUrl");

        request.setAttribute("jobTitle", jobTitle);
        request.setAttribute("companyName", companyName);
        request.setAttribute("applyUrl", applyUrl);

        request.getRequestDispatcher("ApplyForm.jsp").forward(request, response);
    }
}
