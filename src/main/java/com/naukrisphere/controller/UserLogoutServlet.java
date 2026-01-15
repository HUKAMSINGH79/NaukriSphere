package com.naukrisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UserLogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Remove session data
        }

        response.sendRedirect("login-select.jsp?logout=success");
    }
}
